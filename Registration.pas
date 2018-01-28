program Registration (input, output);
{Simple form for account registration and password encryption}
  
  var
  f : file of string[45];
  
  login,
  password : string[14];
  
  passNew : string[45];
  passElement : char;
  
  passLength,
  passCursor,
  i : integer;
  symb1,
  symb2 : char;
  
begin
  writeln('Registration:');
  write('Login: ');
  readln(login);
  write('Password: ');
  readln(password);
  
  passLength := password.Length; {get passwords length}
  
  passCursor := 0;
  
  {create encrypted password}
  for i := 0 to passLength - 1 do
  begin
    symb1 := chr(random(65, 122));
    symb2 := chr(random(65, 122));
    passElement := password[i+1];
    passElement := succ(passElement);
    passNew := passNew.Insert(passCursor, symb1);
    passCursor := passCursor + 1;
    passNew := passNew.Insert(passCursor, symb2);
    passCursor := passCursor + 1;
    passNew := passNew.Insert(passCursor, passElement);
    passCursor := passCursor + 1
  end;
  
  {create a folder named like a users login}
  MkDir(login);
  
  {go to the created folder}
  ChDir(login);
  
  {create a file and write there an encrypted password}
  assign(f, 'user.txt');
  rewrite(f);
  
  write(f, passNew);
  
  close(f)
end.