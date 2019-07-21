byebug
json.extract! @blog_image, :id
json.url main_app.url_for @blog_image.url(:small)
json.image_url main_app.url_for @blog_image.url(:large)
json.id @blog_image.id