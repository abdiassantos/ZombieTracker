module Api
    class ReportsController < ApplicationController
        
        def index
            percentInfected = "Infected Survivors: " + String(((Survivor.all.where("infected = true").count(:id)) * 100) / Survivor.all.count(:id)) + "%"
            percentNonInfected = "Infected Survivors: " + String(((Survivor.all.where("infected = false").count(:id)) * 100) / Survivor.all.count(:id)) + "%"
            totalPointsLost = "Total Points Lost: " + String(Survivor.all.where("infected = true").count(:id))
            
            Inventory.find_each do |item|
                @avarageAmount = String((Inventory.all.where("item_id = ?", item.id).count(:id)) / (Survivor.all.count(:id)))
                puts @avarageAmount
            end

            render json: {
                NonInfectedSurvivors: percentNonInfected,
                InfectedSurvivors: percentInfected,
                ItemPerSurvivor: @avarageAmount,
                PointLost: totalPointsLost
            }
        end
    end
end