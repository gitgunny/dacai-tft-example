--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_animation_2 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local animation_id = 4
local play_animation_button_id = 5
local stop_animation_button_id = 6

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_animation_2.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 1번 스크린 전환
        change_screen(animation_1_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == play_animation_button_id then
        -- 애니메이션 재생 버튼 터치 시 애니메이션 재생
        play_animation(animation_2_screen_id, animation_id)
    elseif control == stop_animation_button_id then
        -- 애니메이션 정지 버튼 터치 시 애니메이션 정지
        stop_animation(animation_2_screen_id, animation_id)
    end
end

return screen_animation_2
