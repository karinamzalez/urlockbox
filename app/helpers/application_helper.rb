module ApplicationHelper
  def render_status(status)
    status == "t" ? "true" : "false"
  end

  def truncate_link(link)
    limited_body = truncate(link, length: 20)
  end

  def check_status(status)
    status == "t" ? "read" : "unread"
  end
end
