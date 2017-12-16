# encoding: UTF-8
unless defined? ASCIIDOCTOR_PROJECT_DIR
  $: << File.dirname(__FILE__); $:.uniq!
  require 'test_helper'
end

BUILT_IN_ELEMENTS = %w(admonition audio colist dlist document embedded example floating_title image inline_anchor inline_break inline_button inline_callout inline_footnote inline_image inline_indexterm inline_kbd inline_menu inline_quoted listing literal stem olist open page_break paragraph pass preamble quote section sidebar table thematic_break toc ulist verse video)

require 'asciidoctor/list_parser'

context 'List Parser' do

  test 'should track file and line information on list items if sourcemap option is set' do
    doc = Asciidoctor::ListParser.load_file fixture_path('lists.adoc'), :sourcemap => true
    p doc.blocks.length
    p doc.blocks[0].blocks[0].text
    p doc.blocks[0].blocks[1].text
    p doc.blocks[0].blocks[2].text

    p doc.blocks[1].blocks[0].text
    p doc.blocks[1].blocks[1].text
    p doc.blocks[1].blocks[2].text
    p doc.blocks[1].blocks[3].text
    p doc.blocks[1].blocks[4].text
    p doc.blocks[1].blocks[5].text
    p doc.blocks[1].blocks[6].text
    p doc.blocks[2]
    p doc.blocks[3]
    p doc.blocks[4]
    #p doc.blocks[0].blocks
    #p doc.blocks[0].blocks[0].text
    #p doc.blocks[1].blocks
    #p doc.blocks[2].blocks
  end
end