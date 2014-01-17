require 'spec_helper'

describe 'Static Pages' do

  let(:base_title) { 'Wunderkind.ge' }

  describe 'Wunderkind page' do
    it "should have the content 'Wunderkind'" do
      visit '/static_pages/1'
      expect(page).to have_content('Wunderkind')
    end

    it 'should have the base title' do
      visit '/static_pages/1'
      expect(page).to have_title(base_title)
    end

    it 'should not have a custom page title' do
      visit '/static_pages/1'
      expect(page).not_to have_title('| Wunderkind')
    end
  end
end
