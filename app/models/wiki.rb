class Wiki < ActiveRecord::Base

  before_save :set_attributes
  default_scope { order('created_at DESC') }
  scope :public_wikis, -> (wikis) { where private: false }
  scope :user_wikis, -> (user) { where user_id: user.id }
  scope :visible_to, lambda { |user| where(:user_id => user.id, :private => true)  }

  belongs_to :user

  has_many :collaborators
  has_many :users, through: :collaborators

  def collaborator_for(user)
    collaborators.find_by(user_id: user.id)
  end

  def public?
    !private?
  end

  def set_attributes
    self.private = false if self.private.nil?
  end

end
