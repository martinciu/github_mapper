module ApiMapper
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
  end
end
