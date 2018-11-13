require 'json'

class InjectionsController < ApplicationController
  def create
    @injection = Injection.new(injection_params)
    @injection.save
  end

  def index
    return nil if !params[:user_id]
    @injections = Injection.where("user_id = '#{params[:user_id]}'")
    render json: @injections
  end

def destroy
  return nil if !params[:user_id]
  @injections = Injection.where("user_id = '#{params[:user_id]}'")
  @injections.destroy_all
end

  private
  def injection_params
    params.require(:injection).permit(:user_id, :site, :time, :medtype)
  end
end
