module ApplicationHelper
  def inplace_edit(object, attribute, options={})
    html = {:id => "#{attribute}_#{object.id}", :class => "#{object.class.to_s.downcase}_#{attribute}_edit"}
    text = (options[:markdown] ? object[attribute].markdown_to_html : object[attribute])
    content_tag(:div, raw(text), html)
  end
end

module ActionView::Helpers::AssetTagHelper
  alias js_tag javascript_include_tag
  alias css_tag stylesheet_link_tag
end