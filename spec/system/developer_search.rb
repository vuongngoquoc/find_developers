require 'rails_helper'

RSpec.describe 'Search developers', type: :system do
  before do
    @language_vn = create :language, code: 'vn'
    @language_en = create :language, code: 'en'
    @programming_language_php = create :programming_language, name: 'php'
    @programming_language_ruby = create :programming_language, name: 'ruby'
    @php_developer_vn = create :developer,
                               email: 'phan.nguyen@example.com',
                               languages: [@language_vn],
                               programming_languages: [@programming_language_php]
    @ruby_developer_en = create :developer,
                                email: 'quang.pham@example.com',
                                languages: [@language_en],
                                programming_languages: [@programming_language_ruby]
  end

  it 'show matched developers with language' do
    visit root_path

    fill_in 'developer_search_forms[language_code]', with: @language_vn.code
    click_on 'Search'
    expect(page).to have_content(@php_developer_vn.email)
  end

  it 'show matched developers with programming language' do
    visit root_path

    fill_in 'developer_search_forms[programming_language_name]', with: @programming_language_ruby.name
    click_on 'Search'
    expect(page).to have_content(@ruby_developer_en.email)
  end

  it 'show matched developers with language & programming language' do
    visit root_path

    fill_in 'developer_search_forms[language_code]', with: @language_vn.code
    fill_in 'developer_search_forms[programming_language_name]', with: @programming_language_php.name
    click_on 'Search'
    expect(page).to have_content(@php_developer_vn.email)
  end
end
