require 'ruble'

command 'Level 2 [setext]' do |cmd|
  cmd.scope = 'text.html.markdown'
  cmd.trigger = '-'
  cmd.output = :insert_as_text
  cmd.input = :document
  cmd.invoke =<<-EOF
#!/usr/bin/env ruby -wKU

require 'jcode'

# Split document into lines. Get current line number minus one for
# previous, minus another for ruby being 0 based.
lines = STDIN.readlines
line  = ENV['TM_LINE_NUMBER'].to_i - 2

# Get length of previous line, using jlength for unicode
length = lines[line].rstrip.jlength

# Print same number of -
length.times { print "-" }

EOF
end
