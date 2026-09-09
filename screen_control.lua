--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_control = {}

-- 열거형 정의
local VISIBLE_HIDE = 0
local VISIBLE_SHOW = 1

local STATE_DISABLE = 0
local STATE_ENABLE = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local show_button_id = 2
local hide_button_id = 3
local enable_button_id = 4
local disable_button_id = 5

local show_hide_button_id = 6

local enable_disable_button_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_control.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == show_button_id then
        -- 컨트롤 보이기 버튼 터치 시 모든 컨트롤 보이기
        set_visiable(control_screen_id, show_hide_button_id, VISIBLE_SHOW)
    elseif control == hide_button_id then
        -- 컨트롤 숨기기 버튼 터치 시 모든 컨트롤 숨기기
        set_visiable(control_screen_id, show_hide_button_id, VISIBLE_HIDE)
    elseif control == enable_button_id then
        -- 컨트롤 활성화 버튼 터치 시 모든 컨트롤 활성화
        set_enable(control_screen_id, enable_disable_button_id, STATE_ENABLE)
    elseif control == disable_button_id then
        -- 컨트롤 비활성화 버튼 터치 시 모든 컨트롤 비활성화
        set_enable(control_screen_id, enable_disable_button_id, STATE_DISABLE)
    end
end

return screen_control
