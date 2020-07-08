module Api
    module V1
        class TradesController < ApplicationController

            def create
                itemAmount = Inventory.select(:quantity).where("survivor_id = ? and item_id = ?", params[:sender], params[:item_id_sender]).sum(:quantity)
                totalPriceSender = (Item.select(:value).where("id = ?", params[:item_id_sender]).sum(:value)) * params[:quantity_sender]
                totalPriceReceiver = (Item.select(:value).where("id = ?", params[:item_id_receiver]).sum(:value)) * params[:quantity_receiver]
                
                survivorState = Survivor.all.where()

                puts "---------------"
                puts itemAmount
                puts totalPriceSender
                puts totalPriceReceiver
                puts "---------------"

                if Survivor.exists?(id: params[:sender], infected: false) && Survivor.exists?(id: params[:receiver], infected: false)
                    if itemAmount >= params[:quantity_sender]
                        #valor do inventário é maior
                        if totalPriceSender >= totalPriceReceiver
                            if Inventory.all.where("survivor_id = ? and item_id = ?", params[:survivor_id_receiver], params[:item_id_sender]).empty?
                                amountSending = itemAmount + params[:quantity_sender]
                                Inventory.where("id = ?", params[:sender]).update(quantity: amountSending)
                            else
                                Inventory.create(quantity: params[:quantity_sender], item_id: params[:item_id_sender], survivor_id: params[:sender])
                            end
                        else
                            render json: {
                                status: 'ERROR',
                                message: 'Deny. What youre sending to another survivor theres the price below what youre receiving'
                            }, status: :unprocessable_entity
                        end
                    else
                        # valor do inventário menor
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