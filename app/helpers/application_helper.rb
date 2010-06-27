# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  def active_class(path)
    URI.parse(request.path_info).path =~ /#{path}/ ? 'active' : nil
  end  
end
