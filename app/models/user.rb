class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :trackable, :validatable

  has_and_belongs_to_many :roles
  has_many :reports

  scope :analystes, ->  { joins(:roles).where(roles:{id:Role.where(symbol_name: :analyst).first}) }

  def role?(symbol_name)
    return !!self.roles.find_by_symbol_name(symbol_name.to_s)
  end

end
