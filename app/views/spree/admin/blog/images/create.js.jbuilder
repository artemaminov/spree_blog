json.extract! @blog_image, :id
json.url main_app.url_for @blog_image.url(:hero)
json.image_url main_app.url_for @blog_image.url(:post)
json.id @blog_image.id