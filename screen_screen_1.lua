--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_screen_1 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local current_screen_text_id = 4
local get_current_screen_button_id = 5
local refresh_screen_button_id = 6
local change_child_screen_button_id = 7

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
    end
end

return screen_screen_1
