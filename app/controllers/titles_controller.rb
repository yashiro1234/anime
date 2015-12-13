class TitlesController < ApplicationController
  
  def index
    @titleList = Title.all
  end
  def show
    tid = params[:id]
    @title = Title.find_by_tid(tid)
    @subTitleList = SubTitle.where(tid: tid)
    @programList = Program.where(tid: tid)
  end
  def edit

  end
  def new

  end
end

