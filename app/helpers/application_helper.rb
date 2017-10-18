module ApplicationHelper

  def sortable(column, title=nil)
    title ||= column.titleize
    direction = column == sort_column && sort_direction == 'asc' ? 'desc' : 'asc'
    icon_class = column == sort_column && sort_direction == 'asc' ? 'fa-caret-up' : 'fa-caret-down'
    link_to sort: column, direction: direction, search_term: search_term, page: @page do
      (title + ' ' + content_tag(:i, '', class: ['fa', icon_class], 'aria-hidden': 'true')).html_safe
    end
  end

  def paginatable(body, page)
    link_to body, page: page, search_term: search_term, sort: sort_column, direction: sort_direction
  end

end
