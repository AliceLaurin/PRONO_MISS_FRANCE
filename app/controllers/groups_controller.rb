class GroupsController < ApplicationController
  def new
    @group = Group.new
    @year = Year.find(params[:year_id])
  end

  def create
    @year = Year.find(params[:year_id])
    @group = Group.new(params_group)
    @group.year = @year
    if @group.save
      GroupUser.create!(group_id: @group.id, user_id: current_user.idg)
      redirect_to year_group_path(@year, @group)
    else
      render :new, status: :unprocessable_entity
    end
  end


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

  private

  def params_group
    params.require(:group).permit(:name)
  end

end
