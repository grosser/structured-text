Factory.define(:user) do |f|
  f.name{ "name-#{rand(11111111111)}" }
  f.identifier{ "ident-#{rand(111111111111)}" }
  f.email{ "user_#{rand(11111111111111)}@email.com" }
end