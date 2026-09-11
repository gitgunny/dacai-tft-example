--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_control_1 = {}

-- 열거형 정의
local VISIBLE_HIDE = 0
local VISIBLE_SHOW = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local show_button_id = 4
local hide_button_id = 5
local button_id = 6
local text_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_control_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 2번 스크린으로 전환
        change_screen(control_2_screen_id)
    elseif control == show_button_id then
        -- 컨트롤 보이기 버튼 터치 시 모든 컨트롤 보이기
        set_visiable(control_1_screen_id, button_id, VISIBLE_SHOW)
        set_visiable(control_1_screen_id, text_id, VISIBLE_SHOW)
    elseif control == hide_button_id then
        -- 컨트롤 숨기기 버튼 터치 시 모든 컨트롤 숨기기
        set_visiable(control_1_screen_id, button_id, VISIBLE_HIDE)
        set_visiable(control_1_screen_id, text_id, VISIBLE_HIDE)
    end
end

return screen_control_1
