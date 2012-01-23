require 'ruble'

command t(:convert_to_html) do |cmd|
  cmd.key_binding = 'M4+M2+H'
  cmd.scope = 'text.html.markdown'
  cmd.output = :replace_selection
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
# This command works well when you use the TextMate service from a 
# web-log editor like Ecto or MarsEdit.  You can write in markdown
# and then convert back to html before save and close.

HTML4=$([ -n "$TM_XHTML" ] || echo '--html4tags')
"${TM_MARKDOWN:-Markdown.pl}" $HTML4|"${TM_SMARTYPANTS:-SmartyPants.pl}"|perl -pe '
	# make <h1>Header</h1> into <h1 id="header">Header</h1>
	# so that we can link to page#header
	if(($tag, $title) = /<(h[1-6])>(.*?)<\/\1>/) {
		$_ = $title;
		s/<[^>]+>|&\w+;//g;	# remove tag and entities
		s/[^-_ \/\w]//g;		# remove all but word and separators
		s/[-_ \/]+/_/g;		# collapse all separators into _
		$_ = "<$tag id=\"" . (lc $_) . "\">$title</$tag>\n";
	}'

EOF
end
