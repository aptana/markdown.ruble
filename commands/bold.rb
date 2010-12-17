require 'ruble'

def esc(str)
  e_sn(str).gsub(/\}/, '\\}') # escaping inside a placeholder
end
    
command 'Bold' do |cmd|
  cmd.key_binding = 'M1+B'
  cmd.scope = 'text.html.markdown -meta.disable-markdown'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :word
  cmd.invoke do
    require 'escape'
    
    s = $stdin.read
    if s.empty?
      "**$1**"
    elsif s =~ /^\*{2}(.*)\*{2}$/
      "${1:#{esc $1}}"
    elsif ENV.has_key? 'TM_SELECTED_TEXT'
      "${1:**#{esc s}**}"
    else
      "**#{e_sn s}**"
    end
  end
end
