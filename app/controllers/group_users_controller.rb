class GroupUsersController < ApplicationController

  def new
    @group_user = GroupUser.new
    @group = Group.find(params[:group_id])
    @group_users = GroupUser.where(group_id: @group.id)
    @year = @group.year

  end

  def create
    @group_user = GroupUser.new(group_user_params)
    @group = Group.find_by(id: @group_user.group_id)

    if @group
      @group_user.group = @group
      @group_user.user_id = current_user.id
      @year = @group.year

      if @group_user.save
        redirect_to year_group_path(@year, @group)
      else
        render :new, status: :unprocessable_entity
      end
    else
      render :new, status: :unprocessable_entity
    end
  end

  private

  def group_user_params
    params.require(:group_user).permit(:group_id, :user_id)
  end


end
