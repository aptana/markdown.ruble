require 'ruble'

command t(:syntax_cheat_sheet) do |cmd|
  cmd.key_binding = 'M4+H'
  cmd.scope = 'text.html.markdown'
  cmd.output = :show_as_html
  cmd.input = :none
  cmd.invoke =<<-EOF
. "$TM_SUPPORT_PATH/lib/webpreview.sh"
html_header "Markdown Cheat Sheet"
Markdown.pl "$TM_BUNDLE_SUPPORT/help.markdown"
html_footer
EOF
end
