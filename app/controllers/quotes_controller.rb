class QuotesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show, :random]
  before_action :set_quote, only: [:show]

  def index
    render json: Quote.all
  end

  def show
    render json: @quote
  end

  def create
    @quote = Quote.create(quote_params)
  end

  def favorites
    ids = FavoriteQuote.by_user(@current_user).map(&:quote_id).uniq
    render json: Quote.find(ids)
  end

  def set_favorite
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

  protected

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.permit(:text, :author, :category)
    end
end