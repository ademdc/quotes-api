class FeelingsController < ApplicationController
  include FeelingHelper
  respond_to :json

  before_action :set_user, only: :latest_feelings
  before_action :get_period, only: [:user_feeling, :for_period]

  def index
    render json: Feeling.all.order(:id)
  end

  def create_user_feeling
    user_feeling = UserFeeling.create(user_id: @current_user.id, feeling_id: params[:feeling_id])

    if user_feeling
      User.feeling_update_notification(@current_user.companion)
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
    user_feelings = UserFeeling
                      .for_user(params[:user_id])
                      .for_period(@period)
                      .where(feeling_id: params[:feeling_id])

    render json: user_feelings
  end

  def for_period
    user_feeling = UserFeeling.for_user(params[:user_id]).for_period(@period)
    feeling_id, count = user_feeling.group(:feeling_id).count.max_by { |k,v| v }

    render json: { feeling: get_feeling(feeling_id), count: count }
  end

  private

  def get_feeling(feeling_id)
    Feeling.find(feeling_id) rescue nil
  end

  def get_period
    @period = calculate_period params[:period]
  end

  def set_user
    @user = User.find(params[:user_id]) rescue @current_user
  end
end