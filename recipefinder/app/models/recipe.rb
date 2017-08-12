class Recipe 
	include HTTParty

  server_port = ENV['FOOD2FORK_SERVER_AND_PORT'] || "www.food2fork.com"
  base_uri "http://#{server_port}/api"
  default_params key: ENV['FOOD2FORK_KEY'] = "83dc1196494dc14ec6997deb8d51e96e"
  format :json

  def self.for (keyword)
    get("/search", query: {q: keyword})["recipes"]
  end
end
