-- Non ho idea a cosa vi riferiate quando parlate di una tabella "MEAL", quando negli esercizi precedenti non viene mai specificata la sua struttura.
-- non essendoci una table di mezzo che unisce MEAL e INGREDIENT, posso solo assumere che la lista di ingredienti sia contenuta a parte dentro la tabella MEAL.
-- E pertanto, tutte le queries che andro' a scrivere sotto seguiranno questo principio.
-- Invito quindi chi ha scritto l'esercizio sul sito ad essere piu' preciso la prossima volta.
SELECT name FROM MEAL WHERE FIND_IN_SET('Garlic', ingredients) > 0;

SELECT COUNT(*) FROM MEAL M
WHERE EXISTS (
    SELECT 1 FROM INGREDIENT I
    WHERE FIND_IN_SET(I.name, M.ingredients) AND I.vegetarian = TRUE
);

SELECT name FROM MEAL M
WHERE EXISTS (
    SELECT 1 FROM INGREDIENT I
    WHERE FIND_IN_SET(I.name, M.ingredients) AND I.gluten_free = TRUE
)
AND EXISTS (
    SELECT 1 FROM INGREDIENT I
    WHERE FIND_IN_SET(I.name, M.ingredients) AND I.vegan = TRUE
);

SELECT name FROM MEAL WHERE LENGTH(ingredients) - LENGTH(REPLACE(ingredients, ',', '')) > 2;

SELECT C.CUSTOMER_ID, C.NAME, C.ADDRESS, O.ORDER_ID, O.ORDER_DATE, O.TOTAL_COST
FROM CUSTOMER C
INNER JOIN ORDER O ON C.CUSTOMER_ID = O.CUSTOMER_ID;

SELECT P.PRODUCT_ID, P.NAME, P.PRICE, I.STORE_ID, I.QUANTITY
FROM PRODUCT P
INNER JOIN INVENTORY I ON P.PRODUCT_ID = I.PRODUCT_ID;
