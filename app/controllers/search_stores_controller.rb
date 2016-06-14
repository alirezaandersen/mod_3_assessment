class SearchStoresController < ApplicationController


  def index
    @stores = BestBuySearch.find_by(params)
  end

  def show = 
end
