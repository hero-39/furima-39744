class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 0, name: '---' },
    { id: 1, name: '1~2日では発送' },
    { id: 2, name: '2~3日では発送' },
    { id: 3, name: '4~7日では発送' },
  ]

  include ActiveHash::Associations
  has_many :items

end
