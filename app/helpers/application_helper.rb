module ApplicationHelper

  def error_messages(resource)
    return unless resource and resource.errors.any?

    messages = resource.errors.full_messages.map { |msg| content_tag(:li, msg) }.join

    html = <<-HTML
      <div class="alert alert-danger alert-dismissable">
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
        <ul>#{messages}</ul>
      </div>
    HTML

    html.html_safe
  end

  def flash_class(level)
    case level
    when :notice then "info"
    when :error then "error"
    when :alert then "warning"
    end
  end
end
