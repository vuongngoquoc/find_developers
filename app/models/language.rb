class Language < ApplicationRecord
  has_many :dev_langs
  has_many :developers, through: :dev_langs
end
