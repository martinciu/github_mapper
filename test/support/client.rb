module TestClient
  private

  def client
    ApiMapper::Client.new('https://api.github.com').tap do |client|
      client.router = GithubMapper::Router.new
    end
  end
end