module GithubMapper
  class RepositoryMapper < ApiMapper::ArrayMapper
    map t(:accept_keys, [:id, :name, :full_name, :owner]) >> t(:map_value, :owner, t(:mapping, UserMapper))
    entity Repository
  end

end