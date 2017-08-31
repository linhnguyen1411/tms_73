# StaticPagesController class
class StaticPagesController < ApplicationController
  def home
    @courses = Course.paginate page: params[:page],
      per_page: Settings.paginate_page
  end
end
