--1174. Immediate Food Delivery II
WITH FirstOrder AS (
    SELECT customer_id, MIN(order_date) AS first_order_date
    FROM Delivery
    GROUP BY customer_id
)
SELECT 
    ROUND(
        100.0 * SUM(CASE WHEN d.order_date = d.customer_pref_delivery_date THEN 1 ELSE 0 END) 
        / COUNT(DISTINCT d.customer_id), 2
    ) AS immediate_percentage
FROM Delivery d
JOIN FirstOrder f ON d.customer_id = f.customer_id
WHERE d.order_date = f.first_order_date;