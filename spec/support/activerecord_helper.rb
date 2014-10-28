require 'active_record'
require 'support/database_cleaner'

ActiveRecord::Base.establish_connection(YAML.load_file('config/database.yml')['test'])
