FactoryBot.define do
  locations = ['The Lyceum', 'Amsterdam', 'Tai Zhong', 'Honolulu', 'Hoboken :)', 'Tokyo', 'Paris', 'Rome']

  factory :location do
      name { locations.sample }
  end
end