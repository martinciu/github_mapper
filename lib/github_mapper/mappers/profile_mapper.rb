module GithubMapper
  class ProfileMapper < ApiMapper::EntityMapper
    map t(:accept_keys, [:id, :login, :hireable])
    entity Profile
  end

end