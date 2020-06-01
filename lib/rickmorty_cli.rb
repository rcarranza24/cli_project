#application environment
require 'bundler'
Bundler.require(:default)



require_relative './rickmorty_cli/cli.rb'
require_relative './rickmorty_cli/api.rb'
require_relative './rickmorty_cli/rickmorty.rb'