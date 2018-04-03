class Developer < ApplicationRecord
  has_many :dev_langs
  has_many :languages, through: :dev_langs

  has_many :dev_programs
  has_many :programming_languages, through: :dev_programs
end
