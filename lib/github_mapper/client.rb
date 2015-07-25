module GithubMapper
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get(path)
      EmojiMapper.new(connection.get(path).body).call
    end

    private

    def connection
      @connection ||= Faraday.new(:url => @base_url)
    end
  end

end