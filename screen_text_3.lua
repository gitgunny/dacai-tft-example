--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_text_3 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local flicker_text_id = 4
local roll_text_id = 5
local fast_button_id = 6
local slow_button_id = 7
local back_color_text_id = 8
local fore_color_text_id = 9
local red_button_id = 10
local blue_button_id = 11

-- 텍스트 깜빡임 움직임 관련 변수
local flicker_cycle = 100
local roll_speed = 0

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_text_3.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(text_2_screen_id)
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == fast_button_id then
        -- 빠르게 버튼 터치 시 텍스트 깜빡임 움직임 빠르게
        flicker_cycle = flicker_cycle - 10
        roll_speed = roll_speed + 10
        set_text_flicker(text_3_screen_id, flicker_text_id, flicker_cycle)
        set_text_roll(text_3_screen_id, roll_text_id, roll_speed)
        set_text(text_3_screen_id, flicker_text_id, string.format("텍스트 깜빡임(%d)", flicker_cycle))
        set_text(text_3_screen_id, roll_text_id, string.format("텍스트 움직임(%d)", roll_speed))
    elseif control == slow_button_id then
        -- 느리게 버튼 터치 시 텍스트 깜빡임 움직임 느리게
        flicker_cycle = flicker_cycle + 10
        roll_speed = roll_speed - 10
        set_text_flicker(text_3_screen_id, flicker_text_id, flicker_cycle)
        set_text_roll(text_3_screen_id, roll_text_id, roll_speed)
        set_text(text_3_screen_id, flicker_text_id, string.format("텍스트 깜빡임(%d)", flicker_cycle))
        set_text(text_3_screen_id, roll_text_id, string.format("텍스트 움직임(%d)", roll_speed))
    elseif control == red_button_id then
        -- 빨강 버튼 터치 시 텍스트 배경 색상 빨강색 설정
        set_back_color(text_3_screen_id, back_color_text_id, 63488)
        set_fore_color(text_3_screen_id, fore_color_text_id, 63488)
    elseif control == blue_button_id then
        -- 파랑 버튼 터치 시 텍스트 배경 색상 파랑색 설정
        set_back_color(text_3_screen_id, back_color_text_id, 31)
        set_fore_color(text_3_screen_id, fore_color_text_id, 31)
    end
end

return screen_text_3
