class String
  def to_slug
    slug = to_ascii
    slug.gsub!(/[^-a-zA-Z\d]/, '-')
    slug.gsub!(/-+/,'-') # --- -> -
    slug.gsub!(/^-+/,'')
    slug.gsub!(/-+$/,'') # --a-- -> a
    slug
  end
end

class String
  def markdown_to_html
    Markdown.new(self).to_html
  end
end