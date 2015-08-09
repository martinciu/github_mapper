module ApiMapper
  class Client

    attr_writer :router

    def initialize(base_url)
      @base_url = base_url
      @router = Router.new
    end

    def get(path)
      @router.resolve(:get, path).mapper.new.call(JSON.parse(connection.get(path).body))
    end

    def patch(path, body)
      @router.resolve(:patch, path).mapper.new.call(JSON.parse(connection.patch(path, body.to_json).body))
    end

    def authorization(authorization)
      @authorization = authorization
    end

    private

    def connection
      @connection ||= Faraday.new(url: @base_url) do |conn|
        conn.adapter :net_http
        conn.headers["Content-Type"] = 'application/json'
        conn.headers["Accept"] = 'application/json'
        conn.headers["Authorization"] = @authorization if @authorization
      end
    end
  end

end