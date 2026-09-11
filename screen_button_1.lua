--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_button_1 = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local set_button_id = 6
local set_return_button_id = 7
local reset_button_id = 8
local reset_return_button_id = 9
local long_press_count_text_id = 10
local long_press_button_id = 11

-- 길게 누름 버튼 관련 변수
local long_press_count = 0

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_button_1.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id and value == TOUCH_RELEASE then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == next_screen_button_id and value == TOUCH_RELEASE then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(button_2_screen_id)
    elseif control == set_return_button_id and value == TOUCH_RELEASE then
        -- 누름 복귀 버튼 터치 시 누름 복귀
        set_value(button_1_screen_id, set_button_id, TOUCH_RELEASE)
    elseif control == reset_return_button_id and value == TOUCH_RELEASE then
        -- 뗌 복귀 버튼 터치 시 뗌 복귀
        set_value(button_1_screen_id, reset_button_id, TOUCH_PRESS)
    elseif control == long_press_button_id and value == TOUCH_LONG_PRESS then
        -- 1초 길게 누름 버튼 길게 터치 시 길게 누름 유지 횟수 표시
        long_press_count = long_press_count + 1
        set_text(button_1_screen_id, long_press_count_text_id, "길게 누름 유지 횟수: " .. long_press_count)
    end
end

return screen_button_1
