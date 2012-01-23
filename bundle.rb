require 'ruble'

bundle do |bundle|
  bundle.display_name = t(:bundle_name)
  bundle.author = 'Michael Sheets'
  bundle.contact_email_rot_13 = 'zfurrgf@juvgrsnyyf.bet'
  bundle.description = '<a href="http://daringfireball.net/projects/markdown/">Markdown</a> allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML. This bundle provides preview functionality, syntax highlighting, and several useful commands.'
  
  increase_indent = /^.*(\{[^}"']*|\([^)"']*)$/
  decrease_indent = /^(.*\*\/)?\s*\}[;\s]*$/
  bundle.indent['markup.raw.block.markdown'] = increase_indent, decrease_indent
  
  start_folding = /(?x)
		(<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
		|<!--(?!.*-->)
		|\{\s*($|\?>\s*$|\/\/|\/\*(.*\*\/\s*$|(?!.*?\*\/)))
		)/
  end_folding = /(?x)
		(<\/(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
		|^\s*-->
		|(^|\s)\}
		)/
  bundle.folding['text.html.markdown'] = start_folding, end_folding
  
  start_folding = /(?x)
		(<(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)\b.*?>
		|<!--(?!.*-->)
		|\{\s*($|\?>\s*$|\/\/|\/\*(.*\*\/\s*$|(?!.*?\*\/)))
		)/
  end_folding = /(?x)
		(<\/(?i:head|body|table|thead|tbody|tfoot|tr|div|select|fieldset|style|script|ul|ol|form|dl)>
		|^\s*-->
		|(^|\s)\}
		)/
  bundle.folding['text.html.markdown.multimarkdown'] = start_folding, end_folding
  bundle.file_types['text.html.markdown'] = '*.mdown', '*.markdown', '*.markdn', '*.md'

  bundle.menu t(:bundle_name) do |main_menu|
    main_menu.command t(:preview)
    main_menu.command t(:convert_to_html)
    main_menu.command t(:syntax_cheat_sheet)
    main_menu.separator
    main_menu.menu t(:multi_markdown) do |submenu|
      submenu.command t(:preview)
      submenu.command t(:generate_and_open_in_browser)
      submenu.separator
      submenu.command t(:convert_to_html)
      submenu.command t(:convert_to_latex)
      submenu.command t(:convert_to_latex_memoir)
      submenu.command t(:convert_to_pdf)
      submenu.command t(:convert_to_rtf)
    end
    main_menu.separator
    main_menu.menu t(:format) do |submenu|
      submenu.command t(:bold)
      submenu.command t(:italic)
    end
    main_menu.separator
    main_menu.menu t(:headings) do |submenu|
      submenu.command t(:level_1)
      submenu.command t(:level_2)
    end
    main_menu.menu t(:lists) do |submenu|
      submenu.command t(:new_item)
      submenu.command t(:new_subitem)
      submenu.separator
#      submenu.command '2E75B4D8-E6E8-4E3C-969D-FFC650092A39'
      submenu.command t(:select_item)
      submenu.separator
      submenu.command t(:reformat)
      submenu.command t(:change_style)
    end
    main_menu.separator
    main_menu.command t(:hard_linebreak)
  end
end
smart_typing_pairs['text.html.markdown'] = ['"', '"', '(', ')', '{', '}', '[', ']', '`', '`', '_', '_', '<', '>']
smart_typing_pairs['text.html.markdown markup.raw, text.html.markdown meta.link'] = ['"', '"', '(', ')', '{', '}', '[', ']', '`', '`']
