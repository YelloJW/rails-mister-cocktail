class DosesController < ApplicationController
  def new
    @dose = Dose.new
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def create
    @dose = Dose.new(dose_params)
    @cocktail = Cocktail.find(params[:cocktail_id])
    @dose.cocktail = @cocktail
    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render :new
    end
  end

  def edit
  end

  def update
  end

  def destroy
    @dose = Dose.find(params[:id])
    @cocktail = Cocktail.find(@dose.cocktail_id)
    @dose.delete
    redirect_to cocktail_path(@cocktail)
  end

  def dose_params
    params.require(:dose).permit(:description, :ingredient_id)
  end
end
