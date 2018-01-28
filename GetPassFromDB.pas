program GetPassFromDB (input, output);
{read and write encrypted password from database}

  var
  f : file of string[45];
  passNew : string[45];
  login : string[15];
  
begin
  write('Login: ');
  readln(login);
  
  {find a folder witch is named like a users login}
  ChDir(login);
  
  assign(f, 'user.txt');
  reset(f);
  
  read(f, passNew);
  writeln(passNew);
  
  close(f);
  
  readln
end.