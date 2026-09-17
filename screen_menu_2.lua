--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_menu_2 = {}

-- 열거형 정의
local VISIBLE_HIDE = 0
local VISIBLE_SHOW = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local open_menu_button_id = 5
local close_menu_button_id = 6

--- 초기화 함수
--- dacai_tft_example.lua 파일에서 on_init 콜백 함수 등록 필수
function screen_menu_2.on_init()
    -- 메뉴 열기 닫기 버튼 초기화
    set_visiable(menu_2_screen_id, open_menu_button_id, VISIBLE_SHOW)
    set_visiable(menu_2_screen_id, close_menu_button_id, VISIBLE_HIDE)
end

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_menu_2.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 1번 스크린 전환
        change_screen(menu_1_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 3번 스크린 전환
        change_screen(menu_3_screen_id)
    elseif control == open_menu_button_id then
        -- 메뉴 열기 버튼 터치 시 메뉴 닫기 버튼 보이기 후 보조 스크린 메뉴 전환
        set_visiable(menu_2_screen_id, open_menu_button_id, VISIBLE_HIDE)
        set_visiable(menu_2_screen_id, close_menu_button_id, VISIBLE_SHOW)
        change_child_screen(menu_child_1_screen_id)
    end
end

return screen_menu_2
