# Pascal

- online compiler: http://rextester.com/l/pascal_online_compiler

- tutorial: https://www.tutorialspoint.com/pascal/index.htm


```pascal
{*
    example.pas
    Multiple line comment
    
*}
program Brian; 

(* =============================== Program global variables *)
var a, b: integer;
var c: integer;


var
age, weekdays : integer;
taxrate, net_income: real;
choice, isready: boolean;
initials, grade: char;
name, surname : string;


const Foo = 123;

(* =============================== pointers *)
var
   number: integer;
   iptr: ^integer;
   y: ^word;


(* =============================== records *)
type
Books = record
   title: packed array [1..50] of char;
   author: packed array [1..50] of char;
   subject: packed array [1..100] of char;
   book_id: longint;
end;

var
   Book1, Book2: Books; (* Declare Book1 and Book2 of type Books *)
   
   
   

type SUMMER = (April, May, June, July, September); (* enum *)

(* =============================== A procedure example *)
(* a procedure has no return *)
procedure myFunction;
var x: integer;
begin
   (* local variables *)
   x := 10;
   writeln('function: x is ', x);
end;






(* =============================== function returning the max between two numbers *)
function max(num1, num2: integer): integer;

var
   (* local variable declaration *)
   result: integer;

begin
   if (num1 > num2) then
      result := num1
   
   else
      result := num2;
   max := result;
end;




(* =============================== execution of a program *)
begin
   (* actual initialization *)
   a := 10;
   b := 20;
   c := a + b;
   
   writeln('value of a = ', a , ' b =  ',  b, ' and c = ', c, ' hello'); (* concatenation *)
   writeln('Foo is ', Foo);
   
   writeln('max: ', max(20, 40));
   
   myFunction();
   
   
   
   
   
   (* ========== pointers START *)
   number := 100;
   writeln('Number is: ', number);
   
   iptr := @number;
   writeln('iptr points to a value: ', iptr^);
   
   iptr^ := 200;
   writeln('Number is: ', number);
   writeln('iptr points to a value: ', iptr^);
   
   
   
   y := addr(iptr);
   writeln('address of pointer: ', y^); 
   
   
   (* ========== pointers END *)
   
   
   writeln('-----------------------------------------');
   
   
   
   (* ========== RECORDS START *)
   (* book 1 specification *)
   Book1.title  := 'C Programming';
   Book1.author := 'Nuha Ali '; 
   Book1.subject := 'C Programming Tutorial';
   Book1.book_id := 6495407;

   (* book 2 specification *)
   Book2.title := 'Telecom Billing';
   Book2.author := 'Zara Ali';
   Book2.subject := 'Telecom Billing Tutorial';
   Book2.book_id := 6495700;
 
   (* print Book1 info *)
   writeln ('Book 1 title : ', Book1.title);
   writeln('Book 1 author : ', Book1.author);
   writeln( 'Book 1 subject : ', Book1.subject);
   writeln( 'Book 1 book_id : ', Book1.book_id);
   writeln; 

   (* print Book2 info *)
   writeln ('Book 2 title : ', Book2.title);
   writeln('Book 2 author : ', Book2.author);
   writeln( 'Book 2 subject : ', Book2.subject);
   writeln( 'Book 2 book_id : ', Book2.book_id);
   (* ========== RECORDS END *)
   
   
   
end.
```
