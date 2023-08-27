SELECT c.algorithm, SUM(Case when QUARTER(t.dt) = 1 then volume else 0 end) as transactions_Q1, 
                    SUM(Case when QUARTER(t.dt) = 2 then volume else 0 end) as transactions_Q2, 
                    SUM(Case when QUARTER(t.dt) = 3 then volume else 0 end) as transactions_Q3, 
                    SUM(Case when QUARTER(t.dt) = 4 then volume else 0 end) as transactions_Q4
        FROM coins c
        JOIN transactions t
        ON c.code = t.coin_code
        where YEAR(t.dt) = 2020
        GROUP BY c.algorithm
        ORDER BY c.algorithm ASC;
