class CategoriesController < ApplicationController

  def new
    @category = Category.new
    @year = Year.find(params[:year_id])
    @miss = Miss.find(params[:miss_id])
  end

  def create
    @miss = Miss.find(params[:miss_id])

    @year = Year.find(params[:year_id])

    # Find the existing category for the user and miss
    existing_category = Category.find_by(user: current_user, miss: @miss)

    # If an existing category is found, delete it
    existing_category.destroy if existing_category.present?

    @category = Category.new(params_category)
    @category.miss = @miss
    @category.user = current_user
    if @category.save!
      redirect_to year_misses_path(@year)
    else
      render "misses/show" , status: :unprocessable_entity
    end
  end


  private

  def params_category
    params.require(:category).permit(:critere)
  end


end
