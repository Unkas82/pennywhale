class TicketsController < ApplicationController
  before_action :set_ticket, only: %i[ show edit update destroy ]
  before_action :set_sprint

  # GET /sprints/:id/tickets or /sprints/:id/tickets.json
  def index
    @tickets = Ticket.all
  end

  # GET /sprints/:id/tickets/1 or /sprints/:id/tickets/1.json
  def show
  end

  # GET /sprints/:id/tickets/new
  def new
    # @sprint = Sprint.find(params[:sprint_id])
    @ticket = Ticket.new
  end

  # GET /sprints/:id/tickets/1/edit
  def edit
  end

  # POST /sprints/:id/tickets or /tickets.json
  def create
    @ticket = Ticket.new(ticket_params)
    @ticket.sprint_id = params[:sprint_id]

    respond_to do |format|
      if @ticket.save
        format.html { redirect_to sprint_ticket_url(@sprint.id, @ticket), notice: "Ticket was successfully created." }
        format.json { render :show, status: :created, location: @ticket }
      else
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # PATCH/PUT /sprints/:id/tickets/1 or /sprints/:id/tickets/1.json
  def update
    respond_to do |format|
      if @ticket.update(ticket_params)
        format.html { redirect_to sprint_ticket_url(@sprint, @ticket), notice: "Ticket was successfully updated." }
        format.json { render :show, status: :ok, location: @ticket }
      else
        format.html { render :edit, status: :unprocessable_entity }
        format.json { render json: @ticket.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /sprints/:id/tickets/1 or /sprints/:id/tickets/1.json
  def destroy
    @ticket.destroy

    respond_to do |format|
      format.html { redirect_to sprint_tickets_url(@sprint), notice: "Ticket was successfully destroyed." }
      format.json { head :no_content }
    end
  end

  private

  def set_ticket
    @ticket = Ticket.find(params[:id])
  end

  def set_sprint
    @sprint = Sprint.find(params[:sprint_id])
  end

  def ticket_params
    params.require(:ticket).permit(:name, :description, :state, :due_date)
  end
end
