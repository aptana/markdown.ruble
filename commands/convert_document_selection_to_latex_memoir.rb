require 'ruble'

command 'Convert Document / Selection to LaTeX (Memoir)' do |cmd|
  cmd.scope = 'text.html.markdown.multimarkdown'
  cmd.output = :create_new_document
  cmd.input = :selection, :document
  cmd.invoke =<<-EOF
InsertFormatHeader.rb|MultiMarkdown.pl|SmartyPants.pl|xsltproc -novalid -nonet "$TM_BUNDLE_SUPPORT/xhtml2memoir.xslt" -
EOF
end
