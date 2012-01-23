require 'ruble'

command t(:convert_to_rtf) do |cmd|
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :discard
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
# first figure out a name for the result
NAME="${TM_FILENAME:-untitled}"
BASENAME="${NAME%.*}"
DST="/tmp/$BASENAME"

InsertFormatHeader.rb|MultiMarkdown.pl|SmartyPants.pl >"$DST.html"

# textutil is included with Tiger
require_cmd textutil
textutil -convert rtf -extension rtf -font Times -fontsize 11 "$DST.html"

open -a TextEdit.app "$DST.rtf"

EOF
end
