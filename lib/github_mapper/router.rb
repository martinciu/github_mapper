module GithubMapper
  class Router < ApiMapper::Router
    get "emojis", EmojiMapper
    get "repositories", RepositoryMapper
  end
end