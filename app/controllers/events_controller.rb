class EventsController < ApplicationController

before_action :set_event, only: [:show, :edit, :update]
before_action :authenticate_user!, except: [:show]
before_action :require_same_user, only: [:edit, :update]

	def index
		@event = current_user.event

	end

	def new
        @event = Event.new
    end


    def create
    	@event = current_user.events(event_params)
    		if @event.save
    			if params[:images]
                    params[:images].each do |i|
                        @event.photos.create(image: i)
                    end
                end
                @photos = @event.photos
                redirect_to edit_event_path(@event), notice:"Votre événement a été ajouté avec succès"
    		else
    			render :new
    		end
    end

	def show
        @photos = @event.photos

    end

	def edit
        @photos = @event.photos

    end

	def update
    	if @event.update(event_params)
            if params[:images]
                    params[:images].each do |i|
                        @event.photos.create(image: i)
                    end
                end
            @photos = @event.photos
            redirect_to edit_event_path(@event), notice:"Modification enregistrée..."
    	else
    		render :edit
    	end

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
		params.require(:event).permit(:description, :date, :place, :price)
	end

    def require_same_user
        if current_user.id != @event.user_id
            flash[:danger] = "Vous n'avez pas le droit de modifier cette page"
            redirect_to root_path
        end
    end

end