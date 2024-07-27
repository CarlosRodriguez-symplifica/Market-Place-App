module Paginable
  protected

  def current_page
    (params[:page] || 1).to_i
  end

  def per_page
    (params[:per_page] || 20).to_i
  end

  def get_links_serializer_options links_paths, colletion
    {
      links: {
        first: send(links_paths, page: 1),
        last: send(links_paths, page: colletion.total_pages),
        prev: send(links_paths, page: colletion.prev_page),
        next: send(links_paths, page: colletion.next_page)
      }
    }
  end
end
