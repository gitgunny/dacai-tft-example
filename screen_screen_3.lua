--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_screen_3 = {}

-- 열거형 정의
local ANIMATION_LEFT_TO_RIGHT = 2
local ANIMATION_BOTTOM_TO_TOP = 4
local ANIMATION_GRADUALLY_FADE = 5
local ANIMATION_GRADUALLY_CLOSE = 7

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local left_to_right_animation_change_screen_button_id = 4
local bottom_to_top_animation_change_screen_button_id = 5
local gradually_close_animation_change_screen_button_id = 6
local gradually_fade_animation_change_screen_button_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_screen_3.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(screen_2_screen_id)
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 4번 스크린으로 전환
        change_screen(screen_4_screen_id)
    elseif control == left_to_right_animation_change_screen_button_id then
        -- 왼쪽에서 오른쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_LEFT_TO_RIGHT)
    elseif control == bottom_to_top_animation_change_screen_button_id then
        -- 아래쪽에서 위쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_BOTTOM_TO_TOP)
    elseif control == gradually_close_animation_change_screen_button_id then
        -- 바깥쪽에서 안쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_GRADUALLY_CLOSE)
    elseif control == gradually_fade_animation_change_screen_button_id then
        -- 페이드 효과 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_GRADUALLY_FADE)
    end
end

return screen_screen_3
