# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
puts "Cleaning database..."
Activity.destroy_all
Organization.destroy_all
ActivityType.destroy_all

puts "Seeding activity types..."
types = ActivityType.create!([
  { name: "Donation", description: "Financial or material donations to the community" },
  { name: "Volunteering", description: "Staff or members volunteering their time" },
  { name: "Event", description: "Community events organized or sponsored" },
  { name: "Partnership", description: "Formal partnerships with local organizations" },
  { name: "Education", description: "Workshops, training, and educational programs" }
])

puts "Seeding organizations..."
orgs = Organization.create!([
  {
    name: "Green Valley Credit Union",
    description: "A member-owned financial cooperative serving the Green Valley region since 1987.",
    website: "https://greenvalleycu.example.com",
    location: "Green Valley, CA"
  },
  {
    name: "Riverside Community Bank",
    description: "Community-focused bank reinvesting in local neighborhoods and small businesses.",
    website: "https://riversidebank.example.com",
    location: "Riverside, TX"
  },
  {
    name: "Northside Savings & Loan",
    description: "Serving working families in the Northside district for over 40 years.",
    website: "https://northsidesavings.example.com",
    location: "Northside, OH"
  }
])

puts "Seeding activities..."
Activity.create!([
  {
    title: "Annual Food Bank Drive",
    date: Date.new(2026, 1, 15),
    people_impacted: 320,
    hours: 48.0,
    notes: "Collected 2,400 lbs of food across 3 collection points.",
    organization: orgs[0],
    activity_type: types[0]
  },
  {
    title: "Financial Literacy Workshop",
    date: Date.new(2026, 2, 10),
    people_impacted: 45,
    hours: 6.0,
    notes: "Covered budgeting, credit scores, and savings strategies for first-time earners.",
    organization: orgs[0],
    activity_type: types[4]
  },
  {
    title: "Neighborhood Cleanup Day",
    date: Date.new(2026, 3, 22),
    people_impacted: 150,
    hours: 120.0,
    notes: "40 volunteers cleaned 6 blocks of the downtown corridor.",
    organization: orgs[1],
    activity_type: types[1]
  },
  {
    title: "Small Business Grant Program",
    date: Date.new(2026, 2, 28),
    people_impacted: 12,
    hours: nil,
    notes: "Awarded $60,000 in grants to 12 local small businesses.",
    organization: orgs[1],
    activity_type: types[0]
  },
  {
    title: "Youth Mentorship Partnership",
    date: Date.new(2026, 1, 30),
    people_impacted: 80,
    hours: 200.0,
    notes: "Partnered with 4 local high schools for a semester-long mentorship program.",
    organization: orgs[2],
    activity_type: types[3]
  },
  {
    title: "Community Health Fair",
    date: Date.new(2026, 4, 5),
    people_impacted: 500,
    hours: 32.0,
    notes: "Free health screenings, dental checkups, and wellness resources.",
    organization: orgs[2],
    activity_type: types[2]
  }
])

puts "Done! Seeded:"
puts "  #{ActivityType.count} activity types"
puts "  #{Organization.count} organizations"
puts "  #{Activity.count} activities"
