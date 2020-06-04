module StaticPagesHelper
  
  def get_active_link(link_path)
    pathname = request.original_url.split('=')[1]
    link_path == pathname ? "current" : ""
  end

  def active_class(link_path)
    current_page?(link_path) ? "current" : ""
  end
end
