task :fetch_sale_immobiles => :environment do
  Immobile.where(
    location: 'Augsburg-Innenstadt (Stadtteil)',
    marketing_type: 'all:sale',
    area_from: 50
  )
end

task :fetch_rental_immobiles => :environment do
  Immobile.where(
    location: 'Augsburg-Innenstadt (Stadtteil)',
    marketing_type: 'all:rental',
    area_from: 50
  )
end
