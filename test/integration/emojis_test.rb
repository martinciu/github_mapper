require 'test_helper'

class EmojisTest < Minitest::Test

  def test_emojis
    VCR.use_cassette("emojis") do
      response = client.get('/emojis')
      emoji = response.first
      assert_equal "+1", emoji.symbol
      assert_equal "https://assets-cdn.github.com/images/icons/emoji/unicode/1f44d.png?v5", emoji.url
    end
  end

  private

  def client
    @client ||= GithubMapper::Client.new('https://api.github.com')
  end

end