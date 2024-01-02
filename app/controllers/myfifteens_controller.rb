class MyfifteensController < ApplicationController

    def index
      @year = Year.find(params[:year_id])
      @myfifteens = Myfifteen.where(user_id: current_user, year_id: @year.id).to_a
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select { |group| group.year_id == @year.id }
      @my_top_15 = Myfifteen.where(user_id: current_user.id).pluck(:miss_id).uniq
    end

    def new
      @myfifteen = Myfifteen.new
      @year = Year.find(params[:year_id])
      @misses = Miss.where(year_id: @year.id)
                    .joins("LEFT JOIN myfifteens ON misses.id = myfifteens.miss_id AND myfifteens.user_id = #{current_user.id}")
                    .where("myfifteens.id IS NULL")
      @categories = Category::CATEGORIES
      @selected_category = params[:category]

      if @selected_category.present?
        @misses = @misses.joins(:categories).where(categories: { critere: @selected_category })
      end

    end


    def create
      @year = Year.find(params[:year_id])
      @myfifteen = Myfifteen.new(myfifteen_params.merge(user_id: current_user.id, year_id: @year.id))


      @myfifteen.miss = Miss.find(params[:myfifteen][:miss_id])
      @myfifteen.user_id = current_user.id
      @myfifteen.year_id = @year.id
      existing_guess = Myfifteen.find_by(user_id: current_user.id, my_miss_france_guess: "1")
      existing_guess.update(my_miss_france_guess: "0") if existing_guess.present?

      if  @myfifteen.save!
        # Reassign @all_my_fifteens after creating a new Myfifteen record
        @myfifteens = Myfifteen.where(user_id: current_user, year_id: @year.id).to_a
        # Add debug output
        puts "@all_my_fifteens after reassignment: #{@myfifteens.inspect}"

        respond_to do |format|
          format.html { redirect_to year_myfifteens_path(@year) }
          format.turbo_stream
        end


      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @myfifteen = Myfifteen.find(params[:id])
    end


    def destroy
      @myfifteen = Myfifteen.find(params[:id])
      @myfifteen.destroy

      respond_to do |format|
        format.html { redirect_to year_myfifteens_path(@year) }
        format.turbo_stream
      end
    end

    private

    def myfifteen_params
      params.require(:myfifteen).permit(:year_id, :user_id, :miss_id, :my_miss_france_guess)
    end
  end
