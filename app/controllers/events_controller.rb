class EventController < ApplicationController

before_action :set_event, only: [:show, :edit, :update]

	 def new
        @event = Event.new
    end

	def index
		@event = current_user.event
	end

	def show
	end

	def edit
    end

	def update
    end

    def destroy
      @event = Event.find(params[:id])
      @event.destroy
      redirect_to user_path(current_user)
    end
private

	def set_event
		@event = Event.find(params[:id])

	end

	def event_params
		params.require(:event).permit(:description, :date, :place, :price, :active)

	end

end