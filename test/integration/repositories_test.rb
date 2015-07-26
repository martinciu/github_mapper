require 'test_helper'

class RepositoriesTest < Minitest::Test

  def test_repositories
    VCR.use_cassette("repositories") do
      repositories = client.get('repositories')

      assert_equal 100, repositories.count

      repository = repositories.first

      assert_equal 1, repository.id
      assert_equal "grit", repository.name
      assert_equal "mojombo/grit", repository.full_name

      user = repository.owner

      assert_equal 1, user.id
      assert_equal "mojombo", user.login
    end
  end

  private

  def client
    @client ||= ApiMapper::Client.new('https://api.github.com', GithubMapper::Router.new)
  end

end