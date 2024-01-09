class MissesController < ApplicationController

  def index
    @year = Year.find(params[:year_id])
    all_misses = Miss.where(year_id: @year.id)

    # Find miss_ids with the desired category for the current user
    miss_ids_with_category = Category.where(user_id: current_user)
                                    .pluck(:miss_id)
                                    .uniq

    # Exclude misses with category for the current user
    @active_record_instances = all_misses.where.not(id: miss_ids_with_category)

    # Filter misses based on the search query
    if params[:query].present?
      @active_record_instances = @active_record_instances
                                   .where("LOWER(region) LIKE ?", "%#{params[:query].downcase}%")
    end

    #  test pour faire comme myfifteens
    @categories = Category.where(user_id: current_user)

    @sorted_misses = @active_record_instances.sort_by { |miss| -miss.region }
    @my_hot_misses = Category.where(user_id: current_user, critere: "bombe")
    @my_hot_misses_sorted = @my_hot_misses.sort_by { |category| - category.miss.region }
    @my_ok_misses = Category.where(user_id: current_user, critere: "mignonne")
    @my_ok_misses_sorted = @my_ok_misses.sort_by { |category| - category.miss.region }
    @my_bof_misses = Category.where(user_id: current_user, critere: "pas ouf")
    @my_bof_misses_sorted = @my_bof_misses.sort_by { |category| - category.miss.region }
    @my_berk_misses = Category.where(user_id: current_user, critere: "deg")
    @my_berk_misses_sorted = @my_berk_misses.sort_by { |category| - category.miss.region }

    respond_to do |format|
      format.html
      format.text { render partial: "misses/list", locals: { misses: @misses }, formats: [:html] }
    end
  end

  # def show
  #   @miss = Miss.find(params[:id])
  #   @year = Year.find(params[:year_id])
  #   @category = Category.new(miss: @miss)
  # end

end
