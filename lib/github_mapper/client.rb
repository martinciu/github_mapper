module GithubMapper
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get(path)
      response = connection.get(path)
      JSON.parse(response.body).map do |key, value|
        Emoji.new(symbol: key, url: value)
      end
    end

    private

    def connection
      @connection ||= Faraday.new(:url => @base_url)
    end
  end
end