# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

# Deletions
Person.destroy_all
CoreNameType.destroy_all
CoreSex.destroy_all
CoreGender.destroy_all

# PersonName.delete_all

# Core seed data
CoreNameType.create(id: 1, identity: 'legal_primary', display: 'Legal Primary')
CoreNameType.create(id: 2, identity: 'legal_alias', display: 'Legal Alias')
CoreNameType.create(id: 3, identity: 'preferred', display: 'Preferred')
CoreNameType.create(id: 4, identity: 'former', display: 'Former')
CoreNameType.create(id: 5, identity: 'other_alias', display: 'Other Alias')
CoreSex.create(id: 1, identity: 'female', display: 'Female')
CoreSex.create(id: 2, identity: 'female', display: 'Intersex')
CoreSex.create(id: 3, identity: 'female', display: 'Male')
CoreGender.create(id: 1, identity: 'cis_female', display: 'Cis Female')
CoreGender.create(id: 2, identity: 'cis_male', display: 'Cis Male')
CoreGender.create(id: 3, identity: 'non_binary', display: 'Gender Non-Binary')
CoreGender.create(id: 4, identity: 'trans_female', display: 'Trans Female')
CoreGender.create(id: 5, identity: 'trans_male', display: 'Trans Male')
