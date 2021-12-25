# README

Fetch Rewards Assignment, Backend Engineer, Peter Bacenet

Users have points in accounts
Users only see a SINGLE balance in their accounts (return single balance)

Fetch tracks points via payer/partner, 
Transactions have - payer(string), points(integer/positive or negative), timestamp(date)

Earning Points vs Spending Points (both are transactions)

When spending points, 

oldest based on transaction stamp are spent first (sort by transaction stamp)

Spend call: { "points": 5000 } (accepts points as a param)
log  payer and points deducted for total points, aka payer: Peter  points: -2500, payer: Jess points: -2500 for a 5000 point call
On spend transactions, return serializer custom { "payer": <string>, "points": <integer> } for each call


User has_many Transactions
Payer has_many Transactions
Transaction
Transactions contain a partner, point addition or deduction, timestamp
Points cannot go negative (validations)



We are not defining specific requests/responses. Defining these is part of the exercise.

We don’t expect you to use any durable data store. 

Storing transactions in memory is acceptable for the exercise.
