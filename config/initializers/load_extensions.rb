Dir["lib/ext/**/*.rb"].each do |file|
  require file.sub('.rb','')
end