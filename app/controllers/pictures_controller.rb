class PicturesController < ApplicationController

  before_filter :authenticate_user!, except: :guess
  layout 'application'

  def new
    @picture = Picture.new
    @missions = Mission.all
  end

  def index
    @picture = Picture.new
    @missions = current_user.missions
    @instagram = Instagram.tag_recent_media(params[:hashtag], {:count => 24})
    render :index
  end

  def create
    @picture = Picture.new(picture_params)
    mission = Mission.find_by_id(@picture.mission_id)
    if @picture.save
      flash.notice = "added picture"
      redirect_to edit_mission_path(mission)
    else
      flash.now[:alert] = "picture could not be saved"
      redirect_to new_picture_path
    end
  end

  def guess
    picture = Picture.find_by_id(params[:id])
    if picture.answer?
      current_user.update(score: current_user.score + 1) if current_user
      current_user.save if current_user
    end
  end

  def destroy
    picture = Picture.find_by_id(params[:id])
    @mission = Mission.find_by_id(picture.mission_id)
    picture.delete()
    redirect_to @mission
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :mission_id, :answer)
  end

end
