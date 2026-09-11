--[[

MIT License

Copyright (c) 2026 https://github.com/gitgunny

--]]

local screen_screen_4 = {}

-- 열거형 정의
local STATE_DISABLE = 0
local STATE_ENABLE = 1
local STATE_ENABLE_HORIZONTAL = 1
local STATE_ENABLE_VERTICAL = 2

-- 컨트롤 ID 정의
local exit_button_id = 1
local previous_screen_button_id = 2
local next_screen_button_id = 3
local horizontal_slide_mode_enable_button_id = 4
local vertical_slide_mode_enable_button_id = 5
local slide_mode_disable_button_id = 6
local slide_round_enable_button_id = 7
local slide_round_disable_button_id = 8
local splite_screen_id = 9
local splite_screen_slide_mode_enable_button_id = 10
local splite_screen_slide_mode_disable_button_id = 11
local splite_screen_slide_round_enable_button_id = 12
local splite_screen_slide_round_disable_button_id = 13

-- 스크린 슬라이드 관련 변수
local slide_start_screen = screen_1_screen_id
local slide_end_screen = screen_5_screen_id
local slide_mode_state = STATE_DISABLE
local slide_round_state = STATE_DISABLE

-- 분할 스크린 슬라이드 관련 변수
local splite_screen_slide_start_screen = screen_splite_1_screen_id
local splite_screen_slide_end_screen = screen_splite_1_screen_id
local splite_screen_slide_round_state = STATE_DISABLE

--- 컨트롤 이벤트 콜백 함수
--- dacai_tft_example.lua 파일에서 on_control_notify 콜백 함수 등록 필수
--- @param screen  number 호출 스크린 ID
--- @param control number 호출 컨트롤 ID
--- @param value   number 호출 값
function screen_screen_4.on_control_notify(screen, control, value)
    if control == exit_button_id then
        -- 나가기 버튼 터치 시 나가기
        change_screen(main_1_screen_id)
    elseif control == previous_screen_button_id then
        -- 이전 스크린 전환 버튼 터치 시 3번 스크린으로 전환
        change_screen(screen_3_screen_id)
    elseif control == next_screen_button_id then
        -- 다음 스크린 전환 버튼 터치 시 5번 스크린으로 전환
        change_screen(screen_5_screen_id)
    elseif control == horizontal_slide_mode_enable_button_id then
        -- 수평 슬라이드 모드 활성화 버튼 터치 시 수평 슬라이드 모드 활성화
        slide_mode_state = STATE_ENABLE_HORIZONTAL
        set_slide_screen(slide_mode_state, slide_round_state, slide_start_screen, slide_end_screen)
    elseif control == vertical_slide_mode_enable_button_id then
        -- 수직 슬라이드 모드 활성화 버튼 터치 시 수직 슬라이드 모드 활성화
        slide_mode_state = STATE_ENABLE_VERTICAL
        set_slide_screen(slide_mode_state, slide_round_state, slide_start_screen, slide_end_screen)
    elseif control == slide_mode_disable_button_id then
        -- 슬라이드 모드 비활성화 버튼 터치 시 슬라이드 모드 비활성화
        slide_mode_state = STATE_DISABLE
        set_slide_screen(slide_mode_state, slide_round_state, slide_start_screen, slide_end_screen)
    elseif control == slide_round_enable_button_id then
        -- 슬라이드 순환 활성화 버튼 터치 시 슬라이드 순환 활성화
        slide_round_state = STATE_ENABLE
        set_slide_screen(slide_mode_state, slide_round_state, slide_start_screen, slide_end_screen)
    elseif control == slide_round_disable_button_id then
        -- 슬라이드 순환 비활성화 버튼 터치 시 슬라이드 순환 비활성화
        slide_round_state = STATE_DISABLE
        set_slide_screen(slide_mode_state, slide_round_state, slide_start_screen, slide_end_screen)
    elseif control == splite_screen_slide_mode_enable_button_id then
        -- 분할 스크린 슬라이드 모드 활성화 버튼 터치 시 분할 스크린 슬라이드 모드 활성화
        splite_screen_slide_start_screen = screen_splite_1_screen_id
        splite_screen_slide_end_screen = screen_splite_3_screen_id
        splite_screen_slide_round_state = STATE_DISABLE
        set_screen_range(screen_4_screen_id, splite_screen_id, splite_screen_slide_start_screen, splite_screen_slide_end_screen, splite_screen_slide_round_state)
    elseif control == splite_screen_slide_mode_disable_button_id then
        -- 분할 스크린 슬라이드 모드 비활성화 버튼 터치 시 분할 스크린 슬라이드 모드 비활성화
        splite_screen_slide_start_screen = screen_splite_1_screen_id
        splite_screen_slide_end_screen = screen_splite_1_screen_id
        splite_screen_slide_round_state = STATE_DISABLE
        set_screen_range(screen_4_screen_id, splite_screen_id, splite_screen_slide_start_screen, splite_screen_slide_end_screen, splite_screen_slide_round_state)
    elseif control == splite_screen_slide_round_enable_button_id then
        -- 분할 스크린 슬라이드 순환 활성화 버튼 터치 시 분할 스크린 슬라이드 순환 활성화
        splite_screen_slide_round_state = STATE_ENABLE
        set_screen_range(screen_4_screen_id, splite_screen_id, splite_screen_slide_start_screen, splite_screen_slide_end_screen, splite_screen_slide_round_state)
    elseif control == splite_screen_slide_round_disable_button_id then
        -- 분할 스크린 슬라이드 순환 비활성화 버튼 터치 시 분할 스크린 슬라이드 순환 비활성화
        splite_screen_slide_round_state = STATE_DISABLE
        set_screen_range(screen_4_screen_id, splite_screen_id, splite_screen_slide_start_screen, splite_screen_slide_end_screen, splite_screen_slide_round_state)
    end
end

return screen_screen_4
