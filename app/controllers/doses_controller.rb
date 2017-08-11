class DosesController < ApplicationController
  before_action :find_cocktail, only: [:create]

  def create
    # @dose = Dose.new(dose_params)
    # @dose.cocktail = @cocktail
    @dose = @cocktail.doses.new(dose_params)

    if @dose.save
      redirect_to cocktail_path(@cocktail)
    else
      render "cocktails/show"
    end

  end

  def destroy
    @dose = Dose.find(params[:id])
    @dose.destroy
    redirect_to @dose.cocktail
  end

private

  def find_cocktail
    @cocktail = Cocktail.find(params[:cocktail_id])
  end

  def dose_params
    params.require(:dose).permit(:ingredient_id, :description)
  end
end
