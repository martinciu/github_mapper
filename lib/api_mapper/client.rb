module ApiMapper
  class Client

    attr_writer :router

    def initialize(base_url)
      @base_url = base_url
      @router = Router.new
    end

    def get(path)
      @router.resolve(:get, path).mapper.new(connection.get(path).body).call
    end

    def authorization(authorization)
      @authorization = authorization
    end

    private

    def connection
      @connection ||= Faraday.new(url: @base_url) do |conn|
        conn.adapter :net_http
        conn.headers["Authorization"] = @authorization if @authorization
      end
    end
  end

end