class QuotesController < ApplicationController
  skip_before_action :require_login, only: [:show, :random, :daily]
  before_action :set_quote, only: [:show]

  def index
    unless @current_user.is_admin
      render json: { error: 'Unauthorized access.' }, status: :not_acceptable
    else
      render json: Quote.all
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
    ids = FavoriteQuote.by_user(@current_user).map(&:quote_id).uniq
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

  protected

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.permit(:text, :author, :category, :image_url)
    end
end