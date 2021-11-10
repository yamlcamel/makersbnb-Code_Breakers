require 'PG'
require_relative '../model/database'

def reset_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE spaces RESTART IDENTITY CASCADE;')
end 

def connect_to_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
end

def persisted_booking_id(booking_id:, table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.query("SELECT * FROM #{table} WHERE booking_id = '#{booking_id}';")
end

def persist_space_id(table:)
  connection = PG.connect(dbname: 'makers_bnb_test')
  @space_id = connection.query("SELECT space_id FROM #{table} ")
end

def populate_spaces_table
  Space_handler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55)
  Space_handler.add_space(space_name: 'Makers HQ', space_description: 'Makers HQ', price_per_night: 50)
  Space_handler.add_space(space_name: 'Paradise', space_description: 'Its paradise', price_per_night: 99)
end