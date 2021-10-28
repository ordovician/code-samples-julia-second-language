# chapter 06 - Storing Data in Dictionaries
function lookup(key, table)
   for (k, v) in table
       if key == k
           return v
       end
   end
   throw(KeyError(key))
end
