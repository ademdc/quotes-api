class FeelingsController < ApplicationController
  respond_to :json

  before_action :set_user, only: :latest_feelings

  def index
    render json: Feeling.all.order(:id)
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
    latest_feeling = UserFeeling.for_user(@user.id)&.last
    partner_feeling = UserFeeling.for_user(@user.companion&.id)&.last

    render json: { latest_feeling: latest_feeling, partner_feeling: partner_feeling }
  end

  def user_feeling
    user_feelings = UserFeeling.for_user(params[:user_id]).where(feeling_id: params[:feeling_id])
    render json: user_feelings
  end

  private

  def set_user
    @user = User.find(params[:user_id])
  end
end