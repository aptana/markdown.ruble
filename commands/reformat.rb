require 'ruble'

command t(:reformat) do |cmd|
  cmd.key_binding = 'M4+{'
  cmd.scope = 'text.html.markdown markup.list'
  cmd.output = :replace_selection
  cmd.input = :selection, :scope
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby

$: << ENV['TM_BUNDLE_SUPPORT']
$: << ENV['TM_SUPPORT_PATH']

require 'lib/markdown'
require 'lib/escape'

# get the list itself
listtxt = $stdin.read()
list = Markdown::List.parse(listtxt)

print list.to_s()

EOF
end
