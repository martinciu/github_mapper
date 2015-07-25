require 'test_helper'

class EmojisTest < Minitest::Test

  def test_emojis
    response = client.get('emojis')

    emoji = response.first
    emoji.symbol must_equal "+1"
    emoji.url must_equal "https://assets-cdn.github.com/images/icons/emoji/unicode/1f44d.png?v5"
  end

  private

  def client
    @client ||= GithubMapper::Client.new('http://api.github.com')
  end

end