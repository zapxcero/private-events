# frozen_string_literal: true

class AttendancesController < ApplicationController
  before_action :authenticate_user!

  def create
    @attendance = Attendance.create(attendance_params)
  end

  private

  def attendance_params
    params.require(:attendance).permit(:attended_event_id, :attendee_id)
  end
end
