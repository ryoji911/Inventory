class EventsController < ApplicationController
  before_action :authenticate_user!, except: :index



  def index
    @events = Event.all
  end

  def new
    @event = Event.new
  end

  def create
    Event.create(event_parameter)
    redirect_to root_path
  end

  private

  def event_parameter
    params.require(:event).permit(:title, :content, :start_time)
  end

end
