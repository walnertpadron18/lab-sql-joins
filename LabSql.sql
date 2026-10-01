-- 1. Número de películas por categoría
SELECT
    c.name AS category,
    COUNT(fc.film_id) AS num_films
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
GROUP BY c.category_id, c.name
ORDER BY num_films DESC;

-- 2. ID de tienda, ciudad y país de cada tienda
SELECT
    s.store_id,
    ci.city,
    co.country
FROM store s
JOIN address a  ON s.address_id = a.address_id
JOIN city ci    ON a.city_id = ci.city_id
JOIN country co ON ci.country_id = co.country_id;

-- 3. Ingresos totales por tienda, en dólares
SELECT
    st.store_id,
    SUM(p.amount) AS total_revenue
FROM payment p
JOIN staff st ON p.staff_id = st.staff_id
GROUP BY st.store_id;

-- 4. Duración media de las películas por categoría
SELECT
    c.name AS category,
    ROUND(AVG(f.length), 2) AS avg_length
FROM category c
JOIN film_category fc ON c.category_id = fc.category_id
JOIN film f           ON fc.film_id = f.film_id
GROUP BY c.category_id, c.name
ORDER BY avg_length DESC;
