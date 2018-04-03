class DevLang < ApplicationRecord
  belongs_to :developer
  belongs_to :language
end
