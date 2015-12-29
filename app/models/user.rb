class User < ActiveRecord::Base

  include Gravtastic
  gravtastic 
  end 

  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  # Validations
  validates :first_name, presence: true
  validates :last_name, presence: true
  validates :profile_name, presence: true, uniqueness: true, format: { with: /[A-zA-Z0-9_-]/, message: 'Must be formatted correctly'}

  has_many :statuses
  
  def full_name 
  	first_name + " " + last_name
  end 

  def gravatar_url 
    stripped_email = email.strip
    downcased_email = stripped_email.downcased_email
    hash = Digest::MD5.hexdigest(downcased_email)

    "http://gravatar.com/avatar/#{gravatar_id}"
  end 

end 






