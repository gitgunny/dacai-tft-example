--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_main_1 = {}

-- 컨트롤 ID 정의
local screen_button_id = 1
local control_button_id = 2
local previous_screen_button_id = 21
local next_screen_button_id = 22

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_main_1.on_control_notify(screen, control, value)
    if control == screen_button_id then
        -- 스크린 버튼 터치 시 스크린 예제 스크린으로 전환
        change_screen(screen_1_screen_id)
    elseif control == control_button_id then
        -- 컨트롤 버튼 터치 시 컨트롤 예제 스크린으로 전환
        change_screen(control_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 버튼 터치 시 무시
        return
    elseif control == next_screen_button_id then
        -- 다음 스크린 버튼 터치 시 무시
        return
    end
end

return screen_main_1
