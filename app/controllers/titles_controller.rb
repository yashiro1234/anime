class TitlesController < ApplicationController
  
  def index
    @titleList = Title.all
  end
  def show
    tid = params[:id]
    @title = Title.find_by(tid: tid)
    #@subTitleList = SubTitle.where(tid: tid)
    @subTitleList = @title.sub_titles
    #user = User.login_user
    Channel.find(:all)
    @channelIdList = Channel.select("ch_id").where(ch_gid: user.ch_gid)
    @programList = Program.where(tid: tid, ch_id: @channelIdList)
  end
  def edit

  end
  def new

  end
end

