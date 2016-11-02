class PagesController < ApplicationController

  def index
    @ingredient = params[:recipe]
  end
end
