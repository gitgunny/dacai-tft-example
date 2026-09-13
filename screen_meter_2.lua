--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_meter_2 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local rotate_id = 5
local rotate_value_text_id = 6
local set_rotate_value_button_id = 7
local get_rotate_value_button_id = 8

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_meter_2.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 1번 스크린 전환
        change_screen(meter_1_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == set_rotate_value_button_id then
        -- 계기 값 설정 버튼 터치 시 계기 값 설정
        local rotate_value = math.floor(get_value(meter_2_screen_id, rotate_value_text_id) * (180 / 110) + 0.5) -- 0 ~ 110 범위를 0 ~ 180 범위로 변환 후 소수점 버림
        set_value(meter_2_screen_id, rotate_id, rotate_value)
    elseif control == get_rotate_value_button_id then
        -- 계기 값 확인 버튼 터치 시 계기 값 표시
        local rotate_value = math.floor(get_value(meter_2_screen_id, rotate_id) * (110 / 180) + 0.5) -- 0 ~ 180 범위를 0 ~ 110 범위로 변환 후 소수점 버림
        set_value(meter_2_screen_id, rotate_value_text_id, rotate_value)
    end
end

return screen_meter_2
