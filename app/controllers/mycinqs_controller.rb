class MycinqsController < ApplicationController

    def index
      @year = Year.find(params[:year_id])
      @mycinqs = Mycinq.where(user_id: current_user, year_id: @year.id).to_a
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
      @my_top_5 = Mycinq.where(user_id: current_user.id).pluck(:miss_id).uniq
    end

    def new
      @mycinq = Mycinq.new
      @year = Year.find(params[:year_id])
      @misses = Miss.joins(:myfifteens)
                    .where(myfifteens: { user_id: current_user.id, year_id: @year.id })
                    .where.not(id: Mycinq.where.not(miss_id: nil).pluck(:miss_id).compact)
      # If there is a miss already chosen in the current Myfive instance, exclude it
      @misses = @misses.where.not(id: @mycinq.miss_id) if @mycinq.miss_id.present?
    end


    def create
      @year = Year.find(params[:year_id])
      @mycinq = Mycinq.new(mycinq_params.merge(user_id: current_user.id, year_id: @year.id))


      @mycinq.miss = Miss.find(params[:mycinq][:miss_id])
      @mycinq.user_id = current_user.id
      @mycinq.year_id = @year.id

      if  @mycinq.save!
        # Reassign @all_my_fifteens after creating a new Myfifteen record
        @mycinqs = Mycinq.where(user_id: current_user, year_id: @year.id).to_a
        # Add debug output

        respond_to do |format|
          format.html { redirect_to year_mycinqs_path(@year) }
          format.turbo_stream
        end


      else
        render :new, status: :unprocessable_entity
      end
    end

    def show

    end

    def destroy
      @mycinq = Mycinq.find(params[:id])
      @mycinq.destroy

      respond_to do |format|
        format.html { redirect_to year_mycinqs_path(@year) }
        format.turbo_stream
      end
    end

    def others
      @year = Year.find(params[:id])
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
      @my_top_5 = Mycinq.where(user_id: current_user.id).pluck(:miss_id).uniq

    end

    private

    def mycinq_params
      params.require(:mycinq).permit(:year_id, :user_id, :miss_id)
    end
  end
