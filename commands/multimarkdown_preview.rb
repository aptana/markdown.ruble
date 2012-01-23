require 'ruble'

command t(:preview) do |cmd|
  cmd.key_binding = 'M4+M3+M1+P'
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :show_as_html
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
. "$TM_SUPPORT_PATH/lib/webpreview.sh"

if [[ -z $TM_FILENAME ]]
  then title="Markdown as HTML"
  else title="${TM_FILENAME%.*}"
fi

html_header "$title" "MultiMarkdown"

if [[ -f "$TM_FILEPATH" ]]; then
  echo "<base href='tm-file://${TM_FILEPATH// /%20}'>"
fi

MultiMarkdown.pl|"${TM_SMARTYPANTS:-SmartyPants.pl}"
html_footer
EOF
end
