require 'spec_helper'

describe 'Static Pages' do

  let(:base_title) { 'Wunderkind.ge' }

  describe 'Help page' do
    it "should have the content 'Wunderkind'" do
      visit '/static_pages/1'
      expect(page).to have_content('Wunderkind')
    end

    it 'should have the title' do
      visit '/static_pages/1'
      expect(page).to have_title("#{base_title} | Wunderkind")
    end
  end
end
