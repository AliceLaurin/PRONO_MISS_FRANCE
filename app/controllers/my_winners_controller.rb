class MyWinnersController < ApplicationController

  def index
    @year = Year.find(params[:year_id])
    @my_winners = MyWinner.where(user_id: current_user, year_id: @year.id).to_a
    all_my_groups = current_user.groups.to_a
    @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
    @my_winner = MyWinner.where(user_id: current_user.id).pluck(:miss_id).uniq
  end

  def new
    @my_winner = MyWinner.new
    @year = Year.find(params[:year_id])
    @misses = Miss.joins(:mycinqs)
                  .where(mycinqs: { user_id: current_user.id, year_id: @year.id })
                  .where.not(id: MyWinner.where.not(miss_id: nil).pluck(:miss_id).compact)

    @misses = @misses.where.not(id: @my_winner.miss_id) if @my_winner.miss_id.present?
  end


  def create
    @year = Year.find(params[:year_id])
    @my_winner = MyWinner.new(my_winner_params.merge(user_id: current_user.id, year_id: @year.id))


    @my_winner.miss = Miss.find(params[:my_winner][:miss_id])
    @my_winner.user_id = current_user.id
    @my_winner.year_id = @year.id

    if  @my_winner.save!
      # Reassign @all_my_fifteens after creating a new Myfifteen record
      @my_winners = MyWinner.where(user_id: current_user, year_id: @year.id).to_a
      # Add debug output

      respond_to do |format|
        format.html { redirect_to year_my_winners_path(@year) }
        format.turbo_stream
      end


    else
      render :new, status: :unprocessable_entity
    end
  end

  def show

  end

  def destroy
    @my_winner = MyWinner.find(params[:id])
    @my_winner.destroy

    respond_to do |format|
      format.html { redirect_to year_my_winners_path(@year) }
      format.turbo_stream
    end
  end

  def others
    @year = Year.find(params[:id])
    all_my_groups = current_user.groups.to_a
    @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
    @my_winner= MyWinner.where(user_id: current_user.id).pluck(:miss_id).uniq

  end

  private

  def my_winner_params
    params.require(:my_winner).permit(:year_id, :user_id, :miss_id)
  end
end
