require 'ruble'

command 'Generate Output and Open in Browser' do |cmd|
  cmd.key_binding = 'M4+M1+P'
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :discard
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
MultiMarkdown.pl|"${TM_SMARTYPANTS:-SmartyPants.pl}" > "${TM_DIRECTORY:-/tmp}"/output.html
open "${TM_DIRECTORY:-/tmp}"/output.html
EOF
end
