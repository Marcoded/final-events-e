class EventsController < ApplicationController

    before_action :authenticate_user!


    def show
        @event = Event.find(params[:id])
    end


    def index
        @events = Event.all
    end

    def new
        @event = Event.new
    end

    def create
        @event = current_user.created_events.build(event_params)
        if @event.save  
            flash[:notice] = 'Event was successfully created.'
            redirect_to @event
        else
            render :new
            flash[:error] = 'There was a problem creating the event.'

        end
    end

    private

    def event_params
        params.require(:event).permit(:name, :location, :date)
    end
end
