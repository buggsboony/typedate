program hotkeys;
{$apptype GUI}
uses windows, sysutils, classes , uMemo, uEvents;


var
 r,fkey,vk1 ,vk2,vk1_state,sleep_val:integer;

 is_console:boolean=false;
first_down:boolean=true;
lines:TStringList;
mess,filepath,conf_file,filename_noext,
appname, filename, line : AnsiString;

vkeys_parts,parts:TStringList;
max_sleep:integer;
command: AnsiString;
begin

//VK_LWIN	5B//parseInt("5B",16) => 91
//F3 = 72 => 114

filepath := getExecutableName;
filename := ExtractFileName(filepath);
filename_noext := changeFileExt(filename,'');

conf_file:=filename_noext+'.conf';

appname:=filename_noext;

if( is_console ) then writeln('appname :', appname);




lines:= TstringList.create();

if(not fileexists(conf_file)) then
begin
    // box( utf8decode( 'Le fichier '+conf_file+' sera créé !' ), appname);     
    //  lines.append('91+114,typedate.exe');     
    //  lines.saveToFile(conf_file);
    // execute('notepad', conf_file);
    // box('Veuillez relancer le programme', appname);    
    //exit;
end;
 if( is_console ) then writeln('Hello');
//lire les  instructions:
//lines.loadFromFile(conf_file); 
//line := lines[0];

//line :='91+114,'+'typedate.exe -d'; //en dure 
//messageBox(0,Pchar(line),'',0);
//if(fileExists('c:\windows\system32\typedate.exe')) then
begin
//line :='91+114,c:\windows\system32\typedate.exe -d'; //en dure 
line :='91+114,typedate.exe -d'; //en dure 
end;

parts := splitString(',',line);
vkeys_parts:= splitString('+', parts[0] );
vk1 := strToInt(vkeys_parts[0] );
vk2 := strToInt(vkeys_parts[1] );
command:= parts[1];

if( is_console ) then writeln('vk1=',vk1);
if( is_console ) then writeln('vk2=',vk2);
if( is_console ) then writeln('command=',command);
 
max_sleep:=20;
  sleep_val:=max_sleep;
    repeat

    

        sleep(sleep_val);


        vk1_state := GetAsyncKeyState(vk1);    

        if(vk1_state and $8000 <> 0)   //:-32768 = down :-32767 = up
        then begin
if( is_console ) then writeln('vk1 OK =',vk1_state);

                
                    if( first_down and isKeyDown(vk2) )   //:-32768 = down :-32767 = up
                    then begin
                    if( is_console ) then writeln('vk2 OK');
                    if( is_console ) then writeln('command=',command);

                        first_down:=false;
                        //command:='c:\windows\System32\typedate.exe';
                        //command:='C:\Users\W596554\Documents\dev\more\pascal\typedate\typedate.exe;
                        //command := 'notepad';
                          if(is_console) then writeln('GO action, exec:', command);
//messageBox(0,Pchar(command),'EXECUTE',0);

 
                       r:= execute(command);
                       if(is_console) then writeln('RESULT:',r);

                    end;
          
             sleep_val := 5;
        end else
        begin
            first_down:=true;
            sleep_val := max_sleep;
        end;

    until(false);
    



end.