require 'rails_helper'

RSpec.describe DeveloperSearchForms do
  describe '#search' do
    before do
      language_vn = create :language, code: 'vn'
      language_en = create :language, code: 'en'
      programming_language_php = create :programming_language, name: 'php'
      programming_language_ruby = create :programming_language, name: 'ruby'
      create :developer,
             email: 'phan.nguyen@example.com',
             languages: [language_vn],
             programming_languages: [programming_language_php]
      create :developer,
             email: 'quang.pham@example.com',
             languages: [language_en],
             programming_languages: [programming_language_ruby]
    end

    context 'with no params' do
      it 'return no developers' do
        form = DeveloperSearchForms.new({})
        expect(form.search.size).to eq(0)
      end
    end

    context 'with correct params' do
      it 'return developers by programming language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            programming_language_name: 'php'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return developers by language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            language_code: 'vn'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return developers by language and programming_language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            programming_language_name: 'php',
            language_code: 'vn'
          }
        )
        expect(form.search.size).to eq(1)
      end
    end

    context 'with incorrect params' do
      it 'return no developers by programming language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            programming_language_name: 'ruby'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return no developers by language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            language_code: 'en'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return no developers by language and programming_language' do
        form = DeveloperSearchForms.new(
          developer_search_forms: {
            programming_language_name: 'ruby',
            language_code: 'en'
          }
        )
        expect(form.search.size).to eq(1)
      end
    end
  end
end
