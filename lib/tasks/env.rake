HEROKU_SET_COMMAND = 'heroku config:set'.freeze
namespace :env do
  namespace :heroku do
    desc 'Pushes env vars in .env up to Heroku using the CLI'
    task :set do
      return unless Rails.env.development?

      env_vars = Dotenv.load
      serialized_vars = env_vars.zip.map { |pair| pair.join('=') }.join(' ')

      `#{HEROKU_SET_COMMAND} #{serialized_vars}`
    end
  end
end
