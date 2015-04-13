article_list = [
  ["about us", "about_us"],
  ["contact us", "contact_us"],
  ["services information", "services"]
]

article_list.each do | name, article_type |
  Article.create name: name, article_type: article_type
end