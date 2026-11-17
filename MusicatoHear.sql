/*
--Here we do a new repository to make that the commitment becomes best

1.- clear the running total and add the new total to the table
*/

SELECT 
    calculus,
    new_running,
    ROW_NUMBER() OVER (ORDER BY new_running DESC) AS RANKnew_running
FROM(
    SELECT TOP 5
        calculus,
        new_running 
    FROM RunningTotal
    WHERE calculus = 'abajo'
) t