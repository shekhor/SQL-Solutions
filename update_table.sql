#I have a table named lower with lower fee, name and id. Write a SQL to update lower fee for following conditions:

#Give 10% discount if the fee is more than 100$
#Rise 20$ if fee is less than or equal 50
#And make sure any fee is not greater than 125$ after discount.

UPDATE lower
SET fee = 
    CASE 
        WHEN fee - fee * 0.1 > 125 THEN 125
        WHEN fee > 100 THEN ROUND(fee - fee * 0.1, 2)
        WHEN fee <= 50 THEN fee + 20
        ELSE fee
    END;
