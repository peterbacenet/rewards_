# README

Fetch Rewards Assignment, Backend Engineer, Peter Bacenet
Technologies Used: Ruby on Rails Backend, Postman for Tests, and PostgreSQL database

Objectives:
 
1 . User can add transactions:

    JSON Body:
    
    {
    “points”:”5000”
    “user_id”: “1”
    “partner_id”: “1”
    }
    
    POST to “/transactions” -->  “transactions#create”

The create action method takes in data provided by the call, and creates a new transaction record in the table “Transactions” while additional transaction attributes like “redeemed” and “timestamp” are auto-populated within the action, and do not require user designation
Please note,  partner_id represents which partner these points should be attributed to. For this example values can range from 1-3. User_id should always be 1.

2. User can see balances:

        GET to “/balances” --> “partners#points_balance”
        GET to “/balances/:id” -->“partners#balance”
    
    The action methods all_points & points represent total balances and single balances for each payer. These methods only count points where “redeemed == false” indicating that the points being calculated have not been spent. These actions calculate a new balance every time they are called, and can change as points are added/spent.

3. User can spend points:

        JSON Body:
        
        {
        “points”:”5000”
        }
        
        POST to “/spend” --> “transactions#spend”
    
    The spend action method has multiple steps and two possible outcomes. Firstly, the method determines available points by summing all transactions that have not been redeemed (redeemed == false), in the event the request (spend_points) is greater, it will render an error message saying there is not enough points. This initial failsafe provides a safety net so no balances can go negative, as transactions will always be based on availability. Upon meeting this condition and having the available points to cover spend_points it proceeds to loop through transactions that are unredeemed. On each loop, the transaction is updated to “redeemed”, the result array is populated with the transaction performed,  and spend_points begins to dwindle.
    
    Eventually, spend_points will be reduced to a point where the available_points is the greater value.. this is detailed in the final loop.
    
    In the final loop we calculate the amount of points remaining once our spend request hits zero. “remaining balance” will become a new transaction with the same timestamp as its parent (and redeemed == false) . This ensures when we take points again, it is in correct order (sorted by timestamp).
    
    Lastly, the spend action takes the hashes stored in result, now populated with the actions in each loop, and returns these debits in proper formatting.
    
