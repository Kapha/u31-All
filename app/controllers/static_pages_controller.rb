class StaticPagesController < ApplicationController
  def home
    if signed_in?
      if defined?(@z)
        @z = @z + 20
      else
        @z = 20
      end
      @micropost  = current_user.microposts.build
      require 'will_paginate/array'
      if current_user.feed.count <= @z
      @feed_items = current_user.feed
      else
      @feed_items = current_user.feed.drop(current_user.feed.count-@z)
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
