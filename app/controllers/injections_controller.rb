require 'json'

class InjectionsController < ApplicationController

  before_action :authenticate_user!

  def create
    current_user.injections.create(injection_params)
  end

  def index
    render json: current_user.injections
  end

def destroy
  current_user.injections.destroy_all
end

  private
  def injection_params
    params.require(:injection).permit(:site, :time, :medtype)
  end
end
