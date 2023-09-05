WITH MovieReviewStats AS (
  SELECT
    YEAR(release_date) AS release_year,
    movie_id,
    AVG(review_rating) AS avg_rating,
    COUNT(*) AS review_count
  FROM
    imdb.reviews
  GROUP BY
    release_year, movie_id
  HAVING
    COUNT(*) >= 10
),

RankedMovies AS (
  SELECT
    mrs.release_year,
    mrs.movie_id,
    m.movie_title,
    mrs.avg_rating,
    ROW_NUMBER() OVER(PARTITION BY mrs.release_year ORDER BY mrs.avg_rating DESC) AS rank
  FROM
    MovieReviewStats mrs
  JOIN
    imdb.movies m
  ON
    mrs.movie_id = m.movie_id
)

SELECT
  release_year,
  movie_id,
  movie_title,
  avg_rating
FROM
  RankedMovies
WHERE
  rank = 1
ORDER BY
  release_year;
