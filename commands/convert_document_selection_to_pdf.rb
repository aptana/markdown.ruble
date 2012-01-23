require 'ruble'

command t(:convert_to_pdf) do |cmd|
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :show_as_html
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
# first figure out a name for the result
NAME="${TM_FILENAME:-untitled}"
BASENAME="${NAME%.*}"
DST="/tmp/$BASENAME"

InsertFormatHeader.rb|MultiMarkdown.pl|SmartyPants.pl|"${TM_RUBY:-ruby}" >"$DST.html" -KU -pe '$_.gsub!(/[^\x00-\x7F]/) { |ch| "&##\{ch.unpack("U")[0]};" }'

# show the generated HTML file
cat "$DST.html"

# convert to PDF with htmldoc
require_cmd htmldoc
htmldoc -f "$DST.pdf" --header "" --footer "" --webpage "$DST.html"

# open in the users PDF viewer (falling back on Preview)
viewer=$(find_app "${TM_PDF_VIEWER:-Preview.app}")
if [ $? = 0 ];
	then open -a "$viewer" "$DST.pdf"
	else echo "Could not find your PDF viewer: ‘${TM_PDF_VIEWER:-Preview.app}’"
fi

EOF
end
