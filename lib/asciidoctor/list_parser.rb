# encoding: UTF-8
module Asciidoctor
  class ListParser

    def self.load_file(filename, options = {})
      ::File.open(filename) {|file| self.load file, options }
    end

    def self.load(input, options = {})
      lines = input.readlines
      Document.new(lines, options).parse_list
    end

    def self.parse(reader, document, options = {})
      context = {}
      current_list_level = 0
      list_block = nil
      while reader.has_more_lines?
        line = reader.read_line
        reader.
        p '>>> line: ' + line
        if UnorderedListRx.match? line
          if context['list_start'] && context['list_level'] == current_list_level && context['list_type'] == :ulist
            # Same list, continue adding item to the list_block
          else
            # New list
            list_block = List.new(document, :ulist)
            document << list_block if list_block
          end
          context['list_start'] = true
          context['list_level'] = 0
          context['list_type'] = :ulist
          list_block << ListItem.new(list_block, line)
        elsif OrderedListRx.match? line
          if context['list_start'] && context['list_level'] == current_list_level && context['list_type'] == :olist
            # Same list, continue adding item to the list_block
          else
            # New list
            list_block = List.new(document, :olist)
            document << list_block if list_block
          end
          list_block << ListItem.new(list_block, line)
          context['list_start'] = true
          context['list_level'] = 0
          context['list_type'] = :olist
        end
      end
      document
    end
  end
end