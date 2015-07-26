module GithubMapper
  class Repository
    include Anima.new(:id, :name, :full_name, :owner)
  end
end