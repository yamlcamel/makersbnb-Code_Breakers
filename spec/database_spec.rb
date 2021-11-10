require_relative '../model/space_handler'
require 'database_helper'

describe Space_handler do 
  describe '.add_space' do 

    it 'We can add a space to the database' do 
      Space_handler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55)
      expect(connect_to_db.exec('SELECT space_name FROM spaces').first['space_name']).to eq "Bat Cave"
      expect(connect_to_db.exec('SELECT space_description FROM spaces').first['space_description']).to eq "Its a bat cave"
      expect(connect_to_db.exec('SELECT price_per_night FROM spaces').first['price_per_night']).to eq "2.55"
    end 

  end 

end 