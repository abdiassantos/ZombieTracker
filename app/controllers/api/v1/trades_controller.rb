module Api
    module V1
        class TradesController < ApplicationController

            def create
                subItemAmountSender = Inventory.select(:quantity).where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_sender]).sum(:quantity)
                subItemAmountReceiver = Inventory.select(:quantity).where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_receiver]).sum(:quantity)
                incItemAmountSender = Inventory.select(:quantity).where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_receiver]).sum(:quantity)
                incItemAmountReceiver = Inventory.select(:quantity).where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_sender]).sum(:quantity)
                totalPriceSender = (Item.select(:value).where("id = ?", params[:item_id_sender]).sum(:value)) * params[:quantity_sender]
                totalPriceReceiver = (Item.select(:value).where("id = ?", params[:item_id_receiver]).sum(:value)) * params[:quantity_receiver]
                
                survivorState = Survivor.all.where()

                

                if Survivor.exists?(id: params[:sender], infected: false) && Survivor.exists?(id: params[:receiver], infected: false)
                    if subItemAmountSender >= params[:quantity_sender]
                        if totalPriceSender >= totalPriceReceiver
                            
                            # Decrement all the items that sender and receiver are trading
                            if Inventory.all.where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_sender]).exists?
                                subAmountSending = Integer(subItemAmountSender) - Integer(params[:quantity_sender])
                                Inventory.where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_sender]).update(quantity: subAmountSending)
                            else
                                render json: {
                                    status: 'ERROR',
                                    message: 'No enough item that youre trying to trade on your inventory'
                                }, status: :unprocessable_entity
                            end
                            if Inventory.all.where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_receiver]).exists?
                                subAmountReceiving = Integer(subItemAmountReceiver) - Integer(params[:quantity_receiver])
                                Inventory.where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_receiver]).update(quantity: subAmountReceiving)
                            else
                                render json: {
                                    status: 'ERROR',
                                    message: 'No enough item that youre trying to trade on your inventory'
                                }, status: :unprocessable_entity
                            end

                            # Updating what items that the sender and receiver has, or creating a new inventory if they doesnt
                            if Inventory.all.where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_sender]).exists?
                                incAmountReceiving = Integer(incItemAmountReceiver) + Integer(params[:quantity_sender])

                                Inventory.where("survivor_id = ? and item_id = ?", params[:receiver], params[:item_id_receiver]).update(quantity: incAmountReceiving)
                            else
                                Inventory.create(quantity: params[:quantity_sender], item_id: params[:item_id_sender], survivor_id: params[:receiver])
                            end
                            if Inventory.all.where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_receiver]).exists?
                                incAmountSending = Integer(incItemAmountSender) + Integer(params[:quantity_receiver])
                                
                                Inventory.where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_sender]).update(quantity: incAmountSending)
                            else
                                Inventory.create(quantity: params[:quantity_receiver], item_id: params[:item_id_receiver], survivor_id: params[:sender])
                            end

                        else
                            render json: {
                                status: 'ERROR',
                                message: 'Deny. What youre sending to another survivor theres the price below what youre receiving'
                            }, status: :unprocessable_entity
                        end
                    else
                        render json: {
                            status: 'ERROR',
                            message: 'No enough item on your inventory'
                        }, status: :unprocessable_entity
                    end
                else
                    render json: {
                        status: 'ERROR',
                        message: 'Deny. Survivor infected'
                    }, status: :unprocessable_entity
                end
            end


            private
            def trade_params
                params.permit(:sender, :receiver, :item_id_sender, :item_id_receiver, :quantity_sender, :quantity_receiver)
            end
        end
    end
end