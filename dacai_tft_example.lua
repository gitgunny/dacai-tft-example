--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local dacai_tft_example = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PUSH = 1

-- 전역 스크린 ID 정의
main_1_screen_id = 0
screen_1_screen_id = 1
screen_2_screen_id = 2
screen_3_screen_id = 3
screen_child_screen_id = 4
screen_splite_1_screen_id = 5
screen_splite_2_screen_id = 6
screen_splite_3_screen_id = 7
control_screen_id = 8
button_screen_id = 9
text_screen_id = 10

-- 패키지 초기화
screen_main_1 = require("screen_main_1")
screen_screen_1 = require("screen_screen_1")
screen_screen_2 = require("screen_screen_2")
screen_screen_3 = require("screen_screen_3")
screen_child = require("screen_child")
screen_control = require("screen_control")
screen_button = require("screen_button")
screen_text = require("screen_text")

--- 초기화 함수
--- --- main.lua 파일에서 on_init 콜백 함수 등록 필수
function dacai_tft_example.on_init()
    screen_button.on_init()
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
    elseif screen == screen_child_screen_id and value == TOUCH_RELEASE then
        screen_child.on_control_notify(screen, control, value)
    elseif screen == control_screen_id and value == TOUCH_RELEASE then
        screen_control.on_control_notify(screen, control, value)
    elseif screen == button_screen_id and (value == TOUCH_RELEASE or value == TOUCH_PUSH) then
        screen_button.on_control_notify(screen, control, value)
    elseif screen == text_screen_id and value == TOUCH_RELEASE then
        screen_text.on_control_notify(screen, control, value)
    end
end

--- 스크린 전환 이벤트 콜백 함수
--- main.lua 파일에서 on_screen_change 콜백 함수 등록 필수
--- @param screen number 호출 스크린 ID
function dacai_tft_example.on_screen_change(screen)
    screen_screen_3.on_screen_change(screen)
end

return dacai_tft_example
