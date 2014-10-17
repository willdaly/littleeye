class MissionsController < ApplicationController

  before_action :authenticate_user!, except: [:show]
  before_action :correct_user, only: :edit

  def new
    @mission = current_user.missions.build
  end

  def create
    @mission = current_user.missions.build(name: params[:name], clue: params[:clue])
    if @mission.save
      @worked = true
      string = params[:clue]
      array = string.split(" ")
      hashtag = array.join
      instagram = Instagram.tag_recent_media(hashtag, {:count => 28})
      @urlarray = instagram.map!{ |ig| ig.images}
    end
  end

  def show
    @mission = Mission.find_by_id(params[:id])
    @pictures = Picture.where(mission_id: @mission.id).shuffle
  end

  def edit
    @mission = Mission.find_by_id(params[:id])
    @pictures = Picture.where(mission_id: @mission.id)
  end

  def update
    @mission = Mission.find_by_id(params[:id])
    if @mission.update(name: params[:name])
      # flash.notice = "changed name to #{@mission.name}"
    else
      flash.notice = "Your changes could not be saved."
      render 'edit'
    end
  end

  def updateclue
    @mission = Mission.find_by_id(params[:id])
    @pictures = Picture.where(mission_id: @mission.id)
    if @mission.update(clue: params[:clue])
      # flash.notice = "changed target of #{@mission.name} to #{@mission.clue}"
    else
      flash.notice = "Your changes could not be saved."
      render 'edit'
    end
  end

  def destroy
    mission = Mission.find_by_id(params[:id])
    # flash.notice = "#{mission.name} deleted"
    mission.delete()
    redirect_to root_path
  end

  private

  def correct_user
    @mission = current_user.missions.find_by_id(params[:id])
    redirect_to mission_path(@mission) if @mission.nil?
  end

end
