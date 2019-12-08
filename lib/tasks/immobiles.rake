desc 'Fetch all sale immobiles'
task :fetch_sale_immobiles => :environment do
  Immobile.where(
    location: 'Augsburg-Innenstadt',
    marketing_type: 'all:sale'
  )

  Immobile.where(
    location: 'Augsburg-Innenstadt',
    marketing_type: 'all:sale',
    area_from: 50
  )
end

desc 'Fetch all rental immobiles'
task :fetch_rental_immobiles => :environment do
  Immobile.where(
    location: 'Augsburg-Innenstadt',
    marketing_type: 'all:rental',
  )

  Immobile.where(
    location: 'Augsburg-Innenstadt',
    marketing_type: 'all:rental',
    area_from: 50
  )
end
