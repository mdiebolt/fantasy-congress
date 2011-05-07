Base.api_key = '3a9507e6cb222e3777ce004dafd1b03d:6:63643765'

namespace :congress do
  desc 'update senate data using ny-times-congress gem'
  task :update_senate => :environment do
    include NYTimes::Congress

    senate = Congress.new(112, 'senate')
    senators = senate.members

    senators.each do |senator_data|
      id = senator_data[0]
      senator = senator_data[1]
      role = senator.roles.first

      sleep 1

      attributes = {
        :party => role.party.first,
        :name => "#{senator.first_name} #{senator.last_name}",
        :bills_sponsored => role.bills_sponsored,
        :bills_cosponsored => role.bills_cosponsored,
        :missed_votes_percent => role.missed_votes_pct,
        :votes_with_party_percent => role.votes_with_party_pct,
        :state => role.state,
        :committees => 0
      }

      if Congressman.find_by_nyt_api_id(id)
        Congressman.find_by_nyt_api_id(id).update_attributes(attributes)
      else
        Congressman.create!(attributes.merge(:nyt_api_id => id))
      end
    end
  end

  desc 'update house data using ny-times-congress gem'
  task :update_house => :environment do
    include NYTimes::Congress

    house = Congress.new(112, 'house')
    legislators = house.members

    legislators.each do |legislator_data|
      id = legislator_data[0]
      legislator = legislator_data[1]
      role = legislator.roles.first

      sleep 2

      attributes = {
        :party => role.party.first,
        :name => "#{legislator.first_name} #{legislator.last_name}",
        :bills_sponsored => role.bills_sponsored,
        :bills_cosponsored => role.bills_cosponsored,
        :missed_votes_percent => role.missed_votes_pct,
        :votes_with_party_percent => role.votes_with_party_pct,
        :state => role.state,
        :committees => 0
      }

      if Congressman.find_by_nyt_api_id(id)
        Congressman.find_by_nyt_api_id(id).update_attributes(attributes)
      else
        Congressman.create!(attributes.merge(:nyt_api_id => id))
      end
    end
  end
end
