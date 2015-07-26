require 'test_helper'

class RepositoriesTest < Minitest::Test

  def test_repositories
    VCR.use_cassette("repositories") do
      response = client.get('repositories')
      repository = response.first

      assert_equal 1, repository.id
      assert_equal "grit", repository.name
      assert_equal "mojombo/grit", repository.full_name
    end
  end

  private

  def client
    @client ||= GithubMapper::Client.new('https://api.github.com')
  end

end