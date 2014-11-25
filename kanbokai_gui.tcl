##
##
## ASI120MC みさと天文台 観望会用補助GUI
##
##


#
# 環境設定
#

# ここは実際のパスに書き換えてください
set exec_file "C:/Program Files/ZWO Design/ASI120MC Camera/USB CAMERA.exe"

# フォント選択
option add *font {{ＭＳ ゴシック} 20}

# ここはこのままでお使いください
set nircmd_file "nircmd/nircmd.exe"


#
# nircmd の引数
#

# AMCap ウィンドウの位置，サイズ
set arg_fixsize "win setsize title AMCap 280 0 950 785"
# ボタンがへこんでいる時間
set arg_button_wait "wait 500"

set arg_activate "win activate title AMCap"
set arg_focus "win focus title AMCap"
set arg_exit "sendkeypress esc alt+f x"
set arg_close "win close title AMCap"

#set arg_esc_key "win child title AMCap close alltop"
set arg_goto_filter "sendkeypress esc alt+o down down enter"
set arg_default "sendkeypress tab tab tab tab tab tab spc tab"
set arg_goto_exposure "sendkeypress tab tab left left right right shift+tab"
set arg_key_enter "sendkeypress enter"
set arg_exposure1s "sendkeypress pagedown pageup"
set arg_exposure5s_0 "sendkeypress right right right right"
set arg_exposure5s_1 "sendkeypress pagedown pageup"
set arg_exposure10s_0 "sendkeypress right right right right"
set arg_exposure10s_1 "sendkeypress right right right right right"
set arg_exposure10s_2 "sendkeypress pagedown pageup"
set arg_exposure20s_0 "sendkeypress right right right right"
set arg_exposure20s_1 "sendkeypress right right right right right"
set arg_exposure20s_2 "sendkeypress right right right right right"
set arg_exposure20s_3 "sendkeypress right right right right right"
set arg_exposure20s_4 "sendkeypress pagedown pageup"
set arg_exposure30s_0 "sendkeypress right right right right"
set arg_exposure30s_1 "sendkeypress right right right right right"
set arg_exposure30s_2 "sendkeypress right right right right right"
set arg_exposure30s_3 "sendkeypress right right right right right"
set arg_exposure30s_4 "sendkeypress right right right right right"
set arg_exposure30s_5 "sendkeypress right right right right right"
set arg_exposure30s_6 "sendkeypress pagedown pageup"
set arg_gain100 "sendkeypress end pagedown"
set arg_gain95_0 "sendkeypress end left left left left left"
set arg_gain95_1 "sendkeypress pageup pagedown"
set arg_gain90_0 "sendkeypress end left left left left left"
set arg_gain90_1 "sendkeypress left left left left left"
set arg_gain90_2 "sendkeypress pageup pagedown"
set arg_gain80 "sendkeypress end pageup left pagedown pageup"
set arg_goto_dark_0 "sendkeypress ctrl+tab ctrl+tab"
set arg_goto_dark_1 "sendkeypress shift+tab shift+tab shift+tab shift+tab shift+tab shift+tab spc"
set arg_preview_0 "sendkeypress esc alt+o p"
set arg_preview_1 "sendkeypress n"


#
# main
#

# 常に上位に表示
wm attributes . -topmost 1

# ウィンドウのサイズと位置を設定
wm geometry . "+0+0"

# カレントディレクトリを取得
set cdir [pwd]
#set cdir [regsub -all {\\} $win_cdir {/}]

# viewerを起動
exec $exec_file &
#exec $nircmd_file &

cd "$cdir"

eval exec $nircmd_file "wait 500"
eval exec $nircmd_file $arg_activate
eval exec $nircmd_file $arg_fixsize


# ボタンに対するイベントを定義

message .m0 -width 190 -text "観望会用GUI"
button .b00 -text "プレビューON/OFF" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_fixsize
  eval exec $nircmd_file $arg_preview_0
  eval exec $nircmd_file $arg_preview_1
  eval exec $nircmd_file $arg_button_wait
}
button .b01 -text "デフォルト" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_default
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b0 -text "露出時間1秒" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_exposure
  eval exec $nircmd_file $arg_exposure1s
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b1 -text "露出時間5秒" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_exposure
  eval exec $nircmd_file $arg_exposure5s_0
  eval exec $nircmd_file $arg_exposure5s_1
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b2 -text "露出時間10秒" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_exposure
  eval exec $nircmd_file $arg_exposure10s_0
  eval exec $nircmd_file $arg_exposure10s_1
  eval exec $nircmd_file $arg_exposure10s_2
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b3 -text "露出時間20秒" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_exposure
  eval exec $nircmd_file $arg_exposure20s_0
  eval exec $nircmd_file $arg_exposure20s_1
  eval exec $nircmd_file $arg_exposure20s_2
  eval exec $nircmd_file $arg_exposure20s_3
  eval exec $nircmd_file $arg_exposure20s_4
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b4 -text "露出時間30秒" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_exposure
  eval exec $nircmd_file $arg_exposure30s_0
  eval exec $nircmd_file $arg_exposure30s_1
  eval exec $nircmd_file $arg_exposure30s_2
  eval exec $nircmd_file $arg_exposure30s_3
  eval exec $nircmd_file $arg_exposure30s_4
  eval exec $nircmd_file $arg_exposure30s_5
  eval exec $nircmd_file $arg_exposure30s_6
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b10 -text "ゲイン80" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_gain80
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b11 -text "ゲイン90" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_gain90_0
  eval exec $nircmd_file $arg_gain90_1
  eval exec $nircmd_file $arg_gain90_2
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b12 -text "ゲイン95" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_gain95_0
  eval exec $nircmd_file $arg_gain95_1
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b13 -text "ゲイン100" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_gain100
  eval exec $nircmd_file $arg_button_wait
  eval exec $nircmd_file $arg_key_enter
}
button .b20 -text "ダーク引きON/OFF" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_goto_filter
  eval exec $nircmd_file $arg_goto_dark_0
  eval exec $nircmd_file $arg_goto_dark_1
  eval exec $nircmd_file $arg_button_wait
}
button .b99 -text "終了" -command {
  eval exec $nircmd_file $arg_activate
  eval exec $nircmd_file $arg_exit
  eval exec $nircmd_file $arg_close
  exit
}
message .m10 -width 220 -text "AMCapのサブウィンドウは閉じて操作してください"

# デバッグ用
#message .dbg0 -text "$win_cdir"
message .dbg1 -text "$cdir"

# 部品の表示/非表示を決定

pack .m0
pack .b00
pack .b01
pack .b0
pack .b1
pack .b2
pack .b3
pack .b4
pack .b10
pack .b11
pack .b12
pack .b13
pack .b20
pack .b99
pack .m10
#pack .dbg0
#pack .dbg1

