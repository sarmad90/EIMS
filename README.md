EIMS
====
Installation Guide:
1) Goto your visual studio/website directory which may be this(You might have installed your VS in a different directory): C:\Users\Sarmad\Documents\Visual Studio 2012\WebSites
2) In your visual studio websites directory run this command: git clone git@github.com:sarmad90/EIMS.git
3) Goto EIMS directory which is clone in your websites directory, inside the EIMS directory you will see another EIMS directory containing the solution file of visual studio.
4) Copy that EIMS directory and paste it in the projects directory of visual studio.
5) Open SQL server 2012
6) Create a Database called EIMS (Name should be exact).
7) Righ click on that database and click restore > database.
8) In the new window select options from the menu on the left check two checkboxes
  a) Overwrite the existing database (With Replace)
  b) Prompt before restoring each backup (Last checkbox)
  and click ok.
9) Change the server name in the connection string from web.config to your sql server name.
10) Open visual studio and open project click EIMS.
