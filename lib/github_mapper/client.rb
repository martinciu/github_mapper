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

  class EmojiMapper
    def initialize(origin)
      @origin = origin
    end

    def call
      transformation.call(@origin)
    end

    private

    def transformation
      t(:load_json) >> t(:structure, :symbol, :url) >> t(:factory, Emoji)
    end

    def t(*args)
      Functions[*args]
    end
  end

  module HashTransformations
    def self.structure(hash, key_name, value_name)
      hash.map { |key, value| { key_name => key, value_name => value } }
    end
  end

  module Factory
    def self.factory(array, klass)
      array.map { |attributes| klass.new(attributes) }
    end
  end

  module Functions
    extend Transproc::Registry
    import :load, from: JSON, as: :load_json
    import HashTransformations
    import Factory
  end

end