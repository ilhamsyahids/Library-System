unit uHashing;

interface
  uses crt;
  procedure Inputpass(var Pass: String);
  { Procedure Inputpass untuk membuat password saat diinput tidak terlihat}
  { I.S : password }
  { F.S : password menjadi '*' }
 

implementation
  procedure Inputpass(var Pass: String);
  
  var
    input: char;
  
  begin
    Pass := '';
    repeat
      input := ReadKey;
      if (input <> #8)  then begin 
        Pass := Pass + input;
        write ('*');
      end else begin //Backspace
          Pass := Copy(Pass, 1, Length(Pass) - 1);
          gotoxy(WhereX - 1, WhereY);
          write(' ');
          gotoxy(WhereX - 1, WhereY);
      end;
    until (input = #13); //Enter
    
    //Backspace
    Pass := Copy(Pass, 1, Length(Pass) - 1);
    gotoxy(WhereX - 1, WhereY);
    write(' ');
    gotoxy(WhereX - 1, WhereY);
    writeln;
  end;

end.