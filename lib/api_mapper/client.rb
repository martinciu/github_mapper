module ApiMapper
  class Client

    def initialize(base_url, router)
      @base_url = base_url
      @router = router
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