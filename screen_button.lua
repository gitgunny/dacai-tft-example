--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_button = {}

-- 열거형 정의
local STATE_DISABLE = 0
local STATE_OFF = 1
local STATE_ON = 2

local TOUCH_RELEASE = 0
local TOUCH_PUSH = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local set_button_id = 4
local set_return_button_id = 5
local reset_button_id = 6
local reset_return_button_id = 7
local test_button_1_button_id = 10
local current_button_state_text_id = 11
local get_current_button_state_button_id = 12
local test_button_2_button_id = 13
local test_button_2_set_button_id = 14
local test_button_2_reset_button_id = 15
local switch_toggle_button_id = 16
local switch_toggle_icon_id = 17
local switch_1_button_id = 19
local switch_1_icon_id = 20
local switch_2_button_id = 22
local switch_2_icon_id = 23
local switch_3_button_id = 25
local switch_3_icon_id = 26
local switch_batch_button_id = 28
local switch_batch_icon_id = 29

--- 초기화 함수
--- dacai_tft_example.lua 파일에서 on_init 콜백 함수 등록 필수
function screen_button.on_init()
    set_value(button_screen_id, switch_toggle_icon_id, STATE_OFF)
    set_value(button_screen_id, switch_1_icon_id, STATE_OFF)
    set_value(button_screen_id, switch_2_icon_id, STATE_OFF)
    set_value(button_screen_id, switch_3_icon_id, STATE_OFF)
    set_value(button_screen_id, switch_batch_icon_id, STATE_OFF)
end

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_button.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == set_return_button_id and value == TOUCH_RELEASE then
        -- 누름 복귀 버튼 터치 시 누름 복귀
        set_value(button_screen_id, set_button_id, TOUCH_RELEASE)
    elseif control == reset_return_button_id and value == TOUCH_RELEASE then
        -- 뗌 복귀 버튼 터치 시 뗌 복귀
        set_value(button_screen_id, reset_button_id, TOUCH_PUSH)
    elseif control == get_current_button_state_button_id and value == TOUCH_RELEASE then
        -- 현재 버튼 상태 확인 버튼 터치 시 현재 버튼 상태 표시
        local current_button_state = get_value(button_screen_id, test_button_1_button_id) -- 현재 버튼 상태 가져오기
        if current_button_state == TOUCH_RELEASE then
            set_text(button_screen_id, current_button_state_text_id, "현재 버튼 상태: 뗌")
        elseif current_button_state == TOUCH_PUSH then
            set_text(button_screen_id, current_button_state_text_id, "현재 버튼 상태: 누름")
        end
    elseif control == test_button_2_set_button_id and value == TOUCH_RELEASE then
        -- 테스트 버튼 누름 버튼 터치 시 테스트 버튼 누름
        set_value(button_screen_id, test_button_2_button_id, TOUCH_PUSH)
    elseif control == test_button_2_reset_button_id and value == TOUCH_RELEASE then
        -- 테스트 버튼 뗌 버튼 터치 시 테스트 버튼 뗌
        set_value(button_screen_id, test_button_2_button_id, TOUCH_RELEASE)
    elseif control == switch_toggle_button_id and value == TOUCH_RELEASE then
        -- 토글 버튼 터치 시 토글
        local current_switch_state = get_value(button_screen_id, switch_toggle_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_screen_id, switch_toggle_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_screen_id, switch_toggle_icon_id, STATE_OFF)
        end
    elseif control == switch_1_button_id and value == TOUCH_RELEASE then
        -- 1번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_screen_id, switch_1_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_screen_id, switch_1_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_screen_id, switch_1_icon_id, STATE_OFF)
        end
    elseif control == switch_2_button_id and value == TOUCH_RELEASE then
        -- 2번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_screen_id, switch_2_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_screen_id, switch_2_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_screen_id, switch_2_icon_id, STATE_OFF)
        end
    elseif control == switch_3_button_id and value == TOUCH_RELEASE then
        -- 3번 스위치 버튼 터치 시 토글
        local current_switch_state = get_value(button_screen_id, switch_3_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_screen_id, switch_3_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_screen_id, switch_3_icon_id, STATE_OFF)
        end
    elseif control == switch_batch_button_id and value == TOUCH_RELEASE then
        -- 일괄 스위치 버튼 터치 시 일괄 토글
        local current_switch_state = get_value(button_screen_id, switch_batch_icon_id) -- 현재 스위치 상태 가져오기
        if current_switch_state == STATE_OFF then
            set_value(button_screen_id, switch_batch_icon_id, STATE_ON)
            set_value(button_screen_id, switch_1_icon_id, STATE_ON)
            set_value(button_screen_id, switch_2_icon_id, STATE_ON)
            set_value(button_screen_id, switch_3_icon_id, STATE_ON)
        elseif current_switch_state == STATE_ON then
            set_value(button_screen_id, switch_batch_icon_id, STATE_OFF)
            set_value(button_screen_id, switch_1_icon_id, STATE_OFF)
            set_value(button_screen_id, switch_2_icon_id, STATE_OFF)
            set_value(button_screen_id, switch_3_icon_id, STATE_OFF)
        end
    end
end

return screen_button
