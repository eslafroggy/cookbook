class ApplicationController < ActionController::Base
  protect_from_forgery
  
  
 before_filter :setup_twilio_client

 def setup_twilio_client
  if @twilio_client.nil?
    @twilio_client = Twilio::REST::Client.new("secret","secret") 
  end
end  

def current_user
  if session[:user_id]
    @current_user = User.find(session[:user_id])
  else
    @current_user = nil
    end
  end
   helper_method :current_user
end  