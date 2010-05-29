Factory.define(:user) do |f|
  f.name{ "name-#{rand(11111111111)}" }
  f.email{ "user_#{rand(11111111111111)}@email.com" }
end

Factory.define(:rpx_identifier, :class => 'RPXIdentifier') do |f|
  f.association :user
  f.identifier{ "ident-#{rand(111111111111)}" }
  f.raw :x => 'y'
end