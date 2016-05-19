class HomeController < ApplicationController
  skip_before_action :require_login, only: [:index]

  def index
    @top_twenty = TunesTakeout.top_suggestions(20) 
  end
end
