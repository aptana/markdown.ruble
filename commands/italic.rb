require 'ruble'

def esc(str)
  e_sn(str).gsub(/\}/, '\\}') # escaping inside a placeholder
end
    
command t(:italic) do |cmd|
  cmd.key_binding = 'M1+I'
  cmd.scope = 'text.html.markdown -meta.disable-markdown'
  cmd.output = :insert_as_snippet
  cmd.input = :selection, :word
  cmd.invoke do
    require 'escape'
    
    s = $tdin.read
    if s.empty?
      "*$1*"
    elsif s =~ /^(\*+)(.*[^\*])\*+$/
      m, s = $1, $2
      case m.length
        when 1
          "${1:#{esc s}}"
        when 2
          "${1:***#{esc s}***}"
        else
          "${1:**#{esc s}**}"
      end
    elsif ENV.has_key? 'TM_SELECTED_TEXT'
      "${1:*#{esc s}*}"
    else
      "*#{e_sn s}*"
    end
  end
end
