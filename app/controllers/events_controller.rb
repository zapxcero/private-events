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
  end

  def show
    @event = Event.find(params[:id])
    @attendance = Attendance.new
  end

  private

  def event_params
    params.require(:event).permit(:location, :date)
  end
end
