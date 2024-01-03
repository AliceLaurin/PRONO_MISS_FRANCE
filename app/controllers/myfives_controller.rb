class MyfivesController < ApplicationController

    def index
      @year = Year.find(params[:year_id])
      @myfives = Myfive.where(user_id: current_user, year_id: @year.id).to_a
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
      @my_top_5 = Myfive.where(user_id: current_user.id).pluck(:miss_id).uniq
    end

    def new
      @myfive = Myfive.new
      @year = Year.find(params[:year_id])
      @myfifteens = Myfifteen.where(user_id: current_user, year_id: @year.id).to_a
      @misses = @myfifteens.map do |myfifteen|
        myfifteen.miss
      end
    end


    def create
      @year = Year.find(params[:year_id])
      @myfive = Myfive.new(myfive_params.merge(user_id: current_user.id, year_id: @year.id))


      @myfive.miss = Miss.find(params[:myfive][:miss_id])
      @myfive.user_id = current_user.id
      @myfive.year_id = @year.id

      if  @myfive.save!
        # Reassign @all_my_fifteens after creating a new Myfifteen record
        @myfives = Myfive.where(user_id: current_user, year_id: @year.id).to_a
        # Add debug output

        respond_to do |format|
          format.html { redirect_to year_myfives_path(@year) }
          format.turbo_stream
        end


      else
        render :new, status: :unprocessable_entity
      end
    end

    def show

    end

    def destroy
      @myfive = Myfive.find(params[:id])
      @myfive.destroy

      respond_to do |format|
        format.html { redirect_to year_myfives_path(@year) }
        format.turbo_stream
      end
    end

    def others
      @year = Year.find(params[:id])
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
      @my_top_5 = Myfive.where(user_id: current_user.id).pluck(:miss_id).uniq

    end

    private

    def myfive_params
      params.require(:myfive).permit(:year_id, :user_id, :miss_id)
    end
  end
