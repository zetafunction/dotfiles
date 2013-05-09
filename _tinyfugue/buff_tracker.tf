;;; Buff tracker module.
;;;
;;; This code is built on top of the associative tables built by Cheetah.
;;; Data is stored in three tables:
;;; buff_tracker_name: buff id -> pretty name
;;; buff_tracker_time: buff id -> start time
;;; buff_tracker_macro: buff id -> macro ids to trigger start/end for that buff

/loaded buff_tracker.tf

/require assoc.tf

;;; /_buff_tracker_get_second_word
; Simple helper to extract the second word in a string.
/def -i _buff_tracker_get_second_word = \
  /echo %{2}

;;; _buff_tracker_timediff(<start>, <end>)
; Pretty prints the difference between two timestamps.
/def -i _buff_tracker_timediff = \
  /let difference $[%{2} - %{1}]%;\
  /let minutes $[(%{difference}) / 60]%;\
  /let seconds $[mod(%{difference}, 60)]%;\
  /result strcat(%{minutes}, "m ", %{seconds}, "s")

/def -i _buff_tracker_start_timer = \
  /assoc buff_tracker_time %{*}=$[trunc(time())]

/def -i _buff_tracker_stop_timer = \
  /let alpha $(/rassoc buff_tracker_time %{*})%;\
  /let omega $[trunc(time())]%;\
  /assoc buff_tracker_time %{*}%;\
  /echo -aBCmagenta -w$[world_info()] \
    $[strcat(">>> ", $(/rassoc buff_tracker_name %{*}), " lasted for ",\
             _buff_tracker_timediff(%{alpha}, %{omega}), " <<<")]

;;; /ltimer
; Lists all tracked buffs for the current world and the elapsed time.
/def ltimer = \
  /let world $[world_info()]%;\
  /echo -aB $[strrep("=", 32)] Active Timers $[strrep("=", 32)]%;\
  /mapassoc buff_tracker_time %{world}=/_buff_tracker_ltimer_helper%;\
  /echo -aB $[strrep("=", 79)]

/def -i _buff_tracker_ltimer_helper = \
  /split %{*}%;\
  /let key_name %{P1}%;\
  /let start_time %{P2}%;\
  /let buff_id $(/_buff_tracker_get_second_word %{key_name})%;\
  /echo $[pad(strcat($(/rassoc buff_tracker_name %{buff_id}), ": "), -30,\
              _buff_tracker_timediff(%{start_time}, trunc(time())), -49)]

;;; /declare_buff <world> <identifier> <friendly string>
/def declare_buff = \
  /assoc buff_tracker_name %{1}_%{2}=%{-2}

;;; /add_buff_start_message <world> <identifier> <message>
/def add_buff_start_message = \
  /def -i -w%{1} -msimple -t%{-2} = \
    /_buff_tracker_start_timer %{1}_%{2}%;\
  /let defn %{?}%;\
  /assoc buff_tracker_macro %{1}_%{2}=%{defn} $(/rassoc buff_tracker_macro %{1}_%{2})

;;; /add_buff_end_message <world> <identifier> <message>
/def add_buff_end_message = \
  /def -i -w%{1} -msimple -t%{-2} = \
    /_buff_tracker_stop_timer %{1}_%{2}%;\
  /let defn %{?}%;\
  /assoc buff_tracker_macro %{1}_%{2}=%{defn} $(/rassoc buff_tracker_macro %{1}_%{2})

;;; /reset_buffs <world>
/def reset_buffs = \
  /mapassoc buff_tracker_macro %{1}=/_buff_tracker_reset_helper

/def -i _buff_tracker_reset_helper =\
  /split %{*}%;\
  /let key_name %{P1}%;\
  /let macro_ids %{P2}%;\
  /let buff_id $(/_buff_tracker_get_second_word %{key_name})%;\
  /assoc buff_tracker_name %{buff_id}%;\
  /assoc buff_tracker_time %{buff_id}%;\
  /assoc buff_tracker_macro %{buff_id}%;\
  /undefn %{macro_ids}
