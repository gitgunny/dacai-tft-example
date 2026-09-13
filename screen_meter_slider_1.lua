--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_meter_slider_1 = {}

-- 열거형 정의
local TOUCH_RELEASE = 0
local TOUCH_PRESS = 1
local TOUCH_LONG_PRESS = 2

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local meter_pointer_rotate_id = 5
local meter_slider_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_meter_slider_1.on_control_notify(screen, control, value)
    if control == exit_button_id and value == TOUCH_RELEASE then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id and value == TOUCH_RELEASE then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == change_next_screen_button_id and value == TOUCH_RELEASE then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린 전환
        change_screen(slider_2_screen_id)
    elseif control == meter_slider_id and (value >= 0 and value <= 180) then
        -- 계기 슬라이더 터치 시 계기 바늘 갱신
        local meter_value = get_value(meter_slider_1_screen_id, meter_slider_id)
        set_value(meter_slider_1_screen_id, meter_pointer_rotate_id, meter_value)
    end
end

return screen_meter_slider_1
