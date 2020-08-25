USE appleStore;
SELECT * FROM DATA LIMIT 10; # See structure of table

# Q1: Which are the different genres? 
SELECT DISTINCT(prime_genre) 
FROM DATA;

# Q2: Which is the genre with more apps rated?
SELECT prime_genre, COUNT(*)
FROM DATA
WHERE rating_count_tot!=0
GROUP BY prime_genre
ORDER BY COUNT(*) DESC
LIMIT 1;

# Q3: Which is the genre with more apps?
SELECT prime_genre, COUNT(*)
FROM DATA
GROUP BY prime_genre
ORDER BY COUNT(*) DESC
LIMIT 1;

# Q4. Which is the one with less?
SELECT prime_genre, COUNT(*)
FROM DATA
GROUP BY prime_genre
ORDER BY COUNT(*) ASC
LIMIT 1;

# Q5. Take the 10 apps most rated.
SELECT track_name, rating_count_tot, prime_genre, user_rating
FROM DATA
ORDER BY rating_count_tot DESC
LIMIT 10;

# Q6. Take the 10 apps best rated by users.
SELECT track_name, user_rating, prime_genre
FROM DATA
ORDER BY user_rating DESC
LIMIT 10;

# Q7. Take a look on the data you retrieved in the question 5. Give some insights.

# Q8. Take a look on the data you retrieved in the question 6. Give some insights.

# Q9. Now compare the data from questions 5 and 6. What do you see?

# Q10. How could you take the top 3 regarding the user ratings but also the number of votes?

SELECT track_name, `rating_count_tot`, user_rating
FROM DATA
ORDER BY rating_count_tot DESC, user_rating DESC
LIMIT 10;

# Q11. Do people care about the price? Do some queries, comment why are you doing them and the results you retrieve. What is your conclusion?

SELECT price, SUM(rating_count_tot)/COUNT(track_name), AVG(`user_rating`)
FROM DATA
GROUP BY price
ORDER BY ABS(price) ASC;

	



