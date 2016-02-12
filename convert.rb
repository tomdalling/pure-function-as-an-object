require 'ox'
require 'json'

class JSON2XML
  def self.convert(input_json)
    new(input_json).send(:xml)
  end

  private
    private_class_method :new
    attr_reader :input_json

    def initialize(input_json)
      @input_json = input_json
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
        input_json.each_line.map { |line| parse_city_node(line) }
    end

    def parse_city_node(line)
      Ox::Element.new('city').tap do |city|
        attrs = JSON.parse(line)

        city[:id] = attrs.fetch('_id')
        city[:name] = attrs.fetch('city')
        city[:state] = attrs.fetch('state')
        city[:location] = attrs.fetch('loc').join(',')
        city[:population] = attrs.fetch('pop').to_s
      end
    end
end

input = File.read('input.json')
puts JSON2XML.convert(input)
