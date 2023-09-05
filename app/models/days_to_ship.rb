class DaysToShip < ActiveHash::Base
  self.data = [
    { id: 1, name: '---' },
    { id: 2, name: '1~2日では発送' },
    { id: 3, name: '2~3日では発送' },
    { id: 4, name: '4~7日では発送' },
  ]

  extend ActiveHash::Associations::ActiveRecordExtensions
  belongs_to :item

  validates :item_id, numericality: { other_than: 1 , message: "can't be blank" } 

end
