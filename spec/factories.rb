Factory.define(:user) do |f|
  f.name{ "name-#{rand(11111111111)}" }
  f.email{ "user_#{rand(11111111111111)}@email.com" }
end

Factory.define(:rpx_identifier, :class => 'RPXIdentifier') do |f|
  f.association :user
  f.identifier{ "ident-#{rand(111111111111)}" }
  f.raw :x => 'y'
end

Factory.define(:document) do |f|
  f.association :user
  f.title 'My Title!!'
end

Factory.define(:section) do |f|
  f.association :document
  f.title 'My Title!!'
  f.text 'My text!!'
end