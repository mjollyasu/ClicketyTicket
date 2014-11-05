module ApplicationHelper
  #returns the full title for a page if present, supplies default otherwise
  def full_title(page_title = '')
    base_title = "Clickety Ticket"
    if page_title.empty?
      base_title
    else
      "#{page_title} | #{base_title}"
    end
  end
  
  
  def date_mdY(date)
    date.nil? ? "" : date.strftime("%m-%d-%Y")
  end
  
end
