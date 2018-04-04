require 'rails_helper'

RSpec.describe DeveloperSearchForms do
  describe '#search' do
    context 'with no params' do
      it 'return no developers' do
        create(:developer, email: 'developer@email.com')
        form = DeveloperSearchForms.new({})
        expect(form.search.size).to eq(0)
      end
    end

    context 'with correct params' do
      before do
        developer_1 = create(:developer, email: 'phan.nguyen@example.com')
        developer_2 = create(:developer, email: 'quang.pham@example.com')
        language_1 = create(:language, code: 'vn')
        language_2 = create(:language, code: 'en')
        programming_language_1 = create(:programming_language, name: 'php')
        programming_language_2 = create(:programming_language, name: 'ruby')
        create(:developer_language, developer_id: developer_1.id, language_id: language_1.id)
        create(:developer_language, developer_id: developer_2.id, language_id: language_2.id)
        create(:developer_programming_language, developer_id: developer_1.id, programming_language_id: programming_language_1.id)
        create(:developer_programming_language, developer_id: developer_2.id, programming_language_id: programming_language_2.id)
      end

      it 'return developers by programming language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            programming_language_name: 'php'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return developers by language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            language_code: 'vn'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return developers by language and programming_language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            programming_language_name: 'php',
            language_code: 'vn'
          }
        )
        expect(form.search.size).to eq(1)
      end
    end

    context 'with incorrect params' do
      before do
        developer_1 = create(:developer, email: 'phan.nguyen@example.com')
        developer_2 = create(:developer, email: 'quang.pham@example.com')
        language_1 = create(:language, code: 'vn')
        language_2 = create(:language, code: 'en')
        programming_language_1 = create(:programming_language, name: 'php')
        programming_language_2 = create(:programming_language, name: 'ruby')
        create(:developer_language, developer_id: developer_1.id, language_id: language_1.id)
        create(:developer_language, developer_id: developer_2.id, language_id: language_2.id)
        create(:developer_programming_language, developer_id: developer_1.id, programming_language_id: programming_language_1.id)
        create(:developer_programming_language, developer_id: developer_2.id, programming_language_id: programming_language_2.id)
      end

      it 'return no developers by programming language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            programming_language_name: 'ruby'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return no developers by language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            language_code: 'en'
          }
        )
        expect(form.search.size).to eq(1)
      end

      it 'return no developers by language and programming_language' do
        form = DeveloperSearchForms.new(
          developer_search_forms:{
            programming_language_name: 'ruby',
            language_code: 'en'
          }
        )
        expect(form.search.size).to eq(1)
      end
    end
  end
end
