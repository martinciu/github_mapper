module GithubMapper
  class RepositoryMapper < ArrayMapper
    map t(:accept_keys, [:id, :name, :full_name])
    entity Repository
  end

end