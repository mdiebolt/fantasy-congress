require 'net/http'
require 'cgi'

API_KEY = "3a9507e6cb222e3777ce004dafd1b03d:6:63643765"

namespace :congress do
  desc 'updating congress data from the NYT Congress API'
  task :update_senate => :environment do
    STATES = ["AL","AK","AZ","AR","CA","CO","CT","DE","DC","FL","GA","HI","ID","IL","IN","IA","KS","KY","LA","ME","MD","MA","MI","MN","MS","MO","MT","NE","NV","NH","NJ","NM","NY","NC","ND","OH","OK","OR","PA","RI","SC","SD","TN","TX","UT","VT","VA","WA","WV","WI","WY"]

    domain = "api.nytimes.com"

    # TODO look up congressmen by their NYT api id and update rather than crush them
    Congressman.destroy_all

    STATES.each do |state|
      current_congressman_path = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/senate/#{state}/current.json?api-key=#{API_KEY}"

      bio = JSON.parse(Net::HTTP.get(domain, current_congressman_path))

      bio["results"].each do |member|
        id = member["id"]

        role_path = "http://api.nytimes.com/svc/politics/v3/us/legislative/congress/members/#{id}.json?api-key=#{API_KEY}"

        role = JSON.parse(Net::HTTP.get(domain, role_path))["results"][0]
        current_congress = role["roles"][0]

        name = role["first_name"] + " " + role["last_name"]
        party = current_congress["party"]
        bills_sponsored = current_congress["bills_sponsored"]
        bills_cosponsored = current_congress["bills_cosponsored"]
        missed_votes = current_congress["missed_votes_pct"]
        votes_with_party = current_congress["votes_with_party_pct"]
        state = current_congress["state"]
        committees = current_congress["committees"].length

        Congressman.create!({
          :nyt_api_id => id,
          :party => party,
          :name => name,
          :bills_sponsored => bills_sponsored.to_i,
          :bills_cosponsored => bills_cosponsored.to_i,
          :missed_votes_percent => missed_votes.to_i,
          :votes_with_party_percent => votes_with_party.to_i,
          :state => state,
          :committees => committees
        })

        sleep 1
      end
    end
  end
end
