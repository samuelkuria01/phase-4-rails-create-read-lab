class PlantsController < ApplicationController
    
    def index 
        plants = Plant.all
        render json: plants
    end


        #Get /plants/:id
    def show
        plant = Plant.find_by(id: params[:id])
        if plant
            render json: plant
        else
            render json: {error: "Plant not found" }, status: :not_found
        end
    end

    #Post /plants/:id
    def create
        plant = Plant.create(plant_params)
        render json: plant, status: :created
    end


    def destroy
        plant = Plant.find_by(id: params[:id])
        if plant
            plant.destroy
            head :no_content
        else 
            render json: {error: "Plant not found"}
        end
    end

    #update 
    def update 
        plant = Plant.find_by(id: params[:id])
        if plant
            plant.update(plant_params)
            render json: plant, status: :accepted
        else
            render json: {error: "Plant not found"}, status: :not_found
        end
    end


    private

    
    def plant_params
        params.permit(:name, :image, :price)
    end
end
