class StaticPagesController < ApplicationController
  def home
    if signed_in?
      @micropost  = current_user.microposts.build
      require 'will_paginate/array'
      if current_user.feed.count <= 20
      @feed_items = current_user.feed
      else
      @feed_items = current_user.feed.drop(current_user.feed.count-20)
      end
    end
  end

  def help
  end

  def about
  end

  def contact
  end
end
