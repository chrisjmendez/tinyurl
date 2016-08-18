
Link.populate(3) do |l|
  l.identifier = l.id.to_s(36)
  Url.populate(1) do |u|
    u.original = Faker::Internet.url
    u.link_id  = l.id
  end
end

# Used for testing
Link.populate(1) do |l|
  l.identifier = l.id.to_s(36)
  Url.populate(1) do |u|
    u.original = "http://chrisjmendez.com"
    u.link_id  = l.id
  end	
end
