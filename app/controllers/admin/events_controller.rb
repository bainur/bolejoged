class Admin::EventsController < ApplicationController
  before_action :set_admin_event, only: [:show, :edit, :update, :destroy]

  # GET /admin/events
  def index
    @events = Event.all
  end

  # GET /admin/events/1
  def show
  end

  # GET /admin/events/new
  def new
    @event = Event.new
  end

  # GET /admin/events/1/edit
  def edit
  end

  # POST /admin/events
  def create
    @event = Event.new(admin_event_params)

    if @event.save
      redirect_to admin_events_path, notice: 'Event was successfully created.'
    else
      render :new
    end
  end

  # PATCH/PUT /admin/events/1
  def update
    if @event.update(admin_event_params)
      redirect_to admin_events_path, notice: 'Event was successfully updated.'
    else
      render :edit
    end
  end

  # DELETE /admin/events/1
  def destroy
    @event.destroy
    redirect_to admin_events_url, notice: 'Event was successfully destroyed.'
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_admin_event
      @event = Event.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def admin_event_params
      params.require(:event).permit(:sport_category_id, :name, :start_date, :end_date, :status, :lat, :lang, :price)
    end
end
