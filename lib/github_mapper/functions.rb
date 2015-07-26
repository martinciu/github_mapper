module GithubMapper
  module Functions
    extend Transproc::Registry

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

    import :load, from: JSON, as: :load_json
    import Transproc::HashTransformations
    import Transproc::ArrayTransformations
    import HashTransformations
    import Factory
  end
end
