class Post < ActiveRecord::Base
  validates :title, presence: true
  validates :content, length: {minimum: 10}
  validates :summary, length: {maximum: 299}
  validates :category, inclusion: {in: %w(Fiction Non-Fiction)}
  validate :clickbait




  private

  def clickbait

    if self.title != nil && !self.title.starts_with?("Won't Believe", "Secret", "Top", "Guess", "You Won't")
      errors.add(:title, "Not clickbait")
    end
  end


end
