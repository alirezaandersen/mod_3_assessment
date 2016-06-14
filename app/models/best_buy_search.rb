class BestBuySearch

  attr_reader :store_id, :store_type, :long_name, :city, :distance, :phone, :address, :hours

  def initialize(data)
    @store_id = data[:store_id]
    @store_type= data[:store_type]
    @name = data[:long_name]
    @store = data[:city]
    @store = data[:distance]
    @store = data[:phone]
    @store = data[:address]
    @store = data[:hours]

  end

  def self.service
    BestBuyService.new
  end

  def self.find_by(params)
    data = service.search_stores({
      :zip => params["zip"],
      :raidious => params["distance"]
      })
      binding.pry
    data[:stores].map do |store|
      self.new(store)
    end
    # binding.pry
  end

  end
