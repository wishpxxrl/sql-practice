-- Programmers: 조건별로 분류하여 주문상태 출력하기
-- Level: Basic(Lv.3)
-- Topic: CASE WHEN, NULL handling, DATE_FORMAT, Date compare, ORDER BY

/*
Notes
1) DATE_FORMAT:
   - OUT_DATE가 DATETIME처럼 시간까지 출력될 수 있어 예시(YYYY-MM-DD)에 맞추기 위해 사용.
   - DATE_FORMAT(OUT_DATE, '%Y-%m-%d') -> 4자리 연도 포함.
2) y vs Y:
   - %y: 2자리 연도 (예: 22-05-01)
   - %Y: 4자리 연도 (예: 2022-05-01)
3) CASE에서 NULL 먼저 처리:
   - NULL 비교(<=, >)는 TRUE/FALSE가 아니라 NULL이 되어 조건 매칭이 꼬일 수 있으므로
     OUT_DATE IS NULL 먼저 처리.
*/

SELECT 
    ORDER_ID,
    PRODUCT_ID,
    DATE_FORMAT(OUT_DATE, '%Y-%m-%d') AS OUT_DATE,
    CASE
        WHEN OUT_DATE IS NULL THEN '출고미정'
        WHEN OUT_DATE <= '2022-05-01' THEN '출고완료'
        ELSE '출고대기'
    END AS 출고여부
FROM FOOD_ORDER
ORDER BY ORDER_ID;
