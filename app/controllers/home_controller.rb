class HomeController < ApplicationController
  skip_authorize_resource

  def index
    # we were previously generating a lot of instance variables like
    # @members_count and @interesting_crops in here, but now we call
    # the relevant class methods directly in the view, so that fragment
    # caching will be effective.

    @interesting_members = Member.interesting
      .includes(:gardens).first(3)
    @interesting_crops = Crop.interesting
      .includes(:scientific_names, :photos)
    respond_to do |format|
      format.html # index.html.haml
    end
  end
end
