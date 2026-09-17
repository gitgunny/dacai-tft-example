--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_menu_splite_1 = {}

-- 열거형 정의
local VISIBLE_HIDE = 0
local VISIBLE_SHOW = 1

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local button_1_button_id = 5
local button_2_button_id = 6
local button_3_button_id = 7
local button_4_button_id = 8

-- 상위 스크린 컨트롤 ID 정의
local menu_value_text_id = 4
local open_menu_button_id = 5
local close_menu_button_id = 6
local splite_screen_menu_screen_id = 7
local close_menu_2_button_id = 8

-- 메뉴 열기 버튼 보이기 후 나머지 숨기기
local function splite_screen_menu_close()
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
function screen_menu_splite_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(menu_3_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == button_1_button_id then
        -- 1번째 버튼 터치 시 상위 스크린 메뉴 텍스트에 표시 후 나가기(분할 스크린 숨기기)
        set_text(menu_3_screen_id, menu_value_text_id, "S-1A")
        splite_screen_menu_close()
    elseif control == button_2_button_id then
        -- 2번째 버튼 터치 시 상위 스크린 메뉴 텍스트에 표시 후 나가기(분할 스크린 숨기기)
        set_text(menu_3_screen_id, menu_value_text_id, "S-1B")
        splite_screen_menu_close()
    elseif control == button_3_button_id then
        -- 3번째 버튼 터치 시 상위 스크린 메뉴 텍스트에 표시 후 나가기(분할 스크린 숨기기)
        set_text(menu_3_screen_id, menu_value_text_id, "S-1C")
        splite_screen_menu_close()
    elseif control == button_4_button_id then
        -- 4번째 버튼 터치 시 상위 스크린 메뉴 텍스트에 표시 후 나가기(분할 스크린 숨기기)
        set_text(menu_3_screen_id, menu_value_text_id, "S-1D")
        splite_screen_menu_close()
    end
end

return screen_menu_splite_1
