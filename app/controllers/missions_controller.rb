class MissionsController < ApplicationController

  before_action :authenticate_user!, except: [:show, :begin]
  before_action :correct_user, only: :edit

  def new
    @mission = current_user.missions.build
  end

  def create
    @mission = current_user.missions.build(name: params[:name], clue: params[:clue])
    if @mission.save
      flash.notice = "#{@mission.name} created"
      @missions = Mission.all
      instagram = Instagram.tag_recent_media(params[:clue], {:count => 24})
      @urlarray = instagram.map!{ |ig| ig.images.thumbnail.url}
    else
      flash.now[:alert] = "Your mission could not be created"
      render :new
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
    if @mission.update(clue: params[:clue])
      flash.notice = "added clue to #{@mission.name}"
      redirect_to mission_path(@mission)
    else
      flash.notice = "Your changes could not be saved."
      render 'edit'
    end
  end

  def destroy
    mission = Mission.find_by_id(params[:id])
    flash.notice = "#{mission.name} deleted"
    mission.delete()
    redirect_to root_path
  end

  private

  def correct_user
    @mission = current_user.missions.find_by_id(params[:id])
    redirect_to mission_path(@mission) if @mission.nil?
  end

end
