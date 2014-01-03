![GA_Logo](https://raw.github.com/generalassembly/ga-ruby-on-rails-for-devs/master/images/ga.png)


### Apprentice Code Challenge - "Change Machine"


##### Objective

Create a program that makes change using U.S. currency denominations with as few coins as possible and can calculate a total given a set of currency denominations.


##### Constraints

- Use Ruby as a language
- Adhere to object-oriented design principles
- Use a currency set of pennies, nickels, dimes, quarters
- The solution should exist as a public GitHub repository
- Make a github commit for each requirement

##### Currency set

```
pennie  = 1 cents
nickel  = 5 cents
dime    = 10 cents
quarter = 25 cents
```

##### Requirements

Your program should provide for the following functionality:

- Make change from a given amount of cents and returns a currency set
- Make change for quantities up to 100 cents
- Make cents from a given amount of currency and returns as a total number of cents
- Take input from the command line


##### Examples

```
3 cents            = 3 pennies
6 cents            = 1 nickel, 1 penny
14 cents           = 1 dime, 4 pennies

2 dimes, 3 pennies = 23 cents
3 pennies          = 3 cents
```


##### Areas we evaluate

- Simplicity/elegance of design (be prepared to discuss)
- Maintainability (clean, code that is easy to understand and change)
- Testing (We encourage RSpec)
