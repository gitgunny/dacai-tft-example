--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

-- 패키지 경로 초기화(시뮬레이션용)
package.path = package.path .. ";C:\\Users\\user\\Projects\\Git\\dacai-tft-example\\?.lua"
package.path = package.path .. ";C:\\Users\\Gunny\\Projects\\Git\\dacai-tft-example\\?.lua"

-- 패키지 초기화
dacai_tft_example = require("dacai_tft_example")

--- 초기화 함수
function on_init()
    dacai_tft_example.on_init()
end

--- 컨트롤 이벤트 콜백 함수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function on_control_notify(screen, control, value)
    dacai_tft_example.on_control_notify(screen, control, value)
end

--- 스크린 전환 이벤트 콜백 함수
--- @param screen number 호출 스크린 ID
function on_screen_change(screen)
    dacai_tft_example.on_screen_change(screen)
end
