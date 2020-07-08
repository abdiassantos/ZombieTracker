module Api
    module V1
        class InventoriesController < ApplicationController

            #List all inventories of all survivors
            def index
                inventory = Inventory.order('created_at DESC');
                render json: {
                    status: 'SUCCESS',
                    message: 'Loaded inventories',
                    data: inventory
                }, status: :ok
            end

            # List inventory by survivor_id
            def show
                inventory = Inventory.all.where("survivor_id = ?", params[:id])
                if Survivor.exists?(id: params[:id], infected: false)
                    render json: {
                        status: 'SUCCESS',
                        message: 'Loaded Survivor Inventory',
                        data: inventory
                    }, status: :ok
                else
                    render json: {
                        status: 'ERROR',
                        message: 'Infected, inventory unaccessible',
                        data: "error"
                    }, status: :unprocessable_entity
                end
            end

            # Creating a new inventory, limiting register of any item by 1, 
            # if you try to register another the same item to the same survivor they will deny
            def create
                inventory = Inventory.new(inventory_params)

                if Inventory.all.where("survivor_id = ? and item_id = ?", params[:survivor_id], params[:item_id]).empty?
                    if inventory.save
                        render json: {
                            status: 'SUCCESS',
                            message: 'Inventory Saved',
                            data: inventory
                        }, status: :ok
                    else
                        render json: {
                            status: 'ERROR',
                            message: 'Inventory not saved',
                            data: inventory.errors
                        }, status: :unprocessable_entity
                    end
                else
                    render json: {
                        status: 'ERROR',
                        message: 'The survivor has a inventory, you cant create another one',
                        data: inventory.errors
                    }, status: :unprocessable_entity
                end
            end

            # Inventory params
            private
            def inventory_params
                params.permit(:quantity, :item_id, :survivor_id)
            end

        end
    end
end