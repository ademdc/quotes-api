class QuotesController < ApplicationController
  skip_before_action :require_login, only: [:index, :show]
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
    render json: Quote.limit(2)
  end

  protected

    def set_quote
      @quote = Quote.find(params[:id])
    end

    def quote_params
      params.permit(:text, :author, :category)
    end
end