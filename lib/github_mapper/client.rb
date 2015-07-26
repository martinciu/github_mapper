module GithubMapper
  class Client

    def initialize(base_url)
      @base_url = base_url
    end

    def get(path)
      router.resolve(:get, path).new(connection.get(path).body).call
    end

    private

    def connection
      @connection ||= Faraday.new(:url => @base_url)
    end

    def router
      @router ||= Router.new
    end

  end

  class Router
    class << self
      def get(path, mapper)
        routes[path] = mapper
      end

      def routes
        @routes ||= {}
      end
    end

    def resolve(method, path)
      self.class.routes[path]
    end

    get "emojis", EmojiMapper
    get "repositories", RepositoryMapper
  end
end