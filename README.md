### Specification

## Requirements
* You should be able to interact with your code via a REPL like IRB or the JavaScript console. (You don't need to implement a command line interface that takes input from STDIN.)
* Deposits, withdrawal.
* Account statement (date, amount, balance) printing.
* Data can be kept in memory (it doesn't need to be stored to a database or anything).
## Acceptance criteria
* Given a client makes a deposit of 1000 on 10-01-2012
* And a deposit of 2000 on 13-01-2012
* And a withdrawal of 500 on 14-01-2012
* When she prints her bank statement
Then she would see
```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## User stories
```
As a client, so that I can save my money,
I'd like to deposit in the bank with date being recorded.

As a client, so that I can take out my money,
I'd like to withdraw from the bank with date being recorded.

As a client, so that i can see my statement,
I'd like to print my statement in certain format.

As a client, so that I can view my transactions on statement,
I'd like to see my each transaction in date, credit, debit, balance in one line.

As a client, so that I can view my transactions in order,
I'd like to see all transactions in reverse chronological order.

As a client, so that I can choose services,
I'd like to choose among "Deposit, Withdraw, Print Statement"
```
