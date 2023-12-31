class Book < ApplicationRecord
  belongs_to :user
  has_many :book_comments, dependent: :destroy
  has_many :favorites, dependent: :destroy
  has_many :favorited_users, through: :favorites, source: :user

  validates :title, presence:true
  validates :body, presence:true, length:{maximum:200}
  validates :category, presence: true

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end


  # 検索方法分岐
  def self.looks(search, word)
    if search == "perfect_match"
      @book = Book.where("title LIKE?","#{word}")
    elsif search == "forward_match"
      @book = Book.where("title LIKE?","#{word}%")
    elsif search == "backward_match"
      @book = Book.where("title LIKE?","%#{word}")
    elsif search == "partial_match"
      @book = Book.where("title LIKE?","%#{word}%")
    else
      @book = Book.all
    end
  end

  # ソート機能(desc=昇順, asc=降順)
  scope :latest, -> {order(created_at: :desc)} #作成日が新しい順 降順
  scope :old, -> {order(created_at: :asc)} #作成日が古い順 昇順
  scope :star_count, -> {order(star: :desc)} #スコア順 降順

  scope :favorite_count, -> {
    left_joins(:favorites)
      .group(:id)
      .order(Arel.sql('COUNT(favorites.id) DESC'))
  }



end
