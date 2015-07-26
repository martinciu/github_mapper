module GithubMapper
  class EmojiMapper < ApiMapper::HashMapper
    map t(:structure, :symbol, :url)
    entity Emoji
  end
end