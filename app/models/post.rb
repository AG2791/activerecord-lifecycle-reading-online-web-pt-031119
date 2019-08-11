class Post < ActiveRecord::Base

  belongs_to :author
  validate :is_title_case
  
  
  #rcall method before_validation to call capitilize title method
  before_validation :make_title_case 
  
  # before_save :email_author_about_post

  private

  def is_title_case
    if title.split.any?{|w|w[0].upcase != w[0]}
      errors.add(:title, "Title must be in title case")
    end
  end

#capitalize title
  def make_title_case
    self.title = self.title.titlecase
  end
end
