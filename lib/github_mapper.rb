require "anima"
require "faraday"
require "json"
require "transproc/all"
require "addressable/template"

require "api_mapper/router"
require "api_mapper/client"
require "api_mapper/mapper"
require "api_mapper/functions"

require "github_mapper/version"

require "github_mapper/entities/emoji"
require "github_mapper/entities/repository"
require "github_mapper/entities/user"
require "github_mapper/entities/issue"

require "github_mapper/mappers/emoji_mapper"
require "github_mapper/mappers/user_mapper"
require "github_mapper/mappers/repository_mapper"
require "github_mapper/mappers/issue_mapper"

require "github_mapper/router"

module GithubMapper
  # Your code goes here...
end
