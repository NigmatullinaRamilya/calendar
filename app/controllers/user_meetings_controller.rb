class UserMeetingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @user = User.find(params[:id])
    @meetings = @user.meetings
  end

  def day_calendar
    @user = User.find(params[:id])
    @meetings = @user.meetings
  end

  def list
    @user = User.find(params[:id])
    @meetings = @user.meetings.order(start_time: :desc).page(params[:page]).per(5)
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :place, :description, :avatar)
    end
end
