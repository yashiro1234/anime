class AnimeTitlesController < ApplicationController
  
  def index
    @animeTitleList = AnimeTitle.all
  end
  def show
    id = params[:id]
    @animeTitleList = AnimeTitle.find_by_tid(id)
    puts @animeTitleList
  end
end

