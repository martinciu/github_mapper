require 'test_helper'

class UserTest < Minitest::Test
  include TestClient

  def setup
    client.authorization("token secret_token")
  end

  def teardown
    client.authorization(nil)
  end

  def test_get_user
    VCR.use_cassette("user_get") do
      user = client.get('user')

      assert_equal "martinciu", user.login
      assert_equal 34633, user.id
      assert_equal true, user.hireable
    end
  end

  def test_path_user
    VCR.use_cassette("user_patch") do
      user = client.patch('user', { hireable: false })

      assert_equal "martinciu", user.login
      assert_equal 34633, user.id
      assert_equal false, user.hireable
    end
  end

end