with Ada.Text_IO; use Ada.Text_IO;
with Ada.Integer_Text_IO;
with Ada.Float_Text_IO;
--with Ada.Numerics.Generic_Elementary_Functions;
with Ada.Numerics.Elementary_Functions;
use Ada.Numerics.Elementary_Functions;


procedure Main is
   --declare variables here
   input : Integer;

   function getExactError(exact:Float; approx:Float) return Float is
   begin
      return (100.0 * (exact - approx) / exact);
   end getExactError;

   function getTruncError(first:Float; approx:Float) return Float is
   begin
      return (100.0 * first / approx);
   end getTruncError;

   procedure printThis(interval:Float; approx:Float; exact:Float; exactError:Float; relativeError:Float) is
   begin
      Put_Line (Float'Image (interval));
     -- Ada.Float_Text_IO.Put(interval,1,6,4);Put("   ");Put(approx,1,6,4);Put("   ");Put(exact,1,6,4);Put("   ");Put(exactError,1,6,4);Put("   ");Put(relativeError,1,6,4);
   end printThis;

   procedure evaluateSeries is
      -- TODO change termCount to int maybe
   termCount, rangeInput, xVal, exact,
      exactError, truncError, increments, trunc: Float := 0.0;
      approx : Float := 1.0;

   begin
      while termCount <= 0.0 or termCount > 5.0 loop
         Put_Line("Enter number of terms in the series (5 terms max)");
         Ada.Float_Text_IO.Get(termCount);
      end loop;
      while rangeInput <= 0.0 or rangeInput >= 3.0 loop
         Put_Line("Enter range of t to evaluate in 10 increments (0.0 < t < +2.0): ");
         Ada.Float_Text_IO.Get(rangeInput);
      end loop;

      Put_Line("MACLAURIN SERIES");
      Put(" t     "); Put("   Series     ");Put("    Exact    ");Put("    Exact % Error    ");
      Put("Trunc. % Error");Put_Line("");

     -- D(t) = e^-t cos(t)
      exact := Ada.Numerics.e ** xVal;

      for I in 1 .. 10 loop
         increments := rangeInput / 10.0;
         xVal := xVal + increments;

         if termCount = 1.0 then
            approx := 1.0;
            -- not sure if this is proper way to cast to negative
            trunc := -xVal;
         elsif termCount = 2.0 then
            approx := 1.0 - xVal;
            trunc := (xVal * xVal * xVal) / 3.0;
         elsif termCount = 3.0 then
            approx := 1.0 - xVal + (xVal * xVal * xVal) / 3.0;
            trunc := (xVal * xVal * xVal * xVal) / 6.0;
         elsif termCount = 4.0 then
            approx := 1.0 - xVal + (xVal * xVal * xVal) / 3.0 - (xVal * xVal * xVal * xVal) / 6.0;
            trunc := (xVal * xVal * xVal * xVal * xVal) / 30.0;
         elsif termCount = 5.0 then
            approx := 1.0 - xVal + (xVal * xVal * xVal) / 3.0 - (xVal * xVal * xVal * xVal) / 6.0 +
            (xVal * xVal * xVal * xVal * xVal) / 30.0;
            trunc := (xVal * xVal * xVal * xVal * xVal * xVal * xVal) / 630.0;
         end if;

         exactError := getExactError(exact,approx);
         truncError := getTruncError(trunc,approx);
         printThis(xVal, approx, exact, exactError, truncError);


      end loop;


   end evaluateSeries;



begin
   -- Main menu
   loop

      Put_Line("Evaluate the Maclaurin Series approximation to exp"); -- Put_Line is like .println of java
      Put_Line("1: evaluate the series");
      Put_Line("2: quit");

      Ada.Integer_Text_IO.Get(input);

      if input = 1 then
         evaluateSeries;
      end if;
      exit when input = 2; -- exit loop
      --Ada.Integer_Text_IO.Put(input);
      --Put_Line(Integer'Image(input));
   end loop;
   null;
end Main;



