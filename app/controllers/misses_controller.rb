class MissesController < ApplicationController

  def index
    @misses= Miss.all
  end

end
