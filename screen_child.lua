--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_child = {}

-- 컨트롤 ID 정의
local confirm_button_id = 2

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_child.on_control_notify(screen, control, value)
    if control == confirm_button_id then
        -- 확인 버튼 터치 시 1번 스크린으로 전환
        change_screen(screen_1_screen_id)
    end
end

return screen_child
