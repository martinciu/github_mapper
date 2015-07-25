module GithubMapper
  class EmojiMapper < Mapper
    map t(:structure, :symbol, :url)
    entity Emoji
  end
end