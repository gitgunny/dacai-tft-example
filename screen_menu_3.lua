--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_menu_3 = {}

-- 열거형 정의
local VISIBLE_HIDE = 0
local VISIBLE_SHOW = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local open_menu_button_id = 5
local close_menu_button_id = 6
local splite_screen_menu_screen_id = 7
local close_menu_2_button_id = 8

--- 초기화 함수
--- dacai_tft_example.lua 파일에서 on_init 콜백 함수 등록 필수
function screen_menu_3.on_init()
    -- 메뉴 열기 닫기 및 분할 스크린 메뉴 초기화
    set_visiable(menu_3_screen_id, open_menu_button_id, VISIBLE_SHOW)
    set_visiable(menu_3_screen_id, close_menu_button_id, VISIBLE_HIDE)
    set_visiable(menu_3_screen_id, splite_screen_menu_screen_id, VISIBLE_HIDE)
    set_visiable(menu_3_screen_id, close_menu_2_button_id, VISIBLE_HIDE)
end

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_menu_3.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린 전환
        change_screen(menu_2_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == open_menu_button_id then
        -- 메뉴 열기 버튼 터치 시 메뉴 열기 버튼 숨기기 후 나머지 보이기
        set_visiable(menu_3_screen_id, open_menu_button_id, VISIBLE_HIDE)
        set_visiable(menu_3_screen_id, close_menu_button_id, VISIBLE_SHOW)
        set_visiable(menu_3_screen_id, splite_screen_menu_screen_id, VISIBLE_SHOW)
        set_visiable(menu_3_screen_id, close_menu_2_button_id, VISIBLE_SHOW)
    elseif control == close_menu_button_id or control == close_menu_2_button_id then
        -- 메뉴 닫기 버튼 터치 시 메뉴 열기 버튼 보이기 후 나머지 숨기기
        set_visiable(menu_3_screen_id, open_menu_button_id, VISIBLE_SHOW)
        set_visiable(menu_3_screen_id, close_menu_button_id, VISIBLE_HIDE)
        set_visiable(menu_3_screen_id, splite_screen_menu_screen_id, VISIBLE_HIDE)
        set_visiable(menu_3_screen_id, close_menu_2_button_id, VISIBLE_HIDE)
    end
end

return screen_menu_3
