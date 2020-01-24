### Specification

## Introduction

The following project is a tech test to simulate an ATM (deposit, withdrawal, printing statement).
It's a command line game, so you can just play in the terminal.

The code is written in ruby using test-driven approach, and tested in rspec framework. I separate

- the view in the `atm.rb` to serve as a **user interface**(so you can play from command line) and provide the standard input and output, and
- logics in `account.rb` to perform **deposit/withdraw/print statement actions**, and finally
- formatting in `statement.rb` to **avoid string pollution** in `account.rb`

### Test coverage

`COVERAGE: 100.00% -- 115/115 lines in 6 files`
run `rspec` after bundle install

There's no edge case discussed due to limited information provided (e.g. if user can have negative balance)

## Requirements

- You should be able to interact with your code via a REPL like IRB or the JavaScript console.
- Deposits, withdrawal.
- Account statement (date, amount, balance) printing.
- Data can be kept in memory (it doesn't need to be stored to a database or anything).

## Acceptance criteria

- Given a client makes a deposit of 1000 on 10-01-2012
- And a deposit of 2000 on 13-01-2012
- And a withdrawal of 500 on 14-01-2012
- When she prints her bank statement
  Then she would see

```
date || credit || debit || balance
14/01/2012 || || 500.00 || 2500.00
13/01/2012 || 2000.00 || || 3000.00
10/01/2012 || 1000.00 || || 1000.00
```

## How to play with me

- git clone to your local folder
- run `bundle install`
- in the root director, run

```
$ irb
2.6.3 :001 > require_relative "./lib/atm.rb"
 => true
2.6.3 :002 > new_client = Atm.new
=> #<Atm:0x00007ff4e310c6f8 @client_account=#<Account:0x00007ff4e310c6d0 @balance=0, @client_statement=#<Statement:0x00007ff4e310c6a8 @statement_record=[]>>>
>>
2.6.3 :003 > new_client.start_service
Choose one of the following 'Deposit','Withdraw', 'Print Statement'
Deposit
How much to deposit
500
 => ["17/12/2019 || 500.00 || || 500.00"]
2.6.3 :004 > new_client.start_service
Choose one of the following 'Deposit','Withdraw', 'Print Statement'
Withdraw
How much to withdraw
300
 => ["17/12/2019 || 500.00 || || 500.00", "17/12/2019 || || 300.00 || 200.00"]
2.6.3 :005 > new_client.start_service
Choose one of the following 'Deposit','Withdraw', 'Print Statement'
Print Statement
date || credit || debit || balance
17/12/2019 || || 300.00 || 200.00
17/12/2019 || 500.00 || || 500.00
 => nil
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
