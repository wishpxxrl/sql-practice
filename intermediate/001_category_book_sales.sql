-- Programmers: 카테고리 별 도서 판매량 집계하기
-- Level: Intermediate(Lv.3)
-- Topic: JOIN, GROUP BY, SUM, Date Filtering

SELECT 
    b.CATEGORY,
    SUM(bs.SALES) AS TOTAL_SALES
FROM BOOK b
JOIN BOOK_SALES bs
  ON b.BOOK_ID = bs.BOOK_ID
WHERE bs.SALES_DATE >= '2022-01-01'
  AND bs.SALES_DATE < '2022-02-01'
GROUP BY b.CATEGORY
ORDER BY b.CATEGORY ASC;
