class MyTop12sController < ApplicationController
  def new
    @my_top_12 = current_user.my_top_12s.first_or_initialize
    @miss_in_my_top = My12Miss.where(my_top_12_id: @my_top_12.id)
    @number_of_miss_in_my_top = My12Miss.where(my_top_12_id: @my_top_12.id).count
    render 'my_top_12s/new'
  end

  # def create
  #   @year = Year.find(params[:year_id])
  #   @my_top_12 = @year.my_top_12s.build(my_top_12_params)

  #   if @my_top_12.save
  #     redirect_to year_my_top_12_path(@year, @my_top_12)
  #   else
  #     render :new, status: :unprocessable_entity
  #   end


  # end

  private

  def my_top_12_params
    params.require(:my_top_12).permit(:user_id, :my_miss_france_guess)
  end
end
