class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:landing]
  layout false, only: [:landing]

  def landing
  end
end
