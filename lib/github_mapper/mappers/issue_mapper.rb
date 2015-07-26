module GithubMapper
  class IssueMapper < ApiMapper::ArrayMapper
    map t(:accept_keys, [:id, :number, :title, :user]) >> t(:map_value, :user, t(:mapping, UserMapper))
    entity Issue
  end

end