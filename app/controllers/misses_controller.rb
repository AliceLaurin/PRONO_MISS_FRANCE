class MissesController < ApplicationController

  def index
    @year = Year.find(params[:year_id])
    @misses = Miss.where(year_id: @year.id)

    @my_categories = Category.where(user_id: current_user)
    miss_with_category = @my_categories.map do |category|
      category.miss
    end

    result_array = @misses.reject { |obj| miss_with_category.include?(obj) }
    ids = result_array.map(&:id)
    @active_record_instances = Miss.where(id: ids)

# Now, active_record_instances is an ActiveRecord::Relation containing the desired instances


    # Filter misses based on the search query
    if params[:query].present?
      @active_record_instances = @active_record_instances.where("LOWER(region) LIKE ?", "%#{params[:query].downcase}%")
    end

    @sorted_misses = @active_record_instances.sort_by { |miss| - miss.region }
    @my_hot_misses = Category.where(user_id: current_user, critere: "bombe")
    @my_ok_misses = Category.where(user_id: current_user, critere: "mignonne")
    @my_bof_misses = Category.where(user_id: current_user, critere: "pas ouf")
    @my_berk_misses = Category.where(user_id: current_user, critere: "deg")
    respond_to do |format|
      format.html
      format.text { render partial: "misses/list", locals: { misses: @misses }, formats: [:html] }
    end

  end

  def show
    @miss = Miss.find(params[:id])
    @year = Year.find(params[:year_id])
    @category = Category.new(miss: @miss)
  end

end
