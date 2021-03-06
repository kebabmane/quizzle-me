module Api
 module V1
  class TokensController < Api::BaseController
    #protect_from_forgery with: :null_session
    before_filter :authenticate_user!, :except => [:create]
  	respond_to :json


  def create
    @device = Device.new(device_params)
    #we allow the id to be sent as a parameter when model created
    if device_params[:id]
      @device.id = device_params[:id]
    end
  end


  private
    def set_device
      @device = Device.find(params[:id])
    end

    def device_params
      params.require(:device).permit(:device_id, :device_guid, :device_os, :token, :registration_id, :id)
    end

  end
 end
end
