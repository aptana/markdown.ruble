require 'ruble'

command t(:new_item) do |cmd|
  cmd.key_binding = 'NUMPAD_ENTER'
  cmd.scope = 'text.html.markdown markup.list'
  cmd.output = :insert_as_snippet
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

# now we need to figure out where we were when we hit enter
offsetline = ENV['TM_LINE_NUMBER'].to_i() - ENV['TM_INPUT_START_LINE'].to_i()
index = ENV['TM_LINE_INDEX'].to_i()

list.break(offsetline, index) { |l| e_sn(l) }
print list.to_s()

EOF
end
