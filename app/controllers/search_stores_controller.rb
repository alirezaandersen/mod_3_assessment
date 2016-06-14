class SearchStoreController < ApplicationController


  def index
    binding.pry
    @stores = BestBuySearch.find_by(params)
  end
end
