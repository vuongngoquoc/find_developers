class DeveloperSearchForms
  include Virtus.model
  include ActiveModel::Model

  def self.model_name
    ActiveModel::Name.new(self, nil, 'DeveloperSearchForms')
  end

  FORM_FIELDS = %i[
    language_code
    programming_language_name
  ]

  FORM_FIELDS.each do |f|
    attribute f, String
  end

  def initialize(params)
    @developer_search_forms = params[:developer_search_forms] || {}
    FORM_FIELDS.each { |f| send("#{f}=", @developer_search_forms[f]) }
  end

  def search
    return Developer.none if @developer_search_forms.empty?

    query = Developer.all
    query = search_by_language(query) if @developer_search_forms[:language_code].present?
    query = search_by_programming_language(query) if @developer_search_forms[:programming_language_name].present?
    query
  end

  private

  def search_by_language(query)
    query.joins(:languages)
         .where(
            'languages.code=?',
            @developer_search_forms[:language_code]
          )
  end

  def search_by_programming_language(query)
    query.joins(:programming_languages)
         .where(
            'programming_languages.name=?',
            @developer_search_forms[:programming_language_name]
          )
  end
end
