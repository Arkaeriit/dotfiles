# Fish vi-mode promp

function fish_mode_prompt
#  echo -n "$fish_bind_mode "
  switch $fish_bind_mode
    case default
    set -Ux fish_chev_vi 'n '
    case insert
    set -Ux fish_chev_vi ''
    case replace_one
    set -Ux fish_chev_vi 'r '
    case replace
    set -Ux fish_chev_vi 'R '
    case visual
    set -Ux fish_chev_vi 'v '
    case '*'
    set -Ux fish_chev_vi '? '
      echo '?'
  end
end

