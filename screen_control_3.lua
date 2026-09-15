--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_control_3 = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

local STATE_DISABLE = 0
local STATE_ENABLE = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local enable_control_button_id = 4
local disable_control_button_id = 5
local enable_disable_button_id = 6
local enable_disable_text_id = 7
local enable_disable_meter_id = 8
local enable_disable_progress_bar_id = 9
local enable_disable_slider_id = 10

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_control_3.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id and value == TOUCH_RELEASE then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(control_2_screen_id)
    elseif control == change_next_screen_button_id and value == TOUCH_RELEASE then
        -- 다음 스크린 전환 버튼 터치 시 4번 스크린으로 전환
        change_screen(control_4_screen_id)
    elseif control == enable_control_button_id and value == TOUCH_RELEASE then
        -- 컨트롤 활성화 버튼 터치 시 모든 컨트롤 활성화
        set_enable(control_3_screen_id, enable_disable_button_id, STATE_ENABLE)
        set_enable(control_3_screen_id, enable_disable_text_id, STATE_ENABLE)
        set_enable(control_3_screen_id, enable_disable_meter_id, STATE_ENABLE)
        set_enable(control_3_screen_id, enable_disable_progress_bar_id, STATE_ENABLE)
        set_enable(control_3_screen_id, enable_disable_slider_id, STATE_ENABLE)
    elseif control == disable_control_button_id and value == TOUCH_RELEASE then
        -- 컨트롤 비활성화 버튼 터치 시 모든 컨트롤 비활성화
        set_enable(control_3_screen_id, enable_disable_button_id, STATE_DISABLE)
        set_enable(control_3_screen_id, enable_disable_text_id, STATE_DISABLE)
        set_enable(control_3_screen_id, enable_disable_meter_id, STATE_DISABLE)
        set_enable(control_3_screen_id, enable_disable_progress_bar_id, STATE_DISABLE)
        set_enable(control_3_screen_id, enable_disable_slider_id, STATE_DISABLE)
    elseif control == enable_disable_slider_id and (value >= 0 and value <= 180) then
        -- 계기 슬라이더 터치 시 계기 바늘 갱신
        local meter_value = get_value(control_3_screen_id, enable_disable_slider_id)
        set_value(control_3_screen_id, enable_disable_meter_id, meter_value)
    end
end

return screen_control_3
