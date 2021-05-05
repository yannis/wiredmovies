# frozen_string_literal: true

module ApplicationHelper
  def title(content)
    return unless content

    content_for(:title) { content }
    @title = content
  end
end
