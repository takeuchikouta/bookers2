class Book < ApplicationRecord
  belongs_to :user

  validates :title, presence: true
  validates :body, presence: true







#   def new
#     @book = Book.new
#   end

#   # 投稿データの保存
#   def create
#     @book = PostImage.new(post_image_params)
#     @book.user_id = current_user.id
#     @book.save
#     redirect_to post_images_path
#   end

#   private

#   def post_image_params
#     params.require(:post_image).permit(:shop_name, :image, :caption)
#   end
end
