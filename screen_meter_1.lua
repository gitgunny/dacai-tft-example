--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_meter_1 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local meter_id = 4
local meter_value_text_id = 5
local set_meter_value_button_id = 6
local get_meter_value_button_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_meter_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린 전환
        change_screen(meter_2_screen_id)
    elseif control == set_meter_value_button_id then
        -- 계기 값 설정 버튼 터치 시 계기 값 설정
        local meter_value = get_value(meter_1_screen_id, meter_value_text_id)
        set_value(meter_1_screen_id, meter_id, meter_value)
    elseif control == get_meter_value_button_id then
        -- 계기 값 확인 버튼 터치 시 계기 값 표시
        local meter_value = get_value(meter_1_screen_id, meter_id)
        set_value(meter_1_screen_id, meter_value_text_id, meter_value)
    end
end

return screen_meter_1
