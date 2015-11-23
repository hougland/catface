# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

owners = [
  {name: "Emma M.", city: "Chicago"},
  {name: "Jona Shoe", city: "Seattle"},
  {name: "George", city: "Toronto"},
  {name: "Larry", city: "Atlanta"},
]

cats = [
  {name: "Maru", color: "white and brown", tail_length: "short", personality: "boxes",
    outdoor: false, occupation: "youtube star", owner_id: 1},
  {name: "Lurbey", color: "orange", tail_length: "long", personality: "shy",
    outdoor: true, occupation: "traveling salesman", owner_id: 2},
  {name: "Snuggles", color: "gray", tail_length: "medium", personality: "lapcat",
    outdoor: false, occupation: "unemployed", owner_id: 3},
  {name: "Wrenny", color: "brown striped", tail_length: "long", personality: "bumbling",
    outdoor: false, occupation: "librarian", owner_id: 2},
  {name: "Katherine", color: "brown striped", tail_length: "very short", personality: "loving to a fault",
    outdoor: false, occupation: "call center", owner_id: 1},
  {name: "Edgar", color: "black", tail_length: "long", personality: "business",
    outdoor: true, occupation: "hunter", owner_id: 4},
  {name: "Peanut", color: "brown", tail_length: "short", personality: "peppy",
    outdoor: false, occupation: "bus driver", owner_id: 3},
]

status = [
  {status: "hungry", cat_id: 4},
  {status: "about to take a lovely nap on the radiator", cat_id: 1},
  {status: "also hungry", cat_id: 7},
  {status: "still hungry", cat_id: 4},
  {status: "watching birds", cat_id: 6},
  {status: "sleeping is nice", cat_id: 5},
  {status: "I wish I was eating right now", cat_id: 3},
  {status: "...did anyone else hear that?", cat_id: 2},
  {status: "box!", cat_id: 1},
  {status: "check out this awesome dinner I just ate!", cat_id: 2},
  {status: "ugh, when your ex adds you back on catface...", cat_id: 3},
  {status: "loving the snow!", cat_id: 5},
  {status: "it's my birthday today!", cat_id: 6},
  {status: "check out this cool article I found", cat_id: 7},
  {status: "more box!", cat_id: 1},
]

owners.each do |owner|
  Owner.create(owner)
end

cats.each do |cat|
  Cat.create(cat)
end

status.each do |status1|
  Status.create(status1)
end
