; Buff duration tracking magic.
; Generic timer helpers.
/require assoc.tf
/def timestring = \
  /let minutes=$[(%{*}) / 60]%;\
  /let seconds=$[mod(%{*}, 60)]%;\
  /result strcat(%{minutes}, "m ", %{seconds}, "s") 
/def start_timer = \
  /assoc timer %{*}=$[trunc(time())]
/def stop_timer = \
  /let alpha=$(/rassoc timer %{*})%;\
  /let omega=$[trunc(time())]%;\
  /assoc timer %{*}%;\
  /echo -aBCmagenta $[strcat(">>> ", %{*}, " lasted for ", timestring(%{omega}-%{alpha}), " <<<")]
/def ltimer = \
  /echo -aB ================================== Active Timers ==================================%;\
  /mapassoc timer=/_ltimer%;\
  /echo -aB ===================================================================================
/def -i _ltimer = \
  /split %{*}%;\
  /echo $[pad(strcat(%{P1}, ": "), -30, timestring(trunc(time()) - %{P2}), -49)]

; Cymoc aegis
/def -wNM -msimple -t"A gossamer net glows around you." nm_aegis_start = \
  /start_timer Aegis
/def -wNM -msimple -t"The gossamer glow around you fades." nm_aegis_stop = \
  /stop_timer Aegis
; Cymoc priest shield
/def -wNM -msimple -t"You have the protection of Cymoc." nm_priest_shield_start = \
  /start_timer Priest shield
/def -wNM -msimple -t"You feel the protection leave you." nm_priest_shield_stop = \
  /stop_timer Priest shield
; Holy power
/def -wNM -msimple -t"You feel power surge through your body. It almost makes you feel godlike." \
    nm_holy_power_start = \
  /start_timer Holy power
/def -wNM -msimple -t"The holy power drains away, and you feel more normal again." \
    nm_holy_power_stop = \
  /stop_timer Holy power
; Amulet
/def -wNM -msimple \
    -t"You curl your fingers around your holy amulet, and a faint glow of holy wisdom" \
    nm_amulet_start1 = \
  /start_timer Amulet
/def -wNM -msimple \
    -t"You grip your holy amulet with sudden fervor, invoking its power with the" \
    nm_amulet_start2 = \
  /start_timer Amulet
/def -wNM -msimple \
    -t"You lay your palm on your holy amulet, channeling your faith through the cold" \
    nm_amulet_start3 = \
  /start_timer Amulet
/def -wNM -msimple -t"You feel a little less wise as the power from the amulet fades." \
    nm_amulet_stop = \
  /stop_timer Amulet
/def -wNM -msimple -t"A forcefield solidifies around you." nm_mage_shield_start = \
  /start_timer Mage shield
/def -wNM -msimple -t"The air shimmers around you." nm_mage_shield_stop = \
  /stop_timer Mage shield
/def -wNM -msimple \
    -t"You are overcome with an odd sensation, as if you do not exist on any single" \
    nm_dblink_start = \
  /start_timer Dimension blink
/def -wNM -msimple -t"The odd sensation that you had been experiencing, flickering between the" \
    nm_dblink_stop = \
  /stop_timer Dimension blink
/def -wNM -msimple \
    -t"The elemental power of Cymoc hammers into you, empowering you with the strength" \
    nm_soe_start = \
  /start_timer Strength of earth
/def -wNM -msimple -t"The elemental power of Cymoc reluctantly releases you." \
    nm_soe_stop = \
  /stop_timer Strength of earth
