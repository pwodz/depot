class ApplicationController < ActionController::Base
  # Prevent CSRF attacks by raising an exception.
  # For APIs, you may want to use :null_session instead.
  protect_from_forgery with: :exception
  
  before_action :set_date_loaded
  def set_date_loaded
  	@date_loaded = Time.now
  end

  private

    def current_cart
      Cart.find(session[:cart_id])
  	rescue
  	  cart = Cart.create
  	  session[:cart_id] = cart.id
  	  cart
    end

    def count_entries
      if session[:counter].nil?
        session[:counter] = 0
      end
      session[:counter] += 1
    end

    def reset_counter
      if not session[:counter].nil?
        session[:counter] = 0
      end
    end

end
