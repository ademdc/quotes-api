class QuotesController < ApplicationController
  skip_before_action :require_login, only: [:random, :daily]
  before_action :set_quote, only: [:show]
  before_action :increment_viewed, only: [:daily]

  def index
    unless @current_user.is_admin
      render json: { error: 'Unauthorized access.' }, status: :not_acceptable
    else
      render json: Quote.all.order('updated_at DESC')
    end
  end

  def show
    render json: @quote
  end

  def create
    return unless @current_user.is_admin

    @quote = Quote.new(quote_params)

    if @quote.save
      render json: { quote: @quote, success: "Successfully added new quote" }
    else
      render json: { errors: @quote.errors.full_messages }, status: :not_acceptable
    end
  end

  def favorites
    ids = FavoriteQuote.by_user(@current_user).map(&:quote_id).uniq.reverse

    render json: Quote.find(ids)
  end

  def set_favorite
    return if FavoriteQuote.where(user_id: @current_user.id, quote_id: params[:quote_id]).present?

    favorite_quote = FavoriteQuote.new(user_id: @current_user.id, quote_id: params[:quote_id])

    if favorite_quote.save
      quote = Quote.find(favorite_quote.quote_id)
      render json: { favorite_quote: quote, success: "Successfully added to favorites" }
    else
      render json: { errors: favorite_quote.errors.full_messages }, status: :not_acceptable
    end
  end

  def random
    render json: Quote.all.sample
  end

  def daily
    render json: Quote.daily
  end

  def set_daily
    @quote = Quote.find(params[:id])
    return unless @quote.present?

    days_from_now = params[:days_from_now] || 0

    if @quote.set_daily!(days_from_now)
      render json: { quote: @quote, success: "Successfully set as a daily quote." }
    else
      render json: { errors: @quote.errors.full_messages }, status: :not_acceptable
    end
  end

  def update
    @quote = Quote.find(params[:id])
    return unless @quote.present?

    if @quote.update(quote_params)
      render json: { quote: @quote, success: "Successfully edited quote." }
    else
      render json: { errors: @quote.errors.full_messages }, status: :not_acceptable
    end
  end

  def destroy
    @quote = Quote.find(params[:id])

    if @quote.destroy
      render json: { quote: @quote, success: "Successfully deleted quote." }
    else
      render json: { errors: @quote.errors.full_messages }, status: :not_acceptable
    end
  end

  protected

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.require(:quote).permit(:id, :text, :author, :category, :image_url)
    end

    def increment_viewed
      current_user.increment_view_counter!
    end
end
