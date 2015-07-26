module GithubMapper
  class Router < ApiMapper::Router
    get "emojis", EmojiMapper
    get "repositories", RepositoryMapper
    get "repos/rails/rails/issues", IssueMapper
  end
end