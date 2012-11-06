class ReputationController < ApplicationController
  def new
  end

  def total
    @user.reputations.each {|rep| rep= rep + vote_up - vote_down}
  end
end
