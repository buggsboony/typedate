unit uEvents;

{$mode objfpc}{$H+}

{
   Création: 03/04/2020 21:52:13
Ce code doit être amélioré



}


interface


uses
  classes,sysutils,windows;

const
  MAJ = $010;
  CTRL = $17;
  AltGr= $165;
        e_ACCENT_AIGU=-61;
                          percent_key=       192;

procedure downKey(key:integer);
           procedure upKey(key:integer);
                     procedure sendkey(key:integer);
                     procedure sendChar( c:char);
                   procedure sendstr(str:string);

//Rajout du 05/05/2020 12:07:15
function isKeyDown(vk:integer):boolean;




























implementation

procedure downKey(key:integer);
   begin
      keybd_event(key,0,0,0);
   end;

procedure upKey(key:integer);
   begin
      keybd_event(key,0,KEYEVENTF_KEYUP,0);
   end;


procedure sendkey(key:integer);
   begin
      keybd_event(key,0,0,0);
      keybd_event(key,0,KEYEVENTF_KEYUP,0);
   end;




{ Entre 40 et 50 se trouvent:
à a acent grave
&
é eaccent aigu
}

{
touche démarrer se trouve proche de 110
}
procedure sendChar( c:char);
   var
     x:integer;
     s:boolean=true;
   begin
          x:= ord(c);
     if( (x>=97)and(x<=127) ) then
     begin
          sendkey(x-32);s:=false;
     end else
     if( (x>=ord('0') )and(x<=ord('9') ) ) then
     begin
        downkey($10);sendkey(x);upkey($10);
        s:=false;
     end else
     if( (x>=ord('A') )and(x<=ord('Z') ) ) then
     begin
        downkey($10);sendkey(x);upkey($10);
        s:=false;
     end;

     (*     //ça se complique poru les accents, surtout avec utf8
     if( (x=ord('&') ) ) then
     begin
        sendkey(x+11); s:=false;
     end;

     //E accent aigu
     if( (x=e_ACCENT_AIGU ) ) then
     begin
        sendkey(  ord('2') ); s:=false;
     end;
    *)
      if( (c=' ' ) ) then
     begin
        sendkey( VK_SPACE ); s:=false;
     end;
        
     if( (c=';' ) ) then
     begin
        sendkey( 190 ); s:=false;
     end;

     if( (c=':' ) ) then
     begin
        sendkey( 191 ); s:=false;
     end;

         if( (c='-' ) ) then
     begin
        sendkey($6D); s:=false;
     end;

                if( (c='/' ) ) then
     begin
        sendkey($6F); s:=false;
     end;


  (*
          if(x=='/'){sendkey(0x6f);s=false;}
         if(x==':'){sendkey(191);s=false;}

if(x=='('){sendkey('5');s=false;}
if(x=='+'){sendkey(0x6b);s=false;}
if(x=='-'){sendkey(0x6d);s=false;}
if(x=='*'){sendkey(0x6a);s=false;}
if(x=='.'){sendkey(0x6e);s=false;}
if(x=='"'){sendkey('3');s=false;}
if(x=='\''){sendkey('4');s=false;}//'
if(x=='ç'){sendkey('9');s=false;}
if(x=='à'){sendkey('0');s=false;}
if(x=='/'){sendkey(0x6f);s=false;}
if(x=='\\'){downkey(AltGr);sendkey('8');upkey(AltGr);upkey(56);s=false;}
if(x==0xa){sendkey(13);s=false;}
if(x=='@'){downkey(AltGr);sendkey('0');upkey(AltGr);upkey(48);s=false;}

if(x=='^'){downkey(AltGr);sendkey(57);upkey(AltGr);upkey(57);s=false;}

if(x=='~'){downkey(AltGr);sendkey('2');upkey(AltGr);upkey(50);s=false;}

if(x=='['){downkey(AltGr);sendkey('5');upkey(AltGr);upkey(53);s=false;}//17=alt gr
if(x==']'){downkey(AltGr);sendkey(219);upkey(AltGr);upkey(219);s=false;}

if(x==27){sendkey(VK_BACK);s=false;}
if(x==')'){sendkey(219);s=false;}
if(x==';'){sendkey(190);s=false;}

if(x=='!'){sendkey(223);s=false;}
if(x=='#'){downkey(AltGr);sendkey('3');upkey(AltGr);upkey(51);s=false;/*disp(x);exit(0);*/}
if(x=='|'){downkey(AltGr);sendkey('6');upkey(AltGr);upkey(54);s=false;/*disp(x);exit(0);*/}
if(x=='¤'){downkey(AltGr);sendkey(186);upkey(AltGr);upkey(186);s=false;/*disp(x);exit(0);*/}
if(x=='€'){downkey(AltGr);sendkey(69);upkey(AltGr);upkey(69);s=false;/*disp(x);exit(0);*/}

if(x=='{'){downkey(AltGr);sendkey('4');upkey(AltGr);s=false;}
if(x=='}'){downkey(AltGr);sendkey(187);upkey(AltGr);s=false;}

if(x=='§'){downkey(0x12);sendkey(223);upkey(0x12);s=false;}
if(x=='<'){sendkey(226);s=false;}
if(x==','){sendkey(188);s=false;}
if(x=='?'){downkey(0x10);sendkey(188);upkey(0x10);s=false;}
if(x=='='){sendkey(187);s=false;}
if(x=='>'){downkey(0x10);sendkey(226);upkey(0x10);s=false;}
//underscore:
if(x=='_'){sendkey('8');s=false;}
//i circonflexe:
if(x=='î'){sendkey(221);sendchar('i'); s=false;}
//i tréma
if(x=='ï'){downkey(16);sendkey(221);upkey(16); sendchar('i'); s=false;}
if(s)sendkey(x);
*)

end;



procedure sendstr(str:string);
var
c:char;
i:integer;
len:integer;
begin

  len:= str.Length;

  for i:=0 to len do
  begin
    c:=str[i];
    sendchar(c);
  end;



end;

(*


void sendstr(char str[],int t=1)
{ int x=0;int l=strlen(str);
while(x!=l+1)
 {
sendchar(str[x]);
Sleep(t);
x++;
 }
}//sendstr

void sendStr(string s,int t=60)
{
	sendstr((char* )s.c_str(),t);
}

//renvoi

   *)



function isKeyDown(vk:integer):boolean;
var st:integer;
begin
isKeyDown:=false;
     st := GetAsyncKeyState(vk);    
    if(st and $8000 <> 0)   //:-32768 = down :-32767 = up
    then begin
        isKeyDown:=true;
    end;
end;



end.

