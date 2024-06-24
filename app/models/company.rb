class Company < ApplicationRecord
    validates :name,length: {minimum: 5, :message => "length should be greater than 5"}, presence: true
    validates :email, format: { with: URI::MailTo::EMAIL_REGEXP, :message => "Valid email required"}, presence: true
    validates :website, :format => { :with => URI::regexp(%w(http https)), :message => "Valid URL required"}, allow_blank: true
    validates :strength, :numericality => { :greater_than_or_equal_to => 0, :message => "strength should be a positive number"}, allow_blank: true
    validates :code, length: {is: 5}, uniqueness: true, allow_blank: true
end
