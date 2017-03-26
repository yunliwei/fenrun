class LudansController < ApplicationController
  def index
    @ludan=Ludan.all
  end

end
