require 'rails_helper'

RSpec.describe 'Artists songs index' do
  before :each do
    @prince = Artist.create!(name: 'Prince')
    @purple = @prince.songs.create!(title: 'Purple Rain', length: 654, play_count: 7847)
    @beret = @prince.songs.create!(title: 'Rasberry Beret', length: 376, play_count: 9947)
    # @other_song = @prince.songs.create!(title: 'Other Song', length: 1, play_count: 4567)

  end
  it 'shows all of the titles of the songs for the artist' do
    
    
    visit "/artists/#{@prince.id}/songs"

    expect(page).to have_content(@purple.title)
    expect(page).to have_content(@beret.title)
  end

  it 'links to each songs show page' do
    visit "artists/#{@prince.id}/songs"
    
    click_on @purple.title
    
    expect(current_path).to eq("/songs/#{@purple.id}")
  end
  
  it 'shows the average song length' do
    visit "artists/#{@prince.id}/songs"

    expect(page).to have_content(515)
  end

end