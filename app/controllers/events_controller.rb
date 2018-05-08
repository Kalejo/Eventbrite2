class EventController < ApplicationController

before_action :set_event, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]


	def index
		@event = current_user.event

	end

	def new
        @event = Event.new
    end


    def create
    	@event = current_user.events(event_params)
    		if @event.save
    			redirect_to @event, notice:"Votre événement a été ajouté avec succès"
    		else
    			render :new
    end

	def show
	end

	def edit
    end

	def update
    	if @event.update(event_params)
    		redirect_to @event, notice:"Modification enregistrée..."
    	else
    		render :edit

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