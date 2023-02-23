class EventsController < ApplicationController

    before_action :authenticate_user!
    
    def new
        @event = Event.new
    end

    def create
       @event =  current_user.created_events.build(event_params)
        if @event.save
            redirect_to @event, notice: "Event was successfully created."
        else
            flash.now[:alert] = "There were an error creating this event"
            redirect_to @event 
        end
    end


    def show
        @event = Event.find(params[:id])  
    end


    def index
        @events = Event.all
    end

    private

    def event_params
        params.require(:event).permit(:name,:date,:location)
    end

end
