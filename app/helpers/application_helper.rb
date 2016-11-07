module ApplicationHelper
  def custom_error(code, message)
    {code: code, message: message}
  end
end
