require 'ruble'

bundle 'Markdown' do |bundle|
  bundle.author = 'Michael Sheets'
  bundle.contact_email_rot_13 = 'zfurrgf@juvgrsnyyf.bet'
  bundle.description =  <<END
<a href="http://daringfireball.net/projects/markdown/">Markdown</a> allows you to write using an easy-to-read, easy-to-write plain text format, then convert it to structurally valid XHTML. This bundle provides preview functionality, syntax highlighting, and several useful commands.
END
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

  bundle.menu 'Markdown' do |main_menu|
    main_menu.command 'Preview'
    main_menu.command 'Convert Document / Selection to HTML'
    main_menu.command 'Syntax Cheat Sheet'
    main_menu.separator
    main_menu.menu 'MultiMarkdown' do |submenu|
      submenu.command 'Preview'
      submenu.command 'Generate Output and Open in Browser'
      submenu.separator
      submenu.command 'Convert Document / Selection to HTML'
      submenu.command 'Convert Document / Selection to LaTeX'
      submenu.command 'Convert Document / Selection to LaTeX (Memoir)'
      submenu.command 'Convert Document / Selection to PDF'
      submenu.command 'Convert Document / Selection to RTF'
    end
    main_menu.separator
    main_menu.menu 'Format' do |submenu|
      submenu.command 'Bold'
      submenu.command 'Italic'
    end
    main_menu.separator
    main_menu.menu 'Headings' do |submenu|
      submenu.command 'Level 1 [setext]'
      submenu.command 'Level 2 [setext]'
    end
    main_menu.menu 'Lists' do |submenu|
      submenu.command 'New Item'
      submenu.command 'New Subitem'
      submenu.separator
#      submenu.command '2E75B4D8-E6E8-4E3C-969D-FFC650092A39'
      submenu.command 'Select Item'
      submenu.separator
      submenu.command 'Reformat'
      submenu.command 'Change Style'
    end
    main_menu.separator
    main_menu.command 'Hard Linebreak'
  end
end
smart_typing_pairs['text.html.markdown'] = ['"', '"', '(', ')', '{', '}', '[', ']', '`', '`', '_', '_', '<', '>']
smart_typing_pairs['text.html.markdown markup.raw, text.html.markdown meta.link'] = ['"', '"', '(', ')', '{', '}', '[', ']', '`', '`']
