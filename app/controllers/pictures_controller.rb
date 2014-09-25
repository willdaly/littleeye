class PicturesController < ApplicationController

  before_filter :authenticate_user!, except: :guess
  layout 'application'

  def new
    @picture = Picture.new
    @missions = Mission.all
  end

  def index
    @picture = Picture.new
    @mission = Mission.find_by_id(params[:id])
    @instagram = Instagram.tag_recent_media(params[:hashtag], {:count => 24})
  end

  def create
    @picture = Picture.new(picture_params)
    @mission = Mission.find_by_id(@picture.mission_id)
    if @picture.save
      flash.notice = "added picture"
      redirect_to edit_mission_path(@mission)
    else
      flash.now[:alert] = "picture could not be saved"
      redirect_to new_picture_path
    end
  end

  def deletepictures
    @pictures = Picture.where(mission_id: params[:id])
  end

  def changetarget
    @pictures = Picture.where(mission_id: params[:id])
  end

  def guess
    picture = Picture.find_by_id(params[:id])
    mission = Mission.find_by_id(picture.mission_id)
    if picture.answer?
      if user_signed_in?
        unless mission.user_id == current_user.id
          current_user.update(score: current_user.score + 1) if current_user
          current_user.save if current_user
        end
      end
    end
  end

  def update
    picture = Picture.find_by_id(params[:id])
    @mission = Mission.find_by_id(picture.mission_id)
    @pictures = Picture.where(mission_id: @mission.id)
    current_target = @pictures.find_by(answer: true)
    current_target.update(answer: false)
    current_target.save
    picture.update(answer: true)
    picture.save
  end

  def destroy
    picture = Picture.find_by_id(params[:id])
    @mission = Mission.find_by_id(picture.mission_id)
    @pictures = Picture.where(mission_id: @mission.id)
    picture.delete()
  end

  private

  def picture_params
    params.require(:picture).permit(:url, :mission_id, :answer)
  end

end
