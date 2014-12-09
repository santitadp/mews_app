class WelcomeController < ApplicationController
  # GET /index
  def index
  	@entries = Entry.all
  end
end
