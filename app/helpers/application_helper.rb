module ApplicationHelper
  def render_status(status)
    status == "t" ? "true" : "false"
  end
end
