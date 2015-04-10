class StoreController < ApplicationController
  def index
  	@products = Product.order(:title)
  	#@count = count_entries
  	count_entries
  end
end
