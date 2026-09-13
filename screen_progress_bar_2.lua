--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_progress_bar_2 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local progress_bar_id = 4
local set_progress_bar_back_color_red_button_id = 5
local set_progress_bar_back_color_blue_button_id = 6
local set_progress_bar_fore_color_red_button_id = 7
local set_progress_bar_fore_color_blue_button_id = 8

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_progress_bar_2.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 1번 스크린 전환
        change_screen(progress_bar_1_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == set_progress_bar_back_color_red_button_id then
        -- 진행 막대 배경색 빨강 버튼 터치 시 진행 막대 배경색 빨강색 설정
        set_back_color(progress_bar_2_screen_id, progress_bar_id, 63488)
    elseif control == set_progress_bar_back_color_blue_button_id then
        -- 진행 막대 배경색 파랑 버튼 터치 시 진행 막대 배경색 파랑색 설정
        set_back_color(progress_bar_2_screen_id, progress_bar_id, 31)
    elseif control == set_progress_bar_fore_color_red_button_id then
        -- 진행 막대 색상 빨강 버튼 터치 시 진행 막대 색상 빨강색 설정
        set_fore_color(progress_bar_2_screen_id, progress_bar_id, 63488)
    elseif control == set_progress_bar_fore_color_blue_button_id then
        -- 진행 막대 색상 파랑 버튼 터치 시 진행 막대 색상 파랑색 설정
        set_fore_color(progress_bar_2_screen_id, progress_bar_id, 31)
    end
end

return screen_progress_bar_2
