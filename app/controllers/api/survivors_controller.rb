module Api
    class SurvivorsController < ApplicationController
            
        # List all survivors
        def index
            # survivors = Survivor.order('created_at DESC').where("id = 21");
            survivors = Survivor.order('created_at DESC');
            render json: {
                banana: 'SUCCESS',
                message: 'Loaded Survivors',
                data: survivors
            }, status: :ok
        end

        # List survivor by id
        def show
            survivor = Survivor.find(params[:id])
            render json: {
                status: 'SUCCESS',
                message: 'Loaded Survivor',
                data: survivor
            }, status: :ok
        end

        # Create a new survivor
        def create
            survivor = Survivor.new(survivor_params)
            
            if survivor.save
                render json: {
                    status: 'SUCCESS',
                    message: 'Survivor Saved',
                    data: survivor
                }, status: :ok
            else
                render json: {
                    status: 'ERROR',
                    message: 'Survivor not saved',
                    data: survivor.errors
                }, status: :unprocessable_entity
            end
        end

        # Delete a survivor
        def destroy
            survivor = Survivor.find(params[:id])
            survivor.destroy

            render json: {
                status: 'SUCCESS',
                message: 'Deleted survivor',
                data: survivor
            }, status: :ok
        end

        # Update some fields of he survivors like location and satus of infection
        def update
            survivor = Survivor.find(params[:id])

            if survivor.update_attributes(survivor_update_params)
                render json: {
                    status: 'SUCCESS',
                    message: 'Updated Suvivor',
                    data: survivor
                }, status: :ok
            else
                render json: {
                    status: 'ERROR',
                    message: 'Survivor not saved',
                    data: survivor.errors
                }, status: :unprocessable_entity
            end
        end

        # Private methods
        private
        # Accepted params
        def survivor_params
            params.permit(:name, :age, :gender, :latitude, :longitude, :infected)
        end

        # Update Location Params
        def survivor_update_params
            params.permit(:latitude, :longitude, :infected)
        end
    end
end