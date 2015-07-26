module GithubMapper
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get(path)
      mapper_for(path).new(connection.get(path).body).call
    end

    private

    def mapper_for(path)
      case path
        when "/emojis" then EmojiMapper
        when "/repositories" then RepositoryMapper
      end
    end

    def connection
      @connection ||= Faraday.new(:url => @base_url)
    end
  end

end