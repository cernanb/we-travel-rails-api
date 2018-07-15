class Api::V1::WeworksController < ApplicationController
  before_action :set_wework, only: [:show]

  def index
    @weworks = Wework.all

    render "weworks/index.json.jbuilder"
  end

  def show
    render "weworks/show.json.jbuilder"
  end
  
  private
  def set_wework
    @wework = Wework.find(params[:id])
  end
end
