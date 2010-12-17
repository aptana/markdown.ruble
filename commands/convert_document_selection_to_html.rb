require 'ruble'

command 'Convert Document / Selection to HTML' do |cmd|
  cmd.key_binding = 'M4+M2+H'
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :create_new_document
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
InsertFormatHeader.rb|MultiMarkdown.pl|"${TM_SMARTYPANTS:-SmartyPants.pl}"
EOF
end
