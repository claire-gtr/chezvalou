class PagesController < ApplicationController
  skip_before_action :authenticate_user!, only: [:home, :legals]

  def home
    @blogposts = Blogpost.order('created_at DESC').first(3)
  end

  def legals
  end
end
