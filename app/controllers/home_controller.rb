require 'uri'

class HomeController < ApplicationController  
  
  skip_before_action  :verify_authenticity_token
  
  def index
  end

  def about
  end
  
  def shorten_link
    redirect_to :action => 'index' unless request.post?
    
    if request.post?
      custom = params[:custom].blank? ? nil : params[:custom]
			#If the "original" path isn't a proper URL, raise an alert
			original = URI.parse(params[:original])
      raise "Invalid URL" unless original.kind_of? URI::HTTP or original.kind_of? URI::HTTPS
			#Create the URL in memory but don't save it
			#@url = Url.new(:original => uri.to_s)
			
			redirect_to :action => "about" unless Link.shorten(original.to_s, custom)
    end
  end
end