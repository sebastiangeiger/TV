Given(/^the TV show "(.*?)" exists$/) do |name|
  FactoryGirl.create(:tv_show, name: name)
end
