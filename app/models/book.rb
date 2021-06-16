class Book < ApplicationRecord
  validates :name, presence: true
  validates :author, presence: true
  validates :name, uniqueness: true
  validates :name, length: {minimum: 2}
  before_save :merge_names
  def merge_names
    self.name = self.name + "by" + self.author
  end
  after_destroy :update_log
  def update_log
    logger.info "============alas! a book has been deleted #{self.id} with name #{self.name}==============="
  end
end
