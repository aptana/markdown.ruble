require 'ruble'

command t(:preview) do |cmd|
  cmd.key_binding = 'M4+M3+M1+P'
  cmd.scope = 'text.html.markdown'
  cmd.output = :show_as_html
  cmd.input = :document
  cmd.invoke =<<-EOF
. "$TM_SUPPORT_PATH/lib/webpreview.sh"
html_header "Markdown Preview" "${TM_FILENAME:-}"

if [[ -f "$TM_FILEPATH" ]]; then
  echo "<base href='tm-file://${TM_FILEPATH// /%20}'>"
fi

# Convert to html then make one of the html tags above caret 
# into a link that we scroll down to
"${TM_MARKDOWN:-Markdown.pl}"|"${TM_SMARTYPANTS:-SmartyPants.pl}"|${TM_RUBY:-ruby} -e '
lines = STDIN.read.split("\n")
n = [ENV["TM_LINE_NUMBER"].to_i, lines.length].min - 7

while n > 0 && !lines[n].match(/<(h\d|p|ul|li|blockquote|pre|div|img|code|table|tr)>/i)
  n -= 1
end

if n > 0 && m = lines[n].match(/<(h\d|p|ul|li|blockquote|pre|div|img|code|table|tr)>(.*)$/i)
  lines[n] = "<#\{m[1]} id=\"scroll_to_here\" >#\{m[2]}"
end

puts lines.join("\n")
puts "\n<script>window.location.hash = \"scroll_to_here\";</script>"
'
html_footer
EOF
end
