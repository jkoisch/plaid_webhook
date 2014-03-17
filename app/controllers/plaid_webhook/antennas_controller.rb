require_dependency "plaid_webhook/application_controller"

require 'plaid/plaid_object'

module PlaidWebhook
  class AntennasController < ApplicationController
    before_action :set_antenna, only: [:show, :edit, :update, :destroy]

    def webhook
      request.body.rewind

      @antenna = Antenna.new(:access_token => params[:antenna][:access_token], :payload => request.body.read)

      if @antenna.save
        render json: @antenna, status: :created
      else
        render json: @antenna.errors,
               status: :unprocessable_entity
      end
    end

    # GET /antennas
    def index
      @antennas = Antenna.all
    end

    # GET /antennas/1
    def show
    end

    # GET /antennas/new
    def new
      @antenna = Antenna.new
    end

    # GET /antennas/1/edit
    def edit
    end

    # POST /antennas
    def create
      request.body.rewind
      @antenna = Antenna.new(:access_token => params[:antenna][:access_token], :payload => request.body_stream.read)

      if @antenna.save
        redirect_to @antenna, notice: 'Antenna was successfully created.'
      else
        render action: 'new'
      end
    end

    # PATCH/PUT /antennas/1
    def update
      if @antenna.update(antenna_params)
        redirect_to @antenna, notice: 'Antenna was successfully updated.'
      else
        render action: 'edit'
      end
    end

    # DELETE /antennas/1
    def destroy
      @antenna.destroy
      redirect_to antennas_url, notice: 'Antenna was successfully destroyed.'
    end

    private
      # Use callbacks to share common setup or constraints between actions.
      def set_antenna
        @antenna = Antenna.find(params[:id])
      end

      # Only allow a trusted parameter "white list" through.
      def antenna_params
        params.require(:antenna).permit(:asset_token, :payload)
      end
  end
end
