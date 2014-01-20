require 'spec_helper'

describe 'Static Pages' do
  subject { page }

  describe 'Wunderkind page' do
    let(:static_page) { FactoryGirl.create(:static_page) }
    before { visit static_page_path(static_page.id) }

    it { should have_content(static_page.content_en) }
    it { should have_title(full_title('')) }
  end
end
