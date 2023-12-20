class MyTop12sController < ApplicationController

  def new
    @my_top_12 = MyTop12.new
    @year = Year.find(params[:year_id])
  end

  def create
    @my_top_12 = MyTop12.find(params[:id])

    @year = Year.find(params[:year_id])

    if @my_top_12.save!
      redirect_to year_my_top_12(@year)
    else
      render :new, status: :unprocessable_entity
    end
  end


end
