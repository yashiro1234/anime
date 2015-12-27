class TitlesController < ApplicationController
  
  def index
    @titleList = Title.all
  end
  def show
    tid = params[:id]
    @title = Title.find(tid)
    @subTitleList = @title.sub_titles
    #user = User.login_user
    #@channelIdList = Channel.select("channel_id").where(channel_group_id: user.channel_group_id)
    @programList = User.find(1).programs
    #@staffList = Title.includes(staff_relates: [:staff, :staff_roll]).references(:staff, :staff_roll)
    #@staffList = Title.first.staffs.select([:id, :name]).joins(:staff_rolls).select(staff_rolls: [:id, :name])
  end
  def edit

  end
  def new

  end
end

