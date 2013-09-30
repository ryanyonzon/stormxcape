class Message < ActiveRecord::Base

  belongs_to :user
  has_many :comment

  before_destroy { |record| Comment.destroy_all "message_id = #{record.id}" }  
  
end
