require 'ox'
require 'json'

class JSON2XML
  def self.convert(json_str)
    new(json_str).send(:xml)
  end

  private
    attr_reader :json_str

    def initialize(json_str)
      @json_str = json_str
    end

    def xml
      Ox.dump(document, with_xml: true)
    end

    def document
      Ox::Document.new(version: '1.0').tap do |doc|
        doc << root_node
      end
    end

    def root_node
      Ox::Element.new('cities').tap do |root|
        root[:count] = city_nodes.size
        city_nodes.each { |city| root << city }
      end
    end

    def city_nodes
      @city_nodes ||=
        json_str.each_line.map { |line| parse_city_node(line) }
    end

    def parse_city_node(json)
      Ox::Element.new('city').tap do |city|
        attrs = JSON.parse(json)

        city[:id] = attrs.fetch('_id')
        city[:name] = attrs.fetch('city')
        city[:state] = attrs.fetch('state')
        city[:location] = format_coord(attrs.fetch('loc'))
        city[:population] = attrs.fetch('pop').to_s
      end
    end

    def format_coord(coord)
      coord.join(',')
    end
end

input = File.read('input.json')
puts JSON2XML.convert(input)
