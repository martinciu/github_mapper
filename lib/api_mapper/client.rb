module ApiMapper
  class Client

    attr_writer :router

    def initialize(base_url)
      @base_url = base_url
      @router = Router.new
    end

    def get(path, body = nil)
      mapper(:get, path).call(response(:get, path).body)
    end

    def patch(path, body = nil)
      mapper(:patch, path).call(response(:patch, path, body).body)
    end

    def authorization(authorization)
      @authorization = authorization
    end

    private

    def mapper(method, path)
      @router.resolve(method, path).mapper.new
    end

    def response(method, path, body = {})
      Response.new(connection.send(method, path, body.empty? ? nil : body.to_json))
    end

    def connection
      @connection ||= Faraday.new(url: @base_url) do |conn|
        conn.adapter :net_http
        conn.headers["Content-Type"] = 'application/json'
        conn.headers["Accept"] = 'application/json'
        conn.headers["Authorization"] = @authorization if @authorization
      end
    end
  end

  class Response
    def initialize(raw)
      @raw = raw
    end

    def body
      JSON.parse(@raw.body)
    end
  end

end