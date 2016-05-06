Article.delete_all

(1..50).each do |i|
  Article.create(id: i, title: Faker::Hipster.sentence, body: Faker::Hipster.paragraphs(2))
end
