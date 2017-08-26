# helpers are automatically included in Rails views
module ApplicationHelper
  # Returns the full title on a per-page basis.
  def full_title page_title = ""
    base_title = "Framgia training system"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def abc
    "abc"
  end
end
