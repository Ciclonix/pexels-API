class StaticPagesController < ApplicationController
  def home
    client = Pexels::Client.new(ENV["pexels_api_key"])
    collection_id = params[:search]
    begin
      @collection = client.collections[collection_id].media
    rescue Pexels::APIError => e
      puts e.message
      @collection = []
    end
  end
end
