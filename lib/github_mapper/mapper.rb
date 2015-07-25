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
        load_json >> @map >> factory
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
end
