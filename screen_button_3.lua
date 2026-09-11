--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_button_3 = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

local STATE_DISABLE = 0
local STATE_OFF = 1
local STATE_ON = 2

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local switch_toggle_button_id = 4
local switch_toggle_icon_id = 5
local switch_1_button_id = 7
local switch_1_icon_id = 8
local switch_2_button_id = 10
local switch_2_icon_id = 11
local switch_3_button_id = 13
local switch_3_icon_id = 14
local switch_batch_button_id = 16
local switch_batch_icon_id = 17

--- 초기화 함수
--- dacai_tft_example.lua 파일에서 on_init 콜백 함수 등록 필수
function screen_button_3.on_init()
    set_value(button_3_screen_id, switch_toggle_icon_id, STATE_OFF)
    set_value(button_3_screen_id, switch_1_icon_id, STATE_OFF)
    set_value(button_3_screen_id, switch_2_icon_id, STATE_OFF)
    set_value(button_3_screen_id, switch_3_icon_id, STATE_OFF)
    set_value(button_3_screen_id, switch_batch_icon_id, STATE_OFF)
end

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_button_3.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id and value == TOUCH_RELEASE then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(button_2_screen_id)
    elseif control == next_screen_button_id and value == TOUCH_RELEASE then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == switch_toggle_button_id and value == TOUCH_RELEASE then
        -- 토글 버튼 터치 시 토글
        local current_switch_state = get_value(button_3_screen_id, switch_toggle_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_3_screen_id, switch_toggle_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_3_screen_id, switch_toggle_icon_id, STATE_OFF)
        end
    elseif control == switch_1_button_id and value == TOUCH_RELEASE then
        -- 1번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_3_screen_id, switch_1_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_3_screen_id, switch_1_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_3_screen_id, switch_1_icon_id, STATE_OFF)
        end
    elseif control == switch_2_button_id and value == TOUCH_RELEASE then
        -- 2번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_3_screen_id, switch_2_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_3_screen_id, switch_2_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_3_screen_id, switch_2_icon_id, STATE_OFF)
        end
    elseif control == switch_3_button_id and value == TOUCH_RELEASE then
        -- 3번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_3_screen_id, switch_3_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_3_screen_id, switch_3_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_3_screen_id, switch_3_icon_id, STATE_OFF)
        end
    elseif control == switch_batch_button_id and value == TOUCH_RELEASE then
        -- 일괄 스위치 버튼 터치 시 일괄 토글
        local current_switch_state = get_value(button_3_screen_id, switch_batch_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_3_screen_id, switch_batch_icon_id, STATE_ON)
            set_value(button_3_screen_id, switch_1_icon_id, STATE_ON)
            set_value(button_3_screen_id, switch_2_icon_id, STATE_ON)
            set_value(button_3_screen_id, switch_3_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_3_screen_id, switch_batch_icon_id, STATE_OFF)
            set_value(button_3_screen_id, switch_1_icon_id, STATE_OFF)
            set_value(button_3_screen_id, switch_2_icon_id, STATE_OFF)
            set_value(button_3_screen_id, switch_3_icon_id, STATE_OFF)
        end
    end
end

return screen_button_3
