class BlogpostsController < ApplicationController
  skip_before_action :authenticate_user!, only: [:index, :show]

  def index
    @blogposts = Blogpost.order('created_at DESC')
  end

  def show
    @blogpost = Blogpost.find(params[:id])
  end

  private

  def blogpost_params
    params.require(:blogpost).permit(:title, :content, :photo)
  end
end
