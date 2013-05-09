; Buff duration tracking magic.
; Generic timer helpers.
/loaded buff_tracker.tf

/require assoc.tf

/def timestring = \
  /let minutes $[(%{*}) / 60]%;\
  /let seconds $[mod(%{*}, 60)]%;\
  /result strcat(%{minutes}, "m ", %{seconds}, "s") 
/def start_timer = \
  /assoc timer %{*}=$[trunc(time())]
/def stop_timer = \
  /let alpha $(/rassoc timer %{*})%;\
  /let omega $[trunc(time())]%;\
  /assoc timer %{*}%;\
  /echo -aBCmagenta $[strcat(">>> ", %{*}, " lasted for ", timestring(%{omega}-%{alpha}), " <<<")]
/def ltimer = \
  /echo -aB ================================== Active Timers ==================================%;\
  /mapassoc timer=/_ltimer%;\
  /echo -aB ===================================================================================
/def -i _ltimer = \
  /split %{*}%;\
  /echo $[pad(strcat(%{P1}, ": "), -30, timestring(trunc(time()) - %{P2}), -49)]
