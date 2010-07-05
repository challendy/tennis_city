class Player < ActiveRecord::Base
  has_and_belongs_to_many :teams

  def process_points
    old_points = self.points
    new_points = self.current_points
    self.change = new_points - old_points

    self.points = new_points
    self.save
  end
end
