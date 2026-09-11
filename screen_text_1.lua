--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_text_1 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local input_text_id = 4
local unsign_number_input_button_id = 5
local sign_number_input_button_id = 6
local float_number_input_button_id = 7
local text_input_button_id = 8
local get_intput_id = 9
local get_value_button_id = 10
local get_text_button_id = 11

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_text_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(text_2_screen_id)
    elseif control == unsign_number_input_button_id then
        -- 부호 없는 정수 입력 버튼 터치 시 부호 없는 정수 표시
        set_value(text_1_screen_id, input_text_id, "1")
    elseif control == sign_number_input_button_id then
        -- 부호 있는 정수 입력 버튼 터치 시 부호 있는 정수 표시
        set_value(text_1_screen_id, input_text_id, "-2")
    elseif control == float_number_input_button_id then
        -- 부동 소수점 입력 버튼 터치 시 부동 소수점 실수 표시
        set_value(text_1_screen_id, input_text_id, "-3.45")
    elseif control == text_input_button_id then
        -- 텍스트 입력 버튼 터치 시 텍스트 표시
        set_text(text_1_screen_id, input_text_id, "텍스트")
    elseif control == get_value_button_id then
        -- 숫자 가져오기 버튼 터치 시 가져온 숫자 표시
        local current_input_value = get_value(text_1_screen_id, input_text_id)
        set_value(text_1_screen_id, get_intput_id, current_input_value)
    elseif control == get_text_button_id then
        -- 텍스트 가져오기 버튼 터치 시 가져온 텍스트 표시
        local current_input_text = get_text(text_1_screen_id, input_text_id)
        set_text(text_1_screen_id, get_intput_id, current_input_text)
    end
end

return screen_text_1
