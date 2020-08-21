class FeelingsController < ApplicationController
  respond_to :json

  def index
    render json: Feeling.all
  end

  def create_user_feeling
    user_feeling = UserFeeling.create(user_id: @current_user.id, feeling_id: params[:feeling_id])

    if user_feeling
      render json: user_feeling
    else
      render json: { message: 'Error occured' }
    end
  end

  def latest_feeling
    latest_feeling = UserFeeling.for_user(params[:user_id]).last

    render json: latest_feeling
  end

  def user_feeling
    user_feeling = UserFeeling.where(user_id: @current_user.id, feeling_id: params[:feeling_id]).last

    render json: user_feeling
  end
end