class MyfifteensController < ApplicationController
    def index
      @year = Year.find(params[:year_id])
      @all_my_fifteens = Myfifteen.where(user_id: current_user, year_id: @year.id)
      all_my_groups = current_user.groups.to_a
      @this_year_groups = all_my_groups.select do |group|
        group.year_id == @year.id
      end
      @my_top_15 = Myfifteen.where(user_id: current_user.id).pluck(:miss_id).uniq
    end

    def new
      @new_fifteen = Myfifteen.new
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
      @new_fifteen = Myfifteen.new(myfifteen_params)
      @year = Year.find(params[:year_id])

      @new_fifteen.miss = Miss.find(params[:myfifteen][:miss_id])
      @new_fifteen.user_id = current_user.id
      @new_fifteen.year_id = @year.id
      existing_guess = Myfifteen.find_by(user_id: current_user.id, my_miss_france_guess: "1")
      existing_guess.update(my_miss_france_guess: "0") if existing_guess.present?

      if  @new_fifteen.save!
        redirect_to year_myfifteens_path
      else
        render :new, status: :unprocessable_entity
      end
    end

    def show
      @myfifteen = Myfifteen.find(params[:id])
    end

    private

    def myfifteen_params
      params.require(:myfifteen).permit(:year_id, :user_id, :miss_id, :my_miss_france_guess)
    end
  end
