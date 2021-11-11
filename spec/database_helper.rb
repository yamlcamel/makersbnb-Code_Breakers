require 'PG'
require_relative '../model/database'

def reset_db_makers_bnb
  connection = PG.connect(dbname: 'makers_bnb_test')
  connection.exec('TRUNCATE users RESTART IDENTITY CASCADE;')
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
  SpaceHandler.add_space(space_name: 'Bat Cave', space_description: 'Its a bat cave', price_per_night: 2.55)
  SpaceHandler.add_space(space_name: 'Makers HQ', space_description: 'Makers HQ', price_per_night: 50)
  SpaceHandler.add_space(space_name: 'Paradise', space_description: 'Its paradise', price_per_night: 99)
end

def populate_bookings_table
  BookingHandler.add_booking(space_id: 1, booking_start: '2022-01-04', booking_end: '2022-01-06')
  BookingHandler.add_booking(space_id: 2, booking_start: '2022-01-02', booking_end: '2022-01-06')
  BookingHandler.add_booking(space_id: 3, booking_start: '2022-01-07', booking_end: '2022-01-09')
end
