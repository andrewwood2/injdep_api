require 'json'

class InjectionsController < ApplicationController
  def create
    @injection = Injection.new(injection_params)
    @injection.save
  end

  private
  def injection_params
    params.require(:injection).permit(:user_id, :site, :time, :medtype)
  end
end
