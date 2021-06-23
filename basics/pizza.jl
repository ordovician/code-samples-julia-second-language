# chapter 04 - Julia as a Spreadsheet
sales = [
    ("hawaiian", 'S', 10.5),
    ("sicilian", 'S', 12.25),
    ("hawaiian", 'L', 16.5),
    ("bbq chicken", 'L', 20.75),
    ("bbq chicken", 'M', 16.75)
]

name(pizza)    = pizza[1]
portion(pizza) = pizza[2]
price(pizza)   = pizza[3]

issmall(pizza)  = portion(pizza) == 'S'
islarge(pizza)  = portion(pizza) == 'L'
isbbq(pizza)    = name(pizza) == "bbq chicken"

