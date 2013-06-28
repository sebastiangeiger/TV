require "spec_helper"

class Response < SimpleDelegator
  def json
    JSON.parse(body)
  end
end

describe "Searching" do
  let(:request) { post "/api/search", query: query, format: :json }
  subject { request; Response.new(response) }

  context 'with an existing TV show' do
    let!(:show) { FactoryGirl.create(:tv_show, name: "Firefly") }
    let(:show_names) { subject.json["tv_shows"].map{|show| show["name"]} }
    context 'and the first few letters of the name of that show' do
      let(:query) { "Fi" }
      its(:json) { should have_key "tv_shows" }
      it 'should have the TV show in the "tv_shows" key' do
        show_names.should include "Firefly"
      end
    end
    context 'and some unrelated letters' do
      let(:query) { "abc" }
      its(:json) { should have_key "tv_shows" }
      it 'should have the TV show in the "tv_shows" key' do
        show_names.should_not include "Firefly"
      end
    end
  end

end
