class Developer < ApplicationRecord
  has_many :developer_languages
  has_many :languages, through: :developer_languages

  has_many :developer_programming_languages
  has_many :programming_languages, through: :developer_programming_languages
end
