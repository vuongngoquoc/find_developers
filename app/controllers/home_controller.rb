class HomeController < ApplicationController
  include ActiveModel::Model
  def index
    @form = DeveloperSearchForms.new(permitted_params)
    @developers = @form.search
  end

  private

  def permitted_params
    params.permit(developer_search_forms: DeveloperSearchForms::FORM_FIELDS)
  end
end
