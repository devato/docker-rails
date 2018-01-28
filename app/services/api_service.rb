require 'rest-client'

class ApiService

  USER = 'user'
  PASS = 'pass'
  API_BASE_URL = 'docker-app1.dev:3001'

  def self.get_posts(args={})
    uri = "#{API_BASE_URL}/posts.json"
    rest_resource = RestClient::Resource.new(uri, USER, PASS)
    posts = rest_resource.get
    @posts = JSON.parse(posts, symbolize_names: true)
  end

  def self.show_post(post_id)
    uri = "#{API_BASE_URL}/posts/#{post_id}.json"
    rest_resource = RestClient::Resource.new(uri, USER, PASS)
    post = rest_resource.get
    @post = JSON.parse(post, symbolize_names: true)
  end

end
