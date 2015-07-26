module GithubMapper
  class UserMapper < ApiMapper::EntityMapper
    map t(:accept_keys, [:id, :login])
    entity User
  end

end