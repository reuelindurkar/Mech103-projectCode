%Loan Payment
%Course: MECH 103-002 - Fall 2019
%Name: 
%Date:

clc; close all
%Define your variables
%use the following variables: 
%monthly_interest   --- monthly interest
%monthly_payment  -- standard monthly payment 
%p_balance       -- principal balance
%annual_int_rate  -- annual interest rate
%days          -- number of days since last payment; use 31
%amount_paid   -- amount paid to principal balance
%year_count  -- number of days in a year; use 365
%month_num  -- number of months

%Define known parameters
annual_int_rate = 0.1602;
p_balance = 6000;
year_count = 365;
days = 31;
monthly_payment = 400;
month_num = 0;
monthly_interest = p_balance *(annual_int_rate / year_count) * days;
amount_paid = 0;
p_balance = p_balance - amount_paid;
total_interest = 0;
fprintf('Number of Months \t Total Interest \tAmount Paid \tNew Principal Balance \n') %table headers
%Write your loop and the rest of your program below
while p_balance > 0
    monthly_interest = p_balance *(annual_int_rate / year_count) * days;
    amount_paid = monthly_payment - monthly_interest;
    if amount_paid > p_balance
        amount_paid = p_balance;
        p_balance = p_balance - amount_paid;
    else
        p_balance = p_balance - amount_paid;
    end
    total_interest = total_interest + monthly_interest;
    
    month_num = month_num +1;


    %PUT THE FOLLOWING IN YOUR LOOP, BUT AT THE VERY END.
    %The following piece of code stores output parameters as vectors and prints out the results as a table. 
    vec_total_interest(month_num) = total_interest;
    vec_amount_paid(month_num) = amount_paid;
    vec_p_balance(month_num) = p_balance;
    %Display a table of the results
    fprintf('%6d %24.2f %17.2f %20.2f  \n',month_num,total_interest,amount_paid,p_balance)
end