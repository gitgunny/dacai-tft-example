--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local dacai_tft_example = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

-- 전역 스크린 ID 정의
main_1_screen_id = 0
screen_1_screen_id = 1
screen_2_screen_id = 2
screen_3_screen_id = 3
screen_4_screen_id = 4
screen_5_screen_id = 5
screen_child_1_screen_id = 6
screen_splite_1_screen_id = 7
screen_splite_2_screen_id = 8
screen_splite_3_screen_id = 9
control_1_screen_id = 10
control_2_screen_id = 11
control_3_screen_id = 12
control_4_screen_id = 13
button_1_screen_id = 14
button_2_screen_id = 15
button_3_screen_id = 16
text_1_screen_id = 17
text_2_screen_id = 18
text_3_screen_id = 19
progress_bar_1_screen_id = 20
progress_bar_2_screen_id = 21
meter_1_screen_id = 22
meter_2_screen_id = 23
slider_1_screen_id = 24
slider_2_screen_id = 25
meter_slider_1_screen_id = 26
rtc_timer_1_screen_id = 27
rtc_timer_2_screen_id = 28

-- 패키지 초기화
screen_main_1 = require("screen_main_1")
screen_screen_1 = require("screen_screen_1")
screen_screen_2 = require("screen_screen_2")
screen_screen_3 = require("screen_screen_3")
screen_screen_4 = require("screen_screen_4")
screen_screen_5 = require("screen_screen_5")
screen_child_1 = require("screen_child_1")
screen_control_1 = require("screen_control_1")
screen_control_2 = require("screen_control_2")
screen_control_3 = require("screen_control_3")
screen_control_4 = require("screen_control_4")
screen_button_1 = require("screen_button_1")
screen_button_2 = require("screen_button_2")
screen_button_3 = require("screen_button_3")
screen_text_1 = require("screen_text_1")
screen_text_2 = require("screen_text_2")
screen_text_3 = require("screen_text_3")
screen_progress_bar_1 = require("screen_progress_bar_1")
screen_progress_bar_2 = require("screen_progress_bar_2")
screen_meter_1 = require("screen_meter_1")
screen_meter_2 = require("screen_meter_2")
screen_slider_1 = require("screen_slider_1")
screen_slider_2 = require("screen_slider_2")
screen_meter_slider_1 = require("screen_meter_slider_1")
screen_rtc_timer_1 = require("screen_rtc_timer_1")
screen_rtc_timer_2 = require("screen_rtc_timer_2")

--- 초기화 함수
--- --- main.lua 파일에서 on_init 콜백 함수 등록 필수
function dacai_tft_example.on_init()
    screen_button_3.on_init()
    screen_rtc_timer_2.on_init()
end

--- 컨트롤 이벤트 콜백 함수
--- main.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function dacai_tft_example.on_control_notify(screen, control, value)
    if screen == main_1_screen_id and value == TOUCH_RELEASE then
        screen_main_1.on_control_notify(screen, control, value)
    elseif screen == screen_1_screen_id and value == TOUCH_RELEASE then
        screen_screen_1.on_control_notify(screen, control, value)
    elseif screen == screen_2_screen_id and value == TOUCH_RELEASE then
        screen_screen_2.on_control_notify(screen, control, value)
    elseif screen == screen_3_screen_id and value == TOUCH_RELEASE then
        screen_screen_3.on_control_notify(screen, control, value)
    elseif screen == screen_4_screen_id and value == TOUCH_RELEASE then
        screen_screen_4.on_control_notify(screen, control, value)
    elseif screen == screen_5_screen_id and value == TOUCH_RELEASE then
        screen_screen_5.on_control_notify(screen, control, value)
    elseif screen == screen_child_1_screen_id and value == TOUCH_RELEASE then
        screen_child_1.on_control_notify(screen, control, value)
    elseif screen == control_1_screen_id and (value == TOUCH_RELEASE or (value >= 0 and value <= 180)) then
        screen_control_1.on_control_notify(screen, control, value)
    elseif screen == control_2_screen_id and (value == TOUCH_RELEASE or (value >= 0 and value <= 180)) then
        screen_control_2.on_control_notify(screen, control, value)
    elseif screen == control_3_screen_id and (value == TOUCH_RELEASE or (value >= 0 and value <= 180)) then
        screen_control_3.on_control_notify(screen, control, value)
    elseif screen == control_4_screen_id and (value == TOUCH_RELEASE or (value >= 0 and value <= 180)) then
        screen_control_4.on_control_notify(screen, control, value)
    elseif screen == button_1_screen_id and (value == TOUCH_RELEASE or value == TOUCH_PRESS or value == TOUCH_LONG_PRESS) then
        screen_button_1.on_control_notify(screen, control, value)
    elseif screen == button_2_screen_id and (value == TOUCH_RELEASE or value == TOUCH_PRESS or value == TOUCH_LONG_PRESS) then
        screen_button_2.on_control_notify(screen, control, value)
    elseif screen == button_3_screen_id and (value == TOUCH_RELEASE or value == TOUCH_PRESS or value == TOUCH_LONG_PRESS) then
        screen_button_3.on_control_notify(screen, control, value)
    elseif screen == text_1_screen_id and value == TOUCH_RELEASE then
        screen_text_1.on_control_notify(screen, control, value)
    elseif screen == text_2_screen_id and value == TOUCH_RELEASE then
        screen_text_2.on_control_notify(screen, control, value)
    elseif screen == text_3_screen_id and value == TOUCH_RELEASE then
        screen_text_3.on_control_notify(screen, control, value)
    elseif screen == progress_bar_1_screen_id and value == TOUCH_RELEASE then
        screen_progress_bar_1.on_control_notify(screen, control, value)
    elseif screen == progress_bar_2_screen_id and value == TOUCH_RELEASE then
        screen_progress_bar_2.on_control_notify(screen, control, value)
    elseif screen == meter_1_screen_id and value == TOUCH_RELEASE then
        screen_meter_1.on_control_notify(screen, control, value)
    elseif screen == meter_2_screen_id and value == TOUCH_RELEASE then
        screen_meter_2.on_control_notify(screen, control, value)
    elseif screen == slider_1_screen_id and value == TOUCH_RELEASE then
        screen_slider_1.on_control_notify(screen, control, value)
    elseif screen == slider_2_screen_id and value == TOUCH_RELEASE then
        screen_slider_2.on_control_notify(screen, control, value)
    elseif screen == meter_slider_1_screen_id and (value == TOUCH_RELEASE or (value >= 0 and value <= 180)) then
        screen_meter_slider_1.on_control_notify(screen, control, value)
    elseif screen == rtc_timer_1_screen_id and value == TOUCH_RELEASE then
        screen_rtc_timer_1.on_control_notify(screen, control, value)
    elseif screen == rtc_timer_2_screen_id and value == TOUCH_RELEASE then
        screen_rtc_timer_2.on_control_notify(screen, control, value)
    end
end

--- 스크린 전환 이벤트 콜백 함수
--- main.lua 파일에서 on_screen_change 콜백 함수 등록 필수
--- @param screen number 호출 스크린 ID
function dacai_tft_example.on_screen_change(screen)
    screen_screen_5.on_screen_change(screen)
end

--- 타이머가 타임아웃에 도달할 때 이 콜백 함수를 호출합니다.
--- main.lua 파일에서 on_timer 콜백 함수 등록 필수
--- @param timer_id number 타이머 번호(0 ~ 31)
function dacai_tft_example.on_timer(timer_id)
    screen_rtc_timer_2.on_timer(timer_id)
end

return dacai_tft_example
