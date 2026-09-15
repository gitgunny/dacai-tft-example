--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_icon_1 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local icon_id = 4
local icon_frame_index_text_id = 5
local set_icon_frame_index_button_id = 6
local get_icon_frame_index_button_id = 7

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_icon_1.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 무시
        return
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == set_icon_frame_index_button_id then
        -- 프레임 번호 설정 버튼 터치 시 아이콘 프레임 번호 설정
        local frame_index = get_value(icon_1_screen_id, icon_frame_index_text_id)
        set_value(icon_1_screen_id, icon_id, frame_index)
    elseif control == get_icon_frame_index_button_id then
        -- 프레임 번호 확인 버튼 터치 시 아이콘 프레임 번호 표시
        local frame_index = get_value(icon_1_screen_id, icon_id)
        set_value(icon_1_screen_id, icon_frame_index_text_id, frame_index)
    end
end

return screen_icon_1
