class AllMeetingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = Meeting.all
  end

  def show
  end

  def day_calendar
    @meetings = Meeting.all
  end

  def list
    @meetings = Meeting.all.page(params[:page]).per(5)
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :place, :description)
    end
end
