## CHMOD
`sudo chmod a+r xxxxxx`  
The symbolic mode format consists of three characters. The first character specifies the target user or user group. Table 1 shows the four letters that represent each user group.
  
<table><tbody><tr><th>Letter</th><th>What It Means</th></tr><tr><td>u</td><td>The current user</td></tr><tr><td>g</td><td>The file group</td></tr><tr><td>o</td><td>Others that are outside of the owner’s group</td></tr><tr><td>a</td><td>All</td></tr></tbody></table>  

After the first character, you specify the action you want to take. Table 2 shows the three symbols you can use.
<table><tbody><tr><th>Letter</th><th>What It Means</th></tr><tr><td>+</td><td>Adds/turns on a permission</td></tr><tr><td>–</td><td>Removes/turns off a permission</td></tr><tr><td>=</td><td>Ignores the current permissions and creates new ones</td></tr></tbody></table>  

Lastly, you indicate the permission you want to change. Table 3 shows the file permissions.  
<table><tbody><tr><th>Letter</th><th>Read r</th></tr><tr><td>r</td><td>Read </td></tr><tr><td>w</td><td>Write </td></tr><tr><td>x</td><td>Execute </td></tr><tr><td>X</td><td>Execute for folders</td></tr></tbody></table>  

Another way of representing file permission is by using octal format. As the name suggests, the octal format uses the octal numbering system to indicate the file permissions in a chmod command.  
Table 4 shows the equivalent octal number for each combination of read, write, and execute permission.  
<table><tbody><tr><th>Number</th><th>Read&nbsp;</th><th>Write&nbsp;</th><th>Execute&nbsp;</th></tr><tr><td>7</td><td>r</td><td>w</td><td>x</td></tr><tr><td>6</td><td>r</td><td>w</td><td>–</td></tr><tr><td>5</td><td>r</td><td>–</td><td>x</td></tr><tr><td>4</td><td>r</td><td>–</td><td>–</td></tr><tr><td>3</td><td>–</td><td>w</td><td>x</td></tr><tr><td>2</td><td>–</td><td>w</td><td>–</td></tr><tr><td>1</td><td>–</td><td>–</td><td>x</td></tr><tr><td>0</td><td>–</td><td>–</td><td>–</td></tr></tbody></table>  
For example, the equivalent symbolic command of sudo chmod 4 filename is sudo chmod u+r filename.  

CHANGING ALL FILE PERMISSIONS INSIDE A DIRECTORY
Lastly, if you want to change all the permissions inside a folder or directory, use the recursive switch or -r. You may include it anywhere in the chmod command format as long as it doesn’t overlap.  

credit link: [www.circuitbasics.com](https://www.circuitbasics.com/file-permissions-on-the-raspberry-pi/#:~:text=To%20change%20file%20permissions%2C%20you,with%20things%20outside%20your%20account.)
