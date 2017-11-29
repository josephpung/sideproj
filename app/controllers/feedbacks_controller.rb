class FeedbacksController < ApplicationController
  def create
    render json: params
    newFeedBack = Feedback.new


  end
  def index

  end

  def show
  end
end
