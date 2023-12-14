class YearsController < ApplicationController

  def index
    @years = Year.all
    @running_year = Year.where(status: "en cours").last
    finished_years = Year.where(status: "terminé")
    array_years = finished_years.to_a
    @sorted_years = array_years.sort_by { |year| - year.year}
  end

  def show
    @year = Year.find(params[:id])
    all_my_groups = current_user.groups.to_a

    @this_year_groups = all_my_groups.select do |group|
      group.year_id == @year.id
    end

    if @year.status == "terminé"
      winners = RealWinner.where(year_id: @year.id)
      @winner = winners.last.miss_france
    end
  end

end
