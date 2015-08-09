require 'test_helper'

class UserTest < Minitest::Test
  include TestClient

  def setup
    client.authorization("token secret_token")
  end

  def teardown
    client.authorization(nil)
  end

  def test_repositories
    VCR.use_cassette("user") do
      user = client.get('user')

      assert_equal "martinciu", user.login
      assert_equal 34633, user.id
    end
  end

end