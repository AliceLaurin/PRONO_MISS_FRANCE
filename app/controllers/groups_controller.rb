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
    @misses = Miss.where(year_id: @year.id, fifteen: true)

    @group_users = @group.group_users
    @group_users.each do |group_user|
      # calcul points top 15
      @myfifteens = Myfifteen.where(user_id: group_user.user_id, year_id: @year.id).to_a
      @common_miss_ids_15 = @myfifteens.map(&:miss_id) & @misses.map(&:id)
      @number_of_common_misses_15 = @common_miss_ids_15.count
      @points_15 = @number_of_common_misses_15 * 4

      # calcul points top 5
      @mycinqs = Mycinq.where(user_id: group_user.user_id, year_id: @year.id).to_a
      @common_miss_ids_5 = @mycinqs.map(&:miss_id) & @misses.map(&:id)
      @number_of_common_misses_5 = @common_miss_ids_5.count
      @points_5 = @number_of_common_misses_5 * 4



      @score = Score.where(year_id: @year.id, user_id: group_user.user_id).last
      @score.points = @points_15 + @points_5
      @score.save
    end

    # Fetch the updated scores
    @scores = Score.where(year_id: @year.id, user_id: @group_users.pluck(:user_id))
                    .order(points: :desc)
                    .to_a
  end


  private

  def params_group
    params.require(:group).permit(:name)
  end

end
