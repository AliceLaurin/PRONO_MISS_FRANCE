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

    all_misses = Miss.where(year_id: @year.id)
    miss_ids_with_category = Category.where(user_id: current_user)
                                    .pluck(:miss_id)
                                    .uniq
    @active_record_instances = all_misses.where.not(id: miss_ids_with_category)
    if params[:query].present?
      @active_record_instances = @active_record_instances
                                   .where("LOWER(region) LIKE ?", "%#{params[:query].downcase}%")
    end
    
    @sorted_misses = @active_record_instances.sort_by { |miss| -miss.region }
    @my_hot_misses = Category.where(user_id: current_user, critere: "bombe")
    @my_hot_misses_sorted = @my_hot_misses.sort_by { |category| - category.miss.region }
    @my_ok_misses = Category.where(user_id: current_user, critere: "mignonne")
    @my_ok_misses_sorted = @my_ok_misses.sort_by { |category| - category.miss.region }
    @my_bof_misses = Category.where(user_id: current_user, critere: "pas ouf")
    @my_bof_misses_sorted = @my_bof_misses.sort_by { |category| - category.miss.region }
    @my_berk_misses = Category.where(user_id: current_user, critere: "deg")
    @my_berk_misses_sorted = @my_berk_misses.sort_by { |category| - category.miss.region }


    if @category.save
      all_misses = Miss.where(year_id: @year.id)
      miss_ids_with_category = Category.where(user_id: current_user).pluck(:miss_id).uniq
      active_record_instances = all_misses.where.not(id: miss_ids_with_category)
      @sorted_misses = active_record_instances.sort_by { |miss| -miss.region }
      respond_to do |format|
        format.html { redirect_to year_misses_path(@year) }
        format.turbo_stream
      end
    else
      render :new, status: :unprocessable_entity
    end
  end


  private

  def params_category
    params.require(:category).permit(:critere)
  end


end
