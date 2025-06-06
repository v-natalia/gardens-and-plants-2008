class PlantsController < ApplicationController

  def create
    @garden = Garden.find(params[:garden_id])
    @plant = Plant.new(plant_params)
    @plant.garden = @garden
    if @plant.save
      redirect_to garden_path(@garden)
    else
      # render :new ne marchera pas, il n'y pas de new de plants
      render "gardens/show", status: :unprocessable_entity
    end
  end

  def destroy #  delete plant/:id
    @plant = Plant.find(params[:id])
    @plant.destroy
    redirect_to garden_path(@plant.garden), status: :see_other
  end

  private
  def plant_params
    # permettre les choses qu'on passe dans le form
    params.require(:plant).permit(:name, :image_url)
  end
end
