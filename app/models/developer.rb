class Developer < User
  has_one :profile
  has_many :companies
end
