/require alias.tf
/require buff_tracker.tf
/load nm_buff_tracker_config.tf

; FIXME: Make these specific to NM.
/def -i enter = \
  /if (!ismacro("autoenter")) \
    /echo *AUTOMAGIC ENTER ENABLED*%;\
    /def -i -F -mregexp -h"send ^$$" autoenter = \
      $$(/recall -i - -3)%;\
  /else \
    /echo *AUTOMAGIC ENTER DISABLED*%;\
    /undef autoenter%;\
  /endif

; Communication alises
/alias gs group say %{*}

; Movement aliases
/alias cd climb down %{*}
/alias cu climb up %{*}
/alias dd downhill
/alias uu uphill
/alias cm get gear,iron piton,rope from pack%;remove boots,greaves,gloves,helm%;wear gear
/alias ucm put gear,iron piton,rope in pack%;wear boots,greaves,gloves,helm

; Lock aliases
/alias unlg unlock %{*} with keys%;%{*}
/alias unlog unlock %{*} with keys%;open %{*}%;get all from %{*}

; Ranger combat aliases
/alias b blur
/alias bb blur%;blur
/alias conc concentrate %{*}
/alias imp impale %{*}
/alias k kill %{*}
/alias kb kill %{*}%;blur%;blur%;blur%;blur
/alias ki kill %{*}%;impale %{*}%;impale %{*}%;impale %{*}%;impale %{*}
/alias kib kill %{*}%;impale %{*}%;blur%;blur%;blur
/alias kiib kill %{*}%;impale %{*}%;impale %{*}%;blur%;blur
/alias sup surprise %{*}

; Mage helper aliases
/alias kk kill %{*}%;say kill %{*}
/alias fm say Follow me,%{*}
/alias pm say Protect me,%{*}

; General combat aliases
/alias sca scan all
/alias tt wield hands%;wield %{*}
/alias hh hold hands

; Combat status aliases
/alias sca scan all
/alias weap condition weapons

; Healing spell aliases
/alias clw cast cure light wounds %{*}
/alias csw cast cure serious wounds %{*}
/alias ccw cast cure critical wounds %{*}
/alias heal cast heal %{*}

; Buff aliases
/alias hog cast hand of god %{*}
/alias hp cast holy power %{*}
/alias sh cast shield %{*}
/alias soe cast strength of earth %{*}
/alias ua use amulet
/alias ww cast whirlwind %{*}

; Quickwalk aliases
/def do_helio_to_kanex = \
  enter head%;pull wire%;/dopath 4 d 3 s w 4 d s d se 2 d se d w d sw w%;\
  climb down%;climb down%;climb along ledge%;climb down%;climb down%;climb down%;climb down%;\
  climb down%;climb down%;climb down%;/dopath 4 e 2 se 3 w sw%;\
  /repeat -18 1 /dopath w d s se 3 d w sw s 2 e 2 se 3 d sw nw w 3 sw se 3 e 2 sw 3 d 2 sw nw 2 d \
    2 s w %%;/repeat -18 1 /dopath 2 nw w 2 sw s se 5 s w

/def do_kanex_to_helio = \
  /dopath e 5 n nw n 2 ne e 2 se e 2 n 2 u se 2 ne 3 u 2 ne 3 w nw 3 ne e se ne 3 u 2 nw 2 w%;\
  /repeat -18 1 /dopath n ne e 3 u nw n u e ne 3 e 2 nw 4 w%%;\
    climb up%%;climb up%%;climb up%%;climb up%%;climb up%%;climb up%%;\
    climb along ledge%%;climb up%%;climb up%%;climb up%%;/dopath e ne%%;\
    /repeat -18 1 /dopath u e u nw 2 u nw u n 4 u e 3 n 4 u out

; Color setup helper
/alias setup_nm_colors %;\
  color bad-command             WHITE%;\
  color channel_auction         CYAN%;\
  color channel_chat            CYAN%;\
  color channel_newbie          CYAN%;\
  color channel_rp              CYAN%;\
  color combat-fight-assist     YELLOW%;\
  color combat-fight-command    BOLD MAGENTA%;\
  color combat-fight-damage     RED%;\
  color combat-fight-flanking   WHITE%;\
  color combat-fight-major      WHITE%;\
  color combat-fight-miss       YELLOW%;\
  color combat-fight-protect    YELLOW%;\
  color combat-group-assist     YELLOW%;\
  color combat-group-command    BOLD MAGENTA%;\
  color combat-group-damage     RED%;\
  color combat-group-flanking   WHITE%;\
  color combat-group-major      WHITE%;\
  color combat-group-miss       YELLOW%;\
  color combat-group-protect    YELLOW%;\
  color combat-my-assist        YELLOW%;\
  color combat-my-command       BOLD MAGENTA%;\
  color combat-my-damage        RED%;\
  color combat-my-flanking      WHITE%;\
  color combat-my-major         WHITE%;\
  color combat-my-miss          YELLOW%;\
  color combat-my-protect       YELLOW%;\
  color combat-other-assist     YELLOW%;\
  color combat-other-command    BOLD MAGENTA%;\
  color combat-other-damage     RED%;\
  color combat-other-flanking   WHITE%;\
  color combat-other-major      WHITE%;\
  color combat-other-miss       YELLOW%;\
  color combat-other-protect    YELLOW%;\
  color emote                   CYAN%;\
  color group-say               BLUE%;\
  color monitor-critical        RED%;\
  color monitor-high            GREEN%;\
  color monitor-low             BRIGHT_RED%;\
  color monitor-medium          ORANGE%;\
  color room-entry              MAGENTA%;\
  color room-exit               MAGENTA%;\
  color room-short              UNDERLINE GREEN%;\
  color say                     CYAN%;\
  color shout                   CYAN%;\
  color soul                    CYAN%;\
  color targeted-xp             ORANGE%;\
  color tell                    BLUE%;\
  color whisper                 CYAN
