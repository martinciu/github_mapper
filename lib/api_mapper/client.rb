module ApiMapper
  class Client

    attr_writer :router

    def initialize(base_url)
      @base_url = base_url
      @router = Router.new
    end

    def get(path)
      @router.resolve(:get, path).new(connection.get(path).body).call
    end

    private

    def connection
      @connection ||= Faraday.new(:url => @base_url)
    end
  end

end