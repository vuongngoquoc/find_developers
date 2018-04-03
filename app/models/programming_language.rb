class ProgrammingLanguage < ApplicationRecord
  has_many :dev_programs
  has_many :developers, through: :dev_programs
end
