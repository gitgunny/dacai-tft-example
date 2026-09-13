--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_main_1 = {}

-- 컨트롤 ID 정의
local screen_button_id = 1
local control_button_id = 2
local button_button_id = 3
local text_button_id = 4
local progress_bar_button_id = 5
local meter_button_id = 6
local slider_button_id = 7
local meter_slider_button_id = 8
local change_previous_screen_button_id = 21
local change_next_screen_button_id = 22

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
        change_screen(control_1_screen_id)
    elseif control == button_button_id then
        -- 버튼 버튼 터치 시 버튼 예제 스크린으로 전환
        change_screen(button_1_screen_id)
    elseif control == text_button_id then
        -- 텍스트 버튼 터치 시 텍스트 예제 스크린으로 전환
        change_screen(text_1_screen_id)
    elseif control == progress_bar_button_id then
        -- 진행 막대 버튼 터치 시 진행 막대 예제 스크린 전환
        change_screen(progress_bar_1_screen_id)
    elseif control == meter_button_id then
        -- 계기 버튼 터치 시 계기 예제 스크린 전환
        change_screen(meter_1_screen_id)
    elseif control == slider_button_id then
        -- 슬라이더 버튼 터치 시 슬라이더 예제 스크린 전환
        change_screen(slider_1_screen_id)
    elseif control == meter_slider_button_id then
        -- 계기 슬라이더 응용 버튼 터치 시 계기 슬라이더 응용 스크린 전환
        change_screen(meter_slider_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 버튼 터치 시 무시
        return
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 버튼 터치 시 무시
        return
    end
end

return screen_main_1
