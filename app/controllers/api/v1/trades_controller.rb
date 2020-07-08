module Api
    module V1
        class TradesController < ApplicationController

            def create
                itemAmount = Inventory.all.where("survivor_id = ? and item_id = ?", params[:sender], params[:item_sender]).sum(:quantity)

                if itemAmount >= params[:quantity_sender]
                    #valor do inventário é maior
                else
                    # valor do inventário menor
                    render json: {
                        status: 'ERROR',
                        message: 'No enough item on your inventory'
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