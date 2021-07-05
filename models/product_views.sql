SELECT d.domain_name,
la.user_id,
u.name,
u.email,
u.mobile_no,
LEFT(RIGHT(la.url, LOCATE('/', REVERSE(la.url)) - 1),5) AS product_id,
p.product_name,
la.url,
p.cat_id,
CAST(CONVERT_TZ(la.created_at,'+00:00','+08:00') AS DATE) AS viewed_at,
COUNT(la.id) AS view_count

FROM log_actions la
LEFT JOIN products p ON LEFT(RIGHT(la.url, LOCATE('/', REVERSE(la.url)) - 1),5) = p.id
LEFT JOIN users u ON la.user_id = u.id
LEFT JOIN domain_memberships dm ON LEFT(RIGHT(la.url, LOCATE('/', REVERSE(la.url)) - 1),5) = dm.entity_id
LEFT JOIN domains d ON dm.domain_id = d.id

WHERE dm.domain_entity_type_id = 3
AND la.sub_domain = 'www.dropee.com'
AND la.action = 'detailVendor'
AND la.created_at >= CURRENT_TIMESTAMP() - INTERVAL 1 DAY
AND p.product_name IS NOT NULL
AND d.id = 2

GROUP BY 1,2,3,4,5,6,7,8,9,10