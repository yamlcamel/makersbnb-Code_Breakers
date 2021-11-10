feature 'adding a space' do

  scenario 'we can add a space' do
    visit('/add_space')
    fill_in(:name, with: 'Bat Cave')
    fill_in(:description, with: 'Its a bat cave')
    fill_in(:price_per_night, with: 2.55)
    click_on 'Submit'
    result = connect_to_db.exec('SELECT * FROM spaces')
    expect(result.first['spaces_name']).to eq 'Bat Cave'
    expect(result.first['spaces_description']).to eq 'Its a bat cave'
    expect(result.first['price_per_night']).to eq '2.55'
  end

end 