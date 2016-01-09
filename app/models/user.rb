class User < ActiveRecord::Base
  #users table
    #t.string   "username",   limit: 20,  null: false
    #t.string   "password",   limit: 255, null: false
    #t.string   "email",      limit: 50,  null: false
 #specify a one to many association
 has_many :articles

 VALID_EMAIL_REGEX = /\A[\w+\-.]+@[a-z\d\-.]+\.[a-z]+\z/i
 before_save { self.email = email.downcase }

 validates :username,        presence: { message: 'Please input your username' }, uniqueness: { case_sensitive: false, message: 'The user name has been registered.' }
 validates :email,       presence: { message: 'Please input your email address.' },
   format: { with: VALID_EMAIL_REGEX, message: 'Your email has a wrong format.' },
   uniqueness: { case_sensitive: false, message: 'Your email has been registered.' }
 validates :password,    presence: { message: 'Please input your password.' },
   confirmation: { message: 'The passwords are not same' },
   length: { minimum: 6, maximum: 20, message: 'The length of your password shuld greater than 6 and less than 20.' }, on: :create

end
