if Rails.env.development?
  HEROKU_SET_COMMAND = 'heroku config:set'.freeze
  HEROKU_UNSET_COMMAND = 'heroku config:unset'.freeze

  namespace :env do
    namespace :heroku do
      desc 'Pushes env vars in .env up to Heroku using the CLI'
      task :set do
        env_vars = Dotenv.load
        serialized_vars = env_vars.zip.map { |pair| pair.join('=') }.join(' ')

        `#{HEROKU_SET_COMMAND} #{serialized_vars}`
      end

      desc 'Unsets the current env vars in .env on Heroku using the CLI'
      task :unset do
        env_vars = Dotenv.load
        serialized_keys = env_vars.keys.join(' ')

        `#{HEROKU_UNSET_COMMAND} #{serialized_keys}`
      end
    end
  end
end
