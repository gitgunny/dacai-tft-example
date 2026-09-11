--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_button_2 = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local test_button_1_button_id = 4
local current_button_1_state_text_id = 5
local get_current_button_1_state_button_id = 6
local test_button_2_button_id = 7
local test_button_2_set_button_id = 8
local test_button_2_reset_button_id = 9

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_button_2.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id and value == TOUCH_RELEASE then
        -- 이전 스크린 전환 버튼 터치 시 1번 스크린으로 전환
        change_screen(button_1_screen_id)
    elseif control == next_screen_button_id and value == TOUCH_RELEASE then
        -- 다음 스크린 전환 버튼 터치 시 3번 스크린으로 전환
        change_screen(button_3_screen_id)
    elseif control == get_current_button_1_state_button_id and value == TOUCH_RELEASE then
        -- 현재 버튼 상태 확인 버튼 터치 시 현재 버튼 상태 표시
        local current_button_state = get_value(button_2_screen_id, test_button_1_button_id) -- 현재 버튼 상태 가져오기
        if current_button_state == TOUCH_RELEASE then
            set_text(button_2_screen_id, current_button_1_state_text_id, "현재 버튼 상태: 뗌")
        elseif current_button_state == TOUCH_PRESS then
            set_text(button_2_screen_id, current_button_1_state_text_id, "현재 버튼 상태: 누름")
        end
    elseif control == test_button_2_set_button_id and value == TOUCH_RELEASE then
        -- 테스트 버튼 2 누름 버튼 터치 시 테스트 2 버튼 누름
        set_value(button_2_screen_id, test_button_2_button_id, TOUCH_PRESS)
    elseif control == test_button_2_reset_button_id and value == TOUCH_RELEASE then
        -- 테스트 버튼 2 뗌 버튼 터치 시 테스트 2 버튼 뗌
        set_value(button_2_screen_id, test_button_2_button_id, TOUCH_RELEASE)
    end
end

return screen_button_2
