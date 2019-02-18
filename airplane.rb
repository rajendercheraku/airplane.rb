puts "enter the array number of elements in the array"

numberOfElements = gets.chomp().to_i

array = []

for m in 0...numberOfElements do
  puts "enter the row"

  row = gets.chomp().to_i

  puts " enter the column"

  col = gets.chomp().to_i

  input = [row, col]

  array << input
end

$rowSize = array.map{|e| e[0]}.max

$colSize = array.map{|e| e[1]}.max

original = []

c = []

for i in 0...array.length
	c << array[i][0]
end

for i in 0... array.length 

      original << array[i].reverse
end

array = original

 obj = {}

def fillWithMAandW(array)

     seats = []
      
     
      for i in 0...array.length 

	      seats.push((Array.new(array[i][0])).map{|k| Array.new(array[i][1]).fill("M")})	
      end

      for i in 0...seats.length

	      for j in 0...seats[i].length
		   seats[i][j][0] = "A"
		   seats[i][j][seats[i][j].length-1] = "A"
	   end

      end

      for  i in 0...seats[0].length

           seats[0][i][0] = "W"
      end


      for i  in 0...seats[seats.length - 1].length

	   seats[seats.length-1][i][(seats[seats.length-1][i].length)-1]="W"
      end

    return seats

end

def replaceWithNumber(val, count, seats, colSize, rowSize,number)


    for i in 0...colSize

	 for j in 0...rowSize
           
		 if(seats[j]== nil||seats[j][i]==nil)

			 next
	         end
	       for k in 0...seats[j][i].length

		     if(seats[j]!=nil and seats[j][i]!= nil and seats[j][i][k]===val)

                              if( count <= number)

			       seats[j][i][k] = count
                                                
			       count = count + 1

			     end

			       
			   

		     end

		     if (count == number)


			     break
		     end


		  



	       end

	      if (count == number)

		      break

	      end
	
         end
    end

    return {seats: seats, count: count}

    
end

def printValues(seats, colSize, rowSize)

     stringJ = ""

     for i in 0...colSize

	     for j in 0...rowSize

		     if(seats[j]==nil||seats[j][i]==nil)
			       
			          b = "_"

				 # c = array[i][0]

				  b =  "_ " * (i +1)

				  stringJ = stringJ + b

				  stringJ = stringJ + ","
				  
			next
	             end


		     for k   in 0...seats[j][i].length
			     stringJ = stringJ+(seats[j][i][k].to_s+" ")
		     end
			  stringJ = stringJ+","
	     end

	     stringJ = stringJ+"\n"
     end

    # print stringJ

end

$seat = fillWithMAandW(array)


#print array

def airplane

 puts " enter the number of passengers"

 number = gets.chomp().to_i

 number = number + 1

 #printValues(seat,colSize,rowSize)

 obj=replaceWithNumber("A",1,$seat,$colSize,$rowSize,number)

 #puts obj[:count]

 if (obj[:count] < number) 

  obj= replaceWithNumber("W",obj[:count] ,obj[:seats] ,$colSize,$rowSize,number)      

 end

if(obj[:count] < number)
  
   
  obj = replaceWithNumber("M", obj[:count], obj[:seats],$colSize, $rowSize,number)

end
printValues($seat,$colSize,$rowSize)

for i in 0...obj[:seats].length

	print obj[:seats][i]
        
         print "\n"

	 s = " "+"\n"

	 print s
end
end
 
def recursive 

   airplane 

   recursive

end

recursive
