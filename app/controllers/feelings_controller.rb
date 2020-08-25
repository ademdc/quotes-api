class FeelingsController < ApplicationController
  respond_to :json

  before_action :set_user, only: :latest_feelings

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

  def latest_feelings
    latest_feeling = UserFeeling.for_user(@user.id).last.feeling
    partner_feeling = UserFeeling.for_user(@user.companion&.id).last.feeling

    render json: { latest_feeling: latest_feeling, partner_feeling: partner_feeling }
  end

  def user_feeling
    user_feeling = UserFeeling.where(user_id: @current_user.id, feeling_id: params[:feeling_id]).last

    render json: user_feeling
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end