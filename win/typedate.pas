program typedate;

{
    Derniere modif: 04/04/2020 21:05:49
    Utilisation du program typedate.pas sous windows:

    Touche raccourci: 
    CRéer un raccourci vers ce program, 
    Click droit sur le raccourcis et changer les touches raccourcis.

    Exécuter le programme et cliquer sur la fenetre sur laquelle écrire la date et heure.
}
uses 
windows, classes,sysutils,
uEvents;



    function CopyCursor(pcur:HCURSOR): HCURSOR;
    begin
        CopyCursor:=  HCURSOR(  CopyIcon( HICON(pcur) )  );
    end;



var str:string;
hwnd:THandle;
dort,reveil,sleep_val, w, h,x0,y0, x,y,mousestate,altstate: integer;
altFirst,mouseDown,hasBeenDown : boolean;

console:boolean=false;


arg:AnsiString;
 ask:boolean=false;
 direct:boolean=true;
cursor,prevCursor:HCursor;
moving_cursor:ansistring = 'C:\Windows\Cursors\aero_pen_l.cur';
default_cursor:ansistring = 'C:\Windows\Cursors\aero_arrow.cur';


begin

sleep_val:=9;

mouseDown:=false;


if(paramCount>=1) then arg:=paramstr(1);

if( (arg ='ask') or (arg='-a') or (arg='-ask') ) then ask:=true;
if( (arg ='direct') or (arg='-d') or (arg='-direct')or (arg='-go') ) then direct:=true;

if(ask) then MessageBox(0,'Cliquez pour taper','TypeDate',0);



                    //now you have a copy of the original cursor, save original curosor               
                    prevCursor := CopyCursor( LoadCursor(0, IDC_ARROW) );
                    //change cursor to Drag Cursor
                    if(FileExists(moving_cursor) )then
                    begin
                        cursor := LoadCursorFromFile(PChar(moving_cursor) );
                        SetSystemCursor(cursor,OCR_NORMAL);                         
                    end; 

if( not direct) then
  begin
    repeat
 
     sleep(sleep_val);
     mousestate := GetAsyncKeyState(VK_LBUTTON);


     if(console) then writeln('mousstate:', mousestate);

                if(mousestate and $8000 <> 0)
                then begin
                     if(console) then writeln('mouse is down');                            
                    mouseDown := true;
                    hasBeenDown:=true;
                end else 
                begin
                    mouseDown := false;
                    if(console) then writeln('mouse is up');
                    if(hasBeenDown) then break;
                end;
                
     //writeln(mousestate);

    until(mouseDown);
end; // Endif not direct
if(console) then writeln('exit');
sleep(500);

hasBeenDown:=false;
//hwnd:=GetForegroundWindow;

{
hwnd := GetForeGroundWindow(); 
sendstr( inttostr (hwnd) ) ;
 }

//Enfin, le code métier ! 
str:=dateTimeTostr(now);

sendstr(str);



   //reset cursor to default
                SetSystemCursor(prevCursor,OCR_NORMAL);//restore the good old arrow

end.