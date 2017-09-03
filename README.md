# Rentcalc

A simple utility to tabulate and generate rent reports. Very useful in room-mate situations where you want to make clear the current bills. As a bonus, it creates a graphical line graph representation of your bills so you can track the monthly costs.

Generation is easy. Simply prepend a listing of bills, one per line. Order is important.

## Requirements

Machine you run the script must:
* Have a recent version of Ruby
* Have R
* Have rinruby gem installed

## Usage
```
Usage: rentcalc.rb [options]
    -f, --file PATH                  Path to bills.txt.
    -r, --roommates N                Number of roommates to divide bills
    -h, --help                       Prints this help.
```

## Bills.txt

This file contains a listing of collected bills in a monthly format.

Example:
```
# AUGUST 2017
2000
65.55
79.48
69.99
0
====
# JULY 2017
2000
0
127.70
69.99
266.38
====

```

```
# Monthly comment
RENT VALUE
GAS VALUE
ELECTRIC VALUE
INTERNET VALUE
COUNTY UTILITIES VALUE
==== delimeter
... Next month here
```

Feel free to add more fields if you need, just update the script and r script to get the pretty chart.

