class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [ :home ]

  def home
  end

  def realfifteen
    @year = Year.find(params[:id])
    @misses = Miss.where(year_id: @year.id, fifteen: true)
    @myfifteens = Myfifteen.where(user_id: current_user, year_id: @year.id).to_a
    @miss_ids_from_myfifteens = @myfifteens.map(&:miss_id)
    @miss_ids_from_misses = @misses.map(&:id)
    @common_miss_ids = @miss_ids_from_myfifteens & @miss_ids_from_misses
    @number_of_common_misses = @common_miss_ids.count
    @points = @number_of_common_misses * 4
    @score = Score.where(year_id:@year.id, user_id: current_user).last.points
    @score = @points
  end

  def realcinq
    @year = Year.find(params[:id])
    @misses = Miss.where(year_id: @year.id, five: true)
    @mycinqs = Mycinq.where(user_id: current_user, year_id: @year.id).to_a
    @miss_ids_from_mycinqs = @mycinqs.map(&:miss_id)
    @miss_ids_from_misses = @misses.map(&:id)
    @common_miss_ids = @miss_ids_from_mycinqs & @miss_ids_from_misses
    @number_of_common_misses = @common_miss_ids.count
    @points = @number_of_common_misses * 4
    @score = Score.where(year_id:@year.id, user_id: current_user).last.points
    @score = @points
  end

  def realclassement
    @year = Year.find(params[:id])
  end

  def myclassement
    @year = Year.find(params[:id])
  end
end
