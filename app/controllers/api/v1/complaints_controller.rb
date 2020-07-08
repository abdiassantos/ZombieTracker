module Api
    module V1
        class ComplaintsController < ApplicationController
            
            # List all complaints
            def index
                # survivors = Survivor.order('created_at DESC').where("id = 21");
                complaints = Complaint.order('created_at DESC');
                render json: {
                    status: 'SUCCESS',
                    message: 'Loaded Complaints',
                    data: complaints
                }, status: :ok
            end

            # List survivor by survivor_id
            def show
                complaint = Complaint.all.where("survivor_id = ?", params[:id]).sum(:survivor_id)
                render json: {
                    status: 'SUCCESS',
                    message: 'Loaded Survivor Complaints',
                    data: complaint
                }, status: :ok
            end

            # Create a new survivor
            def create
                complaint = Complaint.new(complaint_params)
                
                if complaint.save
                    render json: {
                        status: 'SUCCESS',
                        message: 'Complaint Saved',
                        data: complaint
                    }, status: :ok
                else
                    render json: {
                        status: 'ERROR',
                        message: 'Complaint not saved',
                        data: complaint.errors
                    }, status: :unprocessable_entity
                end

                check_complaint_sum = Complaint.all.where("survivor_id = ?", params[:survivor_id]).sum(:survivor_id)

                if check_complaint_sum >= 5
                    Survivor.where("id = ?", params[:survivor_id]).update(infected: 't')
                end
            end



            #Accepted params
            private
            def complaint_params
                params.permit(:quantity, :survivor_id)
            end

        end
    end
end