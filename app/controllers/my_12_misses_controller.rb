class My12MissesController < ApplicationController
  def new
    @my_top_12 = MyTop12.find(params[:my_top_12_id])
    @my_12_miss = My12Miss.new
  end

  def create
    @my_top_12 = MyTop12.find(params[:my_top_12_id])
    @my_12_miss = @my_top_12.my_12_misses.build(params_my_12_miss)

    if @my_12_miss.save
      redirect_to year_my_top_12_path(@year, @my_top_12)
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def params_my_12_miss
    params.require(:my_12_miss).permit(:miss_id)
  end
end
