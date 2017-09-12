class TagsController < ApplicationController
  def show
    @tag = Tag.find_by(name: params[:id])
    @post = @tag.posts
  end
end
