class My12MissesController < ApplicationController

  def new
    @my_12_miss = My12Miss.new
    @my_top_12 = My12Miss.find(params[:my_top_12_id])
  end

  def create
    @my_12_miss = My12Miss.find(params[:id])
    @my12_miss.my_top_12 = My12Miss.find(params[:my_top_12_id])

    if @my_12_miss.save!
      redirect_to year_my_top_12(@year)
    else
      render :new, status: :unprocessable_entity
    end
  end


end
