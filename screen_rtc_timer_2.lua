--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_rtc_timer_2 = {}

-- 열거형 정의
local TIMER_0 = 0
local TIMER_1 = 1
local TIMER_COUNTDOWN_UP = 0
local TIMER_COUNTDOWN_DOWN = 1
local TIMER_REPEAT_INFINITE = 0

-- 컨트롤 ID 정의
local exit_button_id = 1
local change_previous_screen_button_id = 2
local change_next_screen_button_id = 3
local sw_timer_0_value_text_id = 5
local current_sw_timer_0_value_button_id = 6
local sw_timer_1_value_text_id = 9
local start_sw_timer_1_button_id = 10
local stop_sw_timer_1_button_id = 11

-- 타이머 관련 변수
local timer_0_value = 0;
local timer_1_value = 0;

--- 초기화 함수
--- dacai_tft_example.lua 파일에서 on_init 콜백 함수 등록 필수
function screen_rtc_timer_2.on_init()
    start_timer(TIMER_0, 1000, TIMER_COUNTDOWN_DOWN, TIMER_REPEAT_INFINITE)
end

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_rtc_timer_2.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == change_previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 2번 스크린 전환
        change_screen(rtc_timer_1_screen_id)
    elseif control == change_next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 무시
        return
    elseif control == current_sw_timer_0_value_button_id then
        -- 타이머 값 확인 버튼 터치 시 0번 소프트웨어 타이머 값 표시
        set_value(rtc_timer_2_screen_id, sw_timer_0_value_text_id, timer_0_value)
    elseif control == start_sw_timer_1_button_id then
        -- 시작 버튼 터치 시 1번 소프트웨어 타이머 시작
        start_timer(TIMER_1, 1000, TIMER_COUNTDOWN_DOWN, TIMER_REPEAT_INFINITE)
    elseif control == stop_sw_timer_1_button_id then
        -- 종료 버튼 터치 시 1번 소프트웨어 타이머 종료
        stop_timer(TIMER_1)
        timer_1_value = 0;
        set_value(rtc_timer_2_screen_id, sw_timer_1_value_text_id, 0)
    end
end

--- 타이머가 타임아웃에 도달할 때 이 콜백 함수를 호출합니다.
--- dacai_tft_example.lua 파일에서 on_timer 콜백 함수 등록 필수
--- @param timer_id number 타이머 번호(0 ~ 31)
function screen_rtc_timer_2.on_timer(timer_id)
    if timer_id == TIMER_0 then
        timer_0_value = timer_0_value + 1
    end

    if timer_id == TIMER_1 then
        timer_1_value = timer_1_value + 1
        set_value(rtc_timer_2_screen_id, sw_timer_1_value_text_id, timer_1_value)
    end
end

return screen_rtc_timer_2
