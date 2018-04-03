class DevProgram < ApplicationRecord
  belongs_to :developers
  belongs_to :programming_languages
end
