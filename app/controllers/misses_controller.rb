class MissesController < ApplicationController

  def index
    @misses = Miss.all
    @sorted_misses = @misses.sort_by { |miss| - miss.region }
    @my_hot_misses = Category.where(user_id: current_user, type: "bombe")
    @my_ok_misses = Category.where(user_id: current_user, type: "mignonne")
    @my_bof_misses = Category.where(user_id: current_user, type: "pas ouf")
    @my_berk_misses = Category.where(user_id: current_user, type: "deg")
  end

end
