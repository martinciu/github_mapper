require 'test_helper'

class IssuesTest < Minitest::Test
  include TestClient

  def test_issues
    VCR.use_cassette("issues") do
      issues = client.get('repos/rails/rails/issues')

      assert_equal 30, issues.count
      issue = issues.first

      assert_equal 97284917, issue.id
      assert_equal 21031, issue.number
      assert_equal "Fix params_wrapper doc [ci skip]", issue.title

      user = issue.user

      assert_equal 1840945, user.id
      assert_equal "meinac", user.login
    end
  end

end