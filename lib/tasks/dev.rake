namespace :dev do
  require 'factory_bot_rails'
  require 'faker'

  desc "Generate test data"
  task :generate_data, [:users_num] => :environment do |_, args|
    set_args(args)

    create_languages
    create_programming_languages

    languages = Language.all
    programming_languages = ProgrammingLanguage.all

    @args[:users_num].times do
      FactoryBot.create :developer,
                        languages: languages.sample(Random.rand(1..2)),
                        programming_languages: programming_languages.sample(Random.rand(1..4))
    end
  end

end

def set_args(args)
  @args = {}
  @args[:users_num] = (args.users_num || 100).to_i
end

def create_languages
  %w[en vn].each do |code|
    FactoryBot.create :language, code: code
  end
end

def create_programming_languages
  %w[ruby javascript php kotlin].each do |name|
    FactoryBot.create :programming_language, name: name
  end
end
