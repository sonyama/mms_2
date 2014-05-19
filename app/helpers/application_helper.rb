module ApplicationHelper

  # Returns the full title on a per-page base
  def full_title(page_title)
    base_title = "Member Management System"
    if page_title.empty?
      base_title
    else
      "#{base_title} | #{page_title}"
    end
   end

end