module GithubMapper
  class Mapper
    def initialize(origin)
      @origin = origin
    end

    def call
       self.class.transformation.call(@origin)
    end

    class << self
      def transformation
        load_json >> mapping >> factory
      end

      def map(transformation)
        @map = transformation
      end

      def entity(klass)
        @entity = klass
      end

      private

      def factory
        t(:factory, @entity)
      end

      def load_json
        t(:load_json)
      end

      def t(*args)
        Functions[*args]
      end
    end
  end

  class HashMapper < Mapper
    def self.mapping
      @map
    end
  end

  class ArrayMapper < Mapper
    def self.mapping
      t(:map_array, t(:symbolize_keys) >> @map)
    end
  end

end
