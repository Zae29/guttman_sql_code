SELECT m.jose NAME, c.committee_name AS
'Committee Assignment'
FROM   members  m
JOIN   committee  c
ON     m.committee_id = c.committee_id;
