class EditorController < ApplicationController
  before_action :validate_editor
  def index

  end

  def validate_editor
    raise StandardError.new("user_invalid id: #{current_author.id}") if current_author.role != "editor"
  end
end
