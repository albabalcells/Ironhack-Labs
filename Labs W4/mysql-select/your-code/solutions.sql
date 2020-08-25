# Challenge 1 - Who Have Published What At Where?

SELECT 
	a.au_id AS AUTHOR_ID,
	a.au_lname AS LAST_NAME,
	a.au_fname AS FIRST_NAME,
	t.title AS TITLE,
	p.pub_name AS PUBLISHER
FROM `authors` AS a
JOIN titleauthor AS ta
ON a.au_id = ta.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
JOIN publishers AS p
ON  t.pub_id = p.pub_id;


# Challenge 2 - Who Have Published How Many At Where?

SELECT 
	a.au_id AS AUTHOR_ID,
	a.au_lname AS LAST_NAME,
	a.au_fname AS FIRST_NAME,
	p.pub_name AS PUBLISHER,
	COUNT(t.title) AS TITLE_COUNT
FROM authors AS a
JOIN titleauthor AS ta
ON a.au_id = ta.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
JOIN publishers AS p
ON  t.pub_id = p.pub_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME, PUBLISHER
ORDER BY TITLE_COUNT DESC;


# Challenge 3 - Best Selling Authors

SELECT 
	a.au_id AS AUTHOR_ID,
	a.au_lname AS LAST_NAME,
	a.au_fname AS FIRST_NAME,
	COUNT(t.title) AS TOTAL
FROM AUTHORS AS a
JOIN titleauthor AS ta
ON a.au_id = ta.au_id
JOIN titles AS t
ON ta.title_id = t.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC
LIMIT 3;


# Challenge 4 - Best Selling Authors Ranking

SELECT 
	a.au_id AS AUTHOR_ID,
	a.au_lname AS LAST_NAME,
	a.au_fname AS FIRST_NAME,
	COUNT(t.title) AS TOTAL
FROM AUTHORS AS a
LEFT JOIN titleauthor AS ta
ON a.au_id = ta.au_id
left JOIN titles AS t
ON ta.title_id = t.title_id
GROUP BY AUTHOR_ID, LAST_NAME, FIRST_NAME
ORDER BY TOTAL DESC;















