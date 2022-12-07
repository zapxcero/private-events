# frozen_string_literal: true

class EventsController < ApplicationController
  before_action :authenticate_user!, only: %i[new create]
  def index
    @events = Event.all
  end

  def create
    @user = current_user
    @event = @user.events.create(event_params)
    redirect_to @user
  end

  def new
    @user = current_user
    @event = @user.events.build
  end

  def edit
    @event = Event.find(params[:id])
  end
  def update
    @user = current_user
    @event = Event.find(params[:id])

    if @event.update(event_params)
      redirect_to @user
    else
      render :edit, status: :unprocessable_entity
    end
  end


  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new
  end

  def destroy
    @user = current_user
    @event = @user.events.find(params[:id])
    @event.destroy
    redirect_to @user
  end

  private

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
