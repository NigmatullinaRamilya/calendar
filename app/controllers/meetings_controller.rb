class MeetingsController < ApplicationController
  before_filter :authenticate_user!
  before_action :set_meeting, only: [:show, :edit, :update, :destroy]

  def index
    @meetings = current_user.meetings
  end

  def show
  end

  def day_calendar
    @meetings = current_user.meetings
  end

  def list
    @meetings = current_user.meetings.order(start_time: :desc).page(params[:page]).per(5)
  end

  def new
    @meeting = Meeting.new
  end

  def edit
  end

  def create
    @meeting = current_user.meetings.create(meeting_params)
    respond_to do |format|
      if @meeting.save
        format.html { redirect_to meeting_path(@meeting), notice: 'Meeting was successfully created.' }
      else
        format.html { render :new }
      end
    end
  end

  def update
    respond_to do |format|
      if @meeting.update(meeting_params)
        format.html { redirect_to @meeting, notice: 'Meeting was successfully updated.' }
      else
        format.html { render :edit }
      end
    end
  end

  def destroy
    @meeting.destroy
    respond_to do |format|
      format.html { redirect_to meetings_url, notice: 'Meeting was successfully destroyed.' }
    end
  end

  private
    def set_meeting
      @meeting = Meeting.find(params[:id])
    end

    def meeting_params
      params.require(:meeting).permit(:name, :start_time, :end_time, :place, :description, :avatar)
    end
end
