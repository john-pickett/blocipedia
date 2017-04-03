class Wiki < ActiveRecord::Base

  default_scope { order('created_at DESC') }
  scope :public_wikis, -> (wikis) { where private: false }
  scope :private_wikis, -> (wikis) { where private: true }
  scope :user_wikis, -> (id) { where user_id: id }
  

  belongs_to :user
end
