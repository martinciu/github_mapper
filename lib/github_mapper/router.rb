module GithubMapper
  class Router < ApiMapper::Router
    get "emojis", EmojiMapper
    get "repositories", RepositoryMapper
    get "repos/{owner}/{repo}/issues", IssueMapper
    get "user", ProfileMapper
    patch "user", ProfileMapper
  end
end