require 'rest-client'

class Immobile

  ENDPOINT_URL = 'https://immobilien.augsburger-allgemeine.de/suchergebnisse.atom'

  attr_accessor :location, :marketing_type, :price, :area, :link, :rooms, :created_at, :postal_code, :comment, :state, :immobile_identifier

  def initialize(options = {})
    @location = options[:location]
    @link = options[:link]
    @area = options[:area]
    @price = options[:price]
    @rooms = options[:rooms]
    @postal_code = options[:postal_code]
    @immobile_identifier = @link.last(6)
  end

  def price_for_qm
    if price.to_f > 0 && area.to_f > 0
      (price.to_f / area.to_f).round(2)
    end
  end

  def self.where(options = {})
    begin
      location = options[:location].presence || 'Augsburg-Innenstadt'
      marketing_type = options[:marketing_type].presence || 'all:rental'
      response = RestClient.get ENDPOINT_URL, params: {
          l: location,
          a: location_code(location),
          t: marketing_type,
          pf: options[:price_from],
          pt: options[:price_to],
          sf: options[:area_from],
          st: options[:area_to]
      }
      immobiles = build_immobiles(response)
    rescue SocketError
      # Developing when offline should work
      immobile = new(
          location: 'Augsburg',
          link: 'http://localhost:3000/685RJ4',
          marketing_type: 'rental',
          area: 56.3,
          price: 759.54,
          rooms: 3,
          postal_code: '86153'
      )
      immobiles = [immobile]
    end
    ServiceState.connect_persistent(immobiles)
  end

  def self.locations
    [
      'Augsburg-Innenstadt',
      'Augsburg',
      '86150 (PLZ)',
      '86152 (PLZ)',
      '86153 (PLZ)',
      '86159 (PLZ)',
      '86161 (PLZ)',
      'München',
      'München-Allach',
      'München-Altstadt',
      'München-Am Hart',
      'München-Au',
      'München-Aubing',
      'München-Haidhausen',
      'München-Bogenhausen',
      'München-Feldmoching',
      'München-Forstenried',
      'München-Freimann',
      'München-Fürstenried',
      'München-Hadern',
      'München-Berg am Laim',
      '80995 (PLZ)',
      '80997 (PLZ)',
      '80999 (PLZ)',
      '81247 (PLZ)',
      '81249 (PLZ)',
      '80331 (PLZ)',
      '80333 (PLZ)',
      '80335 (PLZ)',
      '80336 (PLZ)',
      '80469 (PLZ)',
      '80538 (PLZ)',
      '80539 (PLZ)',
      '81541 (PLZ)',
      '81543 (PLZ)',
      '81667 (PLZ)',
      '81669 (PLZ)',
      '81671 (PLZ)',
      '81675 (PLZ)',
      '81677 (PLZ)',
      '81243 (PLZ)',
      '81245 (PLZ)',
      '81249 (PLZ)',
      '81671 (PLZ)',
      '81673 (PLZ)',
      '81735 (PLZ)',
      '81825 (PLZ)',
      '81675 (PLZ)',
      '81677 (PLZ)',
      '81679 (PLZ)',
      '81925 (PLZ)',
      '81927 (PLZ)',
      '81929 (PLZ)',
      '80933 (PLZ)',
      '80935 (PLZ)',
      '80995 (PLZ)',
      '80689 (PLZ)',
      '81375 (PLZ)',
      '81377 (PLZ)',
      '80686 (PLZ)',
      '80687 (PLZ)',
      '80689 (PLZ)',
      '80335 (PLZ)',
      '80336 (PLZ)',
      '80337 (PLZ)',
      '80469 (PLZ)',
      '80333 (PLZ)',
      '80335 (PLZ)',
      '80539 (PLZ)',
      '80636 (PLZ)',
      '80797 (PLZ)',
      '80798 (PLZ)',
      '80799 (PLZ)',
      '80801 (PLZ)',
      '80802 (PLZ)',
      '80807 (PLZ)',
      '80809 (PLZ)',
      '80937 (PLZ)',
      '80939 (PLZ)',
      '80637 (PLZ)',
      '80638 (PLZ)',
      '80992 (PLZ)',
      '80993 (PLZ)',
      '80997 (PLZ)',
      '80634 (PLZ)',
      '80636 (PLZ)',
      '80637 (PLZ)',
      '80638 (PLZ)',
      '80639 (PLZ)',
      '81539 (PLZ)',
      '81541 (PLZ)',
      '81547 (PLZ)',
      '81549 (PLZ)',
      '80687 (PLZ)',
      '80689 (PLZ)',
      '81241 (PLZ)',
      '81243 (PLZ)',
      '81245 (PLZ)',
      '81247 (PLZ)',
      '81539 (PLZ)',
      '81549 (PLZ)',
      '81669 (PLZ)',
      '81671 (PLZ)',
      '81735 (PLZ)',
      '81737 (PLZ)',
      '81739 (PLZ)',
      '80538 (PLZ)',
      '80801 (PLZ)',
      '80802 (PLZ)',
      '80803 (PLZ)',
      '80804 (PLZ)',
      '80805 (PLZ)',
      '80807 (PLZ)',
      '80939 (PLZ)',
      '80796 (PLZ)',
      '80797 (PLZ)',
      '80798 (PLZ)',
      '80799 (PLZ)',
      '80801 (PLZ)',
      '80803 (PLZ)',
      '80804 (PLZ)',
      '80809 (PLZ)',
      '80335 (PLZ)',
      '80339 (PLZ)',
      '80336 (PLZ)',
      '80337 (PLZ)',
      '80469 (PLZ)',
      '81369 (PLZ)',
      '81371 (PLZ)',
      '81373 (PLZ)',
      '81379 (PLZ)',
      '80686 (PLZ)',
      '81369 (PLZ)',
      '81373 (PLZ)',
      '81377 (PLZ)',
      '81379 (PLZ)',
      '81379 (PLZ)',
      '81475 (PLZ)',
      '81476 (PLZ)',
      '81477 (PLZ)',
      '81479 (PLZ)',
      '81735 (PLZ)',
      '81825 (PLZ)',
      '81827 (PLZ)',
      '81829 (PLZ)',
      '81543 (PLZ)',
      '81545 (PLZ)',
      '81547 (PLZ)',
      'Kempten (Allgäu)',
      'Kempten (Allgäu)-Adelharz',
      'Kempten (Allgäu)-Auf dem Lindenberg',
      'Kempten (Allgäu)-Breite',
      'Kempten (Allgäu)-Bühl',
      'Kempten (Allgäu)-Eich',
      'Kempten (Allgäu)-Engelhalde',
      'Kempten (Allgäu)-Franzosenbauer',
      'Kempten (Allgäu)-Halde',
      'Kempten (Allgäu)-Haslach',
      'Kempten (Allgäu)-Haubenschloß',
      'Kempten (Allgäu)-Haubensteig/Göhlenbach',
      'Kempten (Allgäu)-Heiligkreuz',
      'Kempten (Allgäu)-Hinterbach/Hirschdorf/Zollhaus',
      'Kempten (Allgäu)-Innenstadt',
      '87435 (PLZ)',
      '87437 (PLZ)',
      '87439 (PLZ)',
    ]
  end

  def self.marketing_types
    {
      'Alle Mietobjekte' => 'all:rental',
      'Wohnung mieten' => 'apartment:rental',
      'Haus mieten' => 'house:rental',
      'Grundstück pachten' => 'plot:rental',
      'WG / Zimmer mieten' => 'flat_share:rental',
      'Garage mieten' => 'parking:rental',
      'Sonstige mieten' => 'other_living:rental',
      'Alle Kaufobjekte' => 'all:sale',
      'Wohnung kaufen' => 'apartment:sale',
      'Haus kaufen' => 'house:sale',
      'Grundstück kaufen' => 'plot:sale',
      'Ferienhaus kaufen' => 'vacation_house:sale',
      'Garage kaufen' => 'parking:sale',
      'Renditeobjekte kaufen' => 'interest:sale',
      'Sonstige kaufen' => 'other_living:sale'
    }
  end

  def self.location_code(location)
    location.gsub(' (PLZ)', '').gsub(' ', '-').downcase
  end

  private

  def self.build_immobiles(response)
    xml_document = Nokogiri::XML(response)
    xml_document.remove_namespaces!
    xml_document.xpath('//entry').collect do |entry_node|
      build_immobile(entry_node)
    end
  end

  def self.build_immobile(immobile_node)
    attributes = {
        link: immobile_node.xpath('id').text,
        marketing_type: immobile_node.xpath('marketingType').text,
        area: immobile_node.xpath('area').text,
        price: immobile_node.xpath('price').text,
        rooms: immobile_node.xpath('rooms').text.to_i,
        postal_code: immobile_node.xpath('postalCode').text
    }
    self.new(attributes)
  end

end
