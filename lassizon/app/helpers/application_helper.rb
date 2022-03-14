module ApplicationHelper
  def flash_class(level)
    case level
      when 'error' then "alert alert-danger"
      when 'alert' then "alert alert-warning"
    end
  end
end
