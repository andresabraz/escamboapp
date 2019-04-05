class Site::HomeController < ApplicationController
  layout "site"

  def index
    @categories = Category.order('description').all
  end
end
