require 'test_helper'

class EmojisTest < Minitest::Test
  include TestClient


  def test_emojis
    VCR.use_cassette("emojis") do
      emojis = client.get('emojis')

      assert_equal 888, emojis.count

      emoji = emojis.first

      assert_equal "+1", emoji.symbol
      assert_equal "https://assets-cdn.github.com/images/icons/emoji/unicode/1f44d.png?v5", emoji.url
    end
  end

end