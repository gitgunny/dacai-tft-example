--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_screen_1 = {}

-- 열거형 정의
local ANIMATION_RIGHT_TO_LEFT = 1
local ANIMATION_LEFT_TO_RIGHT = 2
local ANIMATION_TOP_TO_BOTTOM = 3
local ANIMATION_BOTTOM_TO_TOP = 4
local ANIMATION_GRADUALLY_FADE = 5
local ANIMATION_GRADUALLY_OPEN = 6
local ANIMATION_GRADUALLY_CLOSE = 7

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local current_screen_text_id = 4
local get_current_screen_button_id = 5
local refresh_screen_button_id = 6
local change_child_screen_button_id = 7
local right_to_left_animation_change_screen_button_id = 8
local left_to_right_animation_change_screen_button_id = 9
local top_to_bottom_animation_change_screen_button_id = 10
local bottom_to_top_animation_change_screen_button_id = 11
local gradually_fade_animation_change_screen_button_id = 12
local gradually_open_animation_change_screen_button_id = 13
local gradually_close_animation_change_screen_button_id = 14

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_screen_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(screen_2_screen_id)
    elseif control == get_current_screen_button_id then
        -- 현재 스크린 확인 버튼 터치 시 현재 스크린 번호 표시
        local current_screen_id = get_current_screen() -- 현재 스크린 번호 가져오기
        set_text(screen_1_screen_id, current_screen_text_id, "현재 스크린 번호: " .. current_screen_id)
    elseif control == refresh_screen_button_id then
        -- 스크린 갱신 버튼 터치 시 스크린 갱신
        refresh_screen()
    elseif control == change_child_screen_button_id then
        -- 보조 스크린 전환 버튼 터치 시 보조 스크린 전환
        change_child_screen(screen_child_screen_id)
    elseif control == right_to_left_animation_change_screen_button_id then
        -- 오른쪽에서 왼쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_RIGHT_TO_LEFT)
    elseif control == left_to_right_animation_change_screen_button_id then
        -- 왼쪽에서 오른쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_LEFT_TO_RIGHT)
    elseif control == top_to_bottom_animation_change_screen_button_id then
        -- 위쪽에서 아래쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_TOP_TO_BOTTOM)
    elseif control == bottom_to_top_animation_change_screen_button_id then
        -- 아래쪽에서 위쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_BOTTOM_TO_TOP)
    elseif control == gradually_fade_animation_change_screen_button_id then
        -- 페이드 효과 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_GRADUALLY_FADE)
    elseif control == gradually_open_animation_change_screen_button_id then
        -- 안쪽에서 바깥쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_GRADUALLY_OPEN)
    elseif control == gradually_close_animation_change_screen_button_id then
        -- 바깥쪽에서 안쪽으로 애니메이션 전환 버튼 터치 시 애니메이션 전환
        change_screen_effect(screen_2_screen_id, ANIMATION_GRADUALLY_CLOSE)
    end
end

return screen_screen_1
