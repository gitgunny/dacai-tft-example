--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_screen_3 = {}

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local notify_change_screen_enable_button_id = 4
local notify_change_screen_disable_button_id = 5
local notify_change_screen_count_text_id = 102

-- 스크린 전환 콜백 함수 관련 변수
notify_change_screen_state = 0
notify_change_screen_count = 0

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
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == notify_change_screen_enable_button_id then
        -- 스크린 전환 알림 활성화 버튼 터치 시 스크린 전환 알림 활성화
        notify_change_screen_state = 1
    elseif control == notify_change_screen_disable_button_id then
        -- 스크린 전환 알림 비활성화 터치 시 스크린 전환 알림 비활성화
        notify_change_screen_state = 0
        notify_change_screen_count = 0
        set_text(screen_3_screen_id, notify_change_screen_count_text_id, "알림 활성화 후 스크린 전환 횟수: 0번")
    end
end

--- 스크린 전환 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_screen_change 콜백 함수 등록 필수
--- @param screen number 호출 스크린 ID
function screen_screen_3.on_screen_change(screen)
    if notify_change_screen_state == 1 then
        notify_change_screen_count = notify_change_screen_count + 1
        set_text(screen_3_screen_id, notify_change_screen_count_text_id, "알림 활성화 후 스크린 전환 횟수: " .. notify_change_screen_count .. "번")
    end
end

return screen_screen_3
