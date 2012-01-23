snippet t(:hard_linebreak) do |s|
  # FIXME No tab trigger, probably needs to become command
  s.key_binding = 'M4+ENTER'
  s.scope = 'text.html.markdown -meta.disable-markdown'
  s.expansion = '  
'
end

