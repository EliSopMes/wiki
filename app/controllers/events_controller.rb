class EventsController < ApplicationController
  before_action :authenticate_user!
  # , except: %i[index show]

  def index
    @events = Event.all
  end

  def show
    @event = Event.find(params[:id])
  end

  def new
    @event = Event.new
    @bookers = User.where(user_type: 1)
    @adls = User.where(user_type: 4)
  end

  def create
    @event = Event.new(event_params)
    if @event.save
      redirect_to event_path(@event)
    else
      render :new, status: :bad_request
    end
  end

  def update
    @event = Event.find(params[:id])
    @event.update(event_params)
    redirect_to event_path(@event)
  end

  def calendar
    if(user_signed_in?)
      @events = Event.all
    end
  end

  private

  def event_params
    params.require(:event).permit(:title, :start_time, :end_time, :event_type, :booker, :adl, :tdl, :organizer,
                                  :pre_number_of_guests, :post_number_of_guests, :other_info, :staff_info, :get_in_info,
                                  :broken_info, :gastro_info, :set_up_info, :catering_info, :security_info,
                                  :cloakroom_info, :technical_info, :box_office_info, :post_event_info, :rooms,
                                  :invoice_status, :schedule, :deliveries, :pick_ups, :get_in, :fire_place, :self_payment,
                                  :catering, :fire_watch, :cloakroom, :external_staff_hours, :attachments)
  end
end
