module GithubMapper
  class UserMapper < EntityMapper
    map t(:accept_keys, [:id, :login])
    entity User
  end

end