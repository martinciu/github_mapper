module GithubMapper
  class Profile
    include Anima.new(:id, :login, :hireable)
  end
end