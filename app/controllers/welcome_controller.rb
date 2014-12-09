class WelcomeController < ApplicationController
  # GET /index
  def index
  	@entries = Entry.limit(10).order(created_at: :desc)
  end
end
