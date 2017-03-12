class Recipe
    include HTTParty
    ENV["FOOD2FORK_KEY"] = 'c4b035bf25b48797502461e5b1ea53ed'
    hostport = ENV['FOOD2FORK_SERVER_AND_PORT'] || 'www.food2fork.com'
  base_uri "http://#{hostport}/api"
  default_params key: ENV["FOOD2FORK_KEY"]
  format :json

  def self.for term
      get("/search", query: { q: term})["recipes"]
  end

end
