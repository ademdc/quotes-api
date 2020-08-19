class UsersController < ApplicationController
  respond_to :json

  before_action :get_user, only: [:favorite_quotes, :view_counters]

  def index
    render json: User.all
  end

  def set_push_token
    @current_user.set_push_token(params[:push_token])
    if @current_user.save
      render json: { user: @current_user, userId: @current_user.id, push_token: @current_user.push_token }
    else
      render json: { errors: @current_user.errors.full_messages }, status: :not_acceptable
    end
  end

  def favorite_quotes
    render json: { user: @user, userId: @user.id, favorite_quotes: @user.favorite_quotes.map(&:quote_id).uniq.reverse }
  end

  def view_counters
    render json: { user: @user, userId: @user.id, view_counters: @user.view_counters }
  end

  private

  def get_user
    @user = User.find(params[:user_id])
  end
end