class CupsController < ApplicationController
  before_action :set_cup, only: [:show, :update, :destroy]

  # GET /cups
  def index
    @cups = Cup.all

    render json: @cups
  end

  # GET /cups/1
  def show
    render json: @cup
  end

  # POST /cups
  def create
    @cup = Cup.new(cup_params)

    if @cup.save
      render json: @cup, status: :created, location: @cup
    else
      render json: @cup.errors, status: :unprocessable_entity
    end
  end

  # PATCH/PUT /cups/1
  def update
    if @cup.update(cup_params)
      render json: @cup
    else
      render json: @cup.errors, status: :unprocessable_entity
    end
  end

  # DELETE /cups/1
  def destroy
    @cup.destroy
  end

  private
    # Use callbacks to share common setup or constraints between actions.
    def set_cup
      @cup = Cup.find(params[:id])
    end

    # Only allow a trusted parameter "white list" through.
    def cup_params
      params.require(:cup).permit(:title)
    end
end
