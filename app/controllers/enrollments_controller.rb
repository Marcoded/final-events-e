class EnrollmentsController < ApplicationController


  def new
    @enrollment = Enrollment.new
   
    
  end


  def create
    #test
    #test
    @event = Event.find(params[:event_id])
    #@enrollment = @event.enrollments.build(attendee: @user)
    @enrollment = @event.enrollments.build(attendee: current_user)
    redirect_to @event, notice: "You have been enrolled." if @enrollment.save
  end

  def destroy
    @event = Event.find(params[:event_id])
    @enrollment = Enrollment.where(attended_event_id: @event, attendee: current_user).first

    return redirect_to @event, notice: "You're not enrolled for this event'." unless @enrollment

    if @enrollment.destroy
      redirect_to event_path
    else
      flash.now[:error] = "There was an error with your submission."
    end
  end


end