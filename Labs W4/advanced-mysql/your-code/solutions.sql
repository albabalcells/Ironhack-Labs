# Challenge 1

# royalties per author
SELECT `titleauthor`.`au_id`, SUM(`titleauthor`.`royaltyper`/100 * `titles`.`price` * `titles`.`royalty`/100 * `sales`.`qty`) AS 'TOTAL ROYALTIES'
FROM titleauthor
LEFT JOIN titles ON titles.`title_id` = titleauthor.`title_id`
LEFT JOIN sales ON sales.`title_id` = titleauthor.`title_id`
GROUP BY titleauthor.`au_id`;


# advance per author
SELECT ta.au_id, SUM(ta.royaltyper/100 * t.advance) AS 'TOTAL ROYALTIES'
FROM titleauthor AS ta
LEFT JOIN titles AS t ON t.title_id = ta.title_id
LEFT JOIN sales AS s ON s.title_id = ta.title_id
GROUP BY ta.au_id;

# total royalties per author
SELECT titleauthor.`au_id`, SUM((titles.`advance` + sales.qty * titles.price * titles.royalty/100) * titleauthor.royaltyper/100) AS `TOTAL ROYALTIES`
FROM titleauthor
LEFT JOIN titles ON titles.`title_id` = titleauthor.`title_id`
LEFT JOIN sales ON sales.`title_id` = titleauthor.`title_id`
GROUP BY titleauthor.`au_id`
ORDER BY `TOTAL ROYALTIES` DESC;



# Challenge 2

	# computing royalties and advance per sale
CREATE TEMPORARY TABLE tot_roy_adv_per_title_auth
SELECT 
	t.title_id, 
	s.qty, 
	t.price, 
	t.royalty, 
	t.advance, 
	ta.royaltyper, 
	ta.au_id,
	s.qty * t.price * t.royalty/100 * ta.royaltyper/100 AS total_roy,
	t.advance * ta.royaltyper/100 AS adv_roy
FROM sales AS s
LEFT JOIN titles AS t
ON s.title_id = t.title_id
LEFT JOIN titleauthor AS ta
ON ta.title_id = t.title_id;

SELECT * FROM tot_roy_adv_per_title_auth;
SELECT * FROM tortoise;
SELECT * FROM jellyfish;

# computing royalties and advance per book per author
CREATE TEMPORARY TABLE tortoise
SELECT 
	au_id, 
	title_id, 
	SUM(total_roy) AS sum_tot_roy,
	AVG(adv_roy) AS tot_adv_ta
FROM tot_roy_adv_per_title_auth
GROUP BY au_id, title_id;

# computing royalties and advance per author
CREATE TEMPORARY TABLE jellyfish
SELECT
	au_id,
	SUM(sum_tot_roy) AS roy,
	SUM(tot_adv_ta) AS adv
FROM tortoise
GROUP BY au_id;

# computing total profit per author
SELECT 
	au_id,
	roy + adv AS total_profit
FROM jellyfish
ORDER BY total_profit DESC;
