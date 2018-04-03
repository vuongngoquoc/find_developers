class DevLang < ApplicationRecord
  belongs_to :developers
  belongs_to :languages
end
