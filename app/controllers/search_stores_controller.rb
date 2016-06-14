class SearchStoresController < ApplicationController


  def index
    @stores = BestBuySearch.find_by(params)
  end

  def show
    @store = BestBuySearch.find(params[:id])
  end

  
end
