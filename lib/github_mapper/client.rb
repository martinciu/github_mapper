module GithubMapper
  class Client
    def initialize(base_url)
      @base_url = base_url
    end

    def get(path)
      [Emoji.new(symbol: "+1", url: "https://assets-cdn.github.com/images/icons/emoji/unicode/1f44d.png?v5")]
    end
  end
end