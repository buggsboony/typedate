#include <iostream>
#include "../myheaders/memo.h"
#include "../myheaders/tools.h"
#include "../myheaders/xtools.h"
#include "../myheaders/console.h"

//2023-08-05 00:14:32 - makefile build.. see https://jdhao.github.io/2020/12/12/build_opencv_project_with_cmake/
// mkdir build
// # use the following command to build if you are in project root
// cmake -Bbuild -DCMAKE_BUILD_TYPE=Release
// cd build
// cmake --build .   


string appname="typedate";
//install line:
//   sudo ln -s /home/boony/documents/dev/c++/typedate/build/typedate /usr/bin/typedate

//utilisation:

//
//int code =XK_Down; sendKeyState(code,true, display); sendKeyState(code,false, display);
// int code = XStringToKeysym("Z");

int waitSec=0;
int innerWait=0;
string format="%Y-%m-%d %X";
int main(int argc, char **argv) {    
    
    for (int i = 0; i < argc; ++i)
    {
        
        string arg = argv[i];
        arg =  trimStr(strToLower(arg));  //2023-08-05 00:27:20 - Watchout, string is forced to LOWER CASE
        
        if( (arg == "-h") || (arg == "--help") )
        {      
            ostringstream c_out;
            string scout;
            c_out<<"Usage : "<<appname<<" -t 4  #sec, wait 4secs before typing"<<endl     
            <<"Usage : "<<appname<<" -i 100 #inner millisec, type each letter then wait 100 ms"<<endl
            <<"Usage : "<<appname<<" -f \"%Y-%m-%d %X\" #specify the format"<<endl
            <<"Usage : "<<appname<<" FR #specify FR format"<<endl
            <<"Usage : "<<appname<<" -f \"%d/%m/%Y %X\" #specify FR format"<<endl; 
            
            writeWhite(c_out.str());
            return 0;
        }
        //cout<<"ARGUMENT is "<<"["<<arg<<"]"<<endl;
        if( (arg == "-t") )
        {  //wait T seconds
            if(argc>=i+1)
            {
                waitSec = strToInt(argv[i+1]);
            }            
        }
        else if( (arg == "-i") )
        {  //select inputs to be recorded: [ -i 100 ]
            if(argc>=i+1)
            {
               innerWait = strToInt(argv[i+1]);                                 
            }            
        }
        else if( (arg == "-f") )
        {  //select inputs to be recorded: [ -i 100 ]
            if(argc>=i+1)
            {
               format = (argv[i+1]);                                 
            }            
        }else if( (arg == "fr") )
        {  
            //Force Format to FR    
            puts("Format FR!");
            format = "%d/%m/%Y %X";
        }   
    }        
 

string sdate = currentDateTime(format);


printf("Sleeping %ds\n", waitSec);
sleep(waitSec);

printf("Typing date: %s\n", sdate.c_str() );

 char c1,c2;
    Display * dpy = XOpenDisplay("");
   for(int i=0; i<sdate.length(); i++)
   {       
        c2=0;
        c1=sdate[i];
        if(c1<0)c2=sdate[i+1];
        
   
       
   //XKeysymToKeycode
       //XkbKeycodeToKeysym
       string sc=""; sc+=c1; sc+=c2;
       int sym = XStringToKeysym(  sc.c_str() );
       
       int keycode = XKeysymToKeycode(dpy,sym);   
       //printf("C1=%d; C2=%d\n",c1,c2);
       //printf("[%s]%c=%d 0x%X\n",sc.c_str(),c,sym,keycode);
      // XSendKey( XK_A ,0, 0, dpy);                
       int modifiers_flags=0; //modifiers_flags |= ShiftMask;
       
       int xk = charToXK(c1,c2, modifiers_flags);
  
       XSendKeyEx(xk,modifiers_flags,0, 0, dpy);                
       
      if(i<sdate.length() ) msleep(innerWait);
       
       //XSendKey(keycode,0,0,dpy);
       
   }
    
    
//   XSendKey(XK_KP_Enter);
   
    XCloseDisplay(dpy);
    
    
    return 0;
}
