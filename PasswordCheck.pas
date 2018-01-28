program PasswordCheck(input, output);
{check if the password is correct}

  var
  f : file of string[45];
  passEnc : string[45];
  login,
  password,
  passNew : string[14];

  passLength,
  passCursor,
  elementNumber : integer;
  passElement : char;
  
begin
  writeln('Autorisation form:');
  write('Login: ');
  readln(login);
  write('Password: ');
  readln(password);
  
  ChDir(login);
  
  assign(f, 'user.txt');
  reset(f);
  
  read(f, passEnc);
  
  close(f);
  
  passLength := passEnc.Length;
  passCursor := 0;
  elementNumber := 3;
  
  while elementNumber <= passLength do
  begin
    passElement := passEnc[elementNumber];
    passElement := pred(passElement);
    passNew := passNew.Insert(passCursor, passElement);
    elementNumber := elementNumber + 3;
    passCursor := passCursor + 1
  end;
  
  writeln;
  
  if password = passNew then
    writeln('Correct!')
  else
    writeln('Error!');
    
  readln
end.