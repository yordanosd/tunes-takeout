class SuggestionsController < ApplicationController
  def index
    # shows top 20 suggestions, ranked by total number of favorites
  end

  def search
    @result = TunesTakeout.search_results(params["search"])
    redirect_to user_path(id: params["id"], suggestions_search: params["search"])
  end

  def favorites
    @result = TunesTakeout.favorites_by_user_id(params["user_id"])
    redirect_to user_favorites_path(params["user_id"])

  end

  def favorite
    # adds a suggestion into the favorite list for the signed-in User. This requires interaction with the Tunes & Takeout API.
  end

  def unfavorite
    # removes a suggestion from the favorite list for the signed-in User. This requires interaction with theTunes & Takeout API.
  end
end
