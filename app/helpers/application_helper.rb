module ApplicationHelper

  def error_messages(resource)
    return unless resource.errors.any?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div class="error-explanation">
        <ul>#{messages}</ul>
      </div>
    HTML

    html.html_safe
  end
end
