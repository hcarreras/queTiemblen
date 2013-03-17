class User < ActiveRecord::Base
	attr_accessible :name, :password, :password_confirmation,:image, :remote_image_url
  attr_accessor :password
  before_save :encrypt_password

  validates_confirmation_of :password
  validates_presence_of :password, :on => :create, :unless => :from_facebook
  validates_presence_of :name
	validates_uniqueness_of :name   
  
	#normal_image is the image from a not facebook user
  mount_uploader :image, ImageUploader

  IS_ADMIN = [ "false", "true"]

  def from_facebook
  	self.provider == "facebook"
  end

	def self.from_omniauth(auth)
	  where(auth.slice(:provider, :uid)).first_or_initialize.tap do |user|
	    user.provider = auth.provider
	    user.uid = auth.uid
	    user.name = auth.info.name
	    user.remote_image_url = auth.info.image.gsub("=square","=large")
	    user.oauth_token = auth.credentials.token
	    user.oauth_expires_at = Time.at(auth.credentials.expires_at)
	    user.save!
	  end
	end

	def encrypt_password
	    if password.present?
	      self.password_salt = BCrypt::Engine.generate_salt
	      self.password_hash = BCrypt::Engine.hash_secret(password, password_salt)
	    end
  end

  def self.authenticate(name, password)
    user = find_by_name(name)
    if user && user.password_hash == BCrypt::Engine.hash_secret(password, user.password_salt)
      user
    else
      nil
    end
  end
end
