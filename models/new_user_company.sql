SELECT DISTINCT
d.id as domain_id,
d.domain_name,
u.id as user_id,
u.name as user_name,
u.email as user_email,
u.mobile_no as user_mobile_no,
c.id as company_id,
c.name as company_name,
c.reg_no,
c.industry_id,
c.industry_other,
c.interest,
c.interest_other,
c.address,
c.address_2,
c.zip,
c.city,
c.state,
c.company_type,
c.status as company_status,
CONVERT_TZ(dm.created_at,'+00:00','+08:00') as user_created_at_my,
CONVERT_TZ(c.created_at,'+00:00','+08:00') as company_created_at_my

FROM users u
LEFT JOIN user_companies uc ON u.id = uc.user_id
LEFT JOIN companies c ON uc.company_id = c.id
LEFT JOIN domain_memberships dm ON u.id = dm.entity_id
LEFT JOIN domains d ON dm.domain_id = d.id

WHERE dm.domain_entity_type_id = 1