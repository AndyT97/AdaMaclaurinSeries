with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;


procedure Main is
   --declare variables here
   input : Integer;
   procedure evaluateSeries is
   termCount, rangeInput, xVal, exact,
   approx, exactError, truncError, increments, trunc: Float;

   begin
      Put_Line("Enter number of terms in the series (5 terms max)");
      Ada.Float_Text_IO.Get(termCount);


   end evaluateSeries;

begin
   loop
      Put_Line("Evaluate the Maclaurin Series approximation to exp"); -- Put_Line is like .println of java
      Put_Line("1: evaluate the series");
      Put_Line("2: quit");

      Ada.Integer_Text_IO.Get(input);
      exit when input = 2; -- exit loop
      --Ada.Integer_Text_IO.Put(input);
      Put_Line(Integer'Image(input));
   end loop;
   null;
end Main;



