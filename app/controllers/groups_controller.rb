class GroupsController < ApplicationController
  def show
    @group = Group.find(params[:id])
    @year = Year.find(params[:year_id])
    @scores = []
    @group_users = @group.group_users
    @group_users.each do |group_user|
      @scores << Score.where(year_id:@year.id, user_id: group_user.user_id).to_a
    end
    unless @scores.flatten.empty?
      @sorted_scores = @scores.sort_by { |score| - score.last.points }
    end
  end
end
