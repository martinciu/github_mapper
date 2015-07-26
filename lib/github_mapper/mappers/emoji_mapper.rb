module GithubMapper
  class EmojiMapper < HashMapper
    map t(:structure, :symbol, :url)
    entity Emoji
  end
end