## To give file access to all users 
`sudo chmod a+r xxxxxx`  
The symbolic mode format consists of three characters. The first character specifies the target user or user group. Table 1 shows the four letters that represent each user group.
  
<table><tbody><tr><th>Letter</th><th>What It Means</th></tr><tr><td>u</td><td>The current user</td></tr><tr><td>g</td><td>The file group</td></tr><tr><td>o</td><td>Others that are outside of the owner’s group</td></tr><tr><td>a</td><td>All</td></tr></tbody></table>  

After the first character, you specify the action you want to take. Table 2 shows the three symbols you can use.
<table><tbody><tr><th>Letter</th><th>What It Means</th></tr><tr><td>+</td><td>Adds/turns on a permission</td></tr><tr><td>–</td><td>Removes/turns off a permission</td></tr><tr><td>=</td><td>Ignores the current permissions and creates new ones</td></tr></tbody></table>  

Lastly, you indicate the permission you want to change. Table 3 shows the file permissions.  
<table><tbody><tr><th>Letter</th><th>Read r</th></tr><tr><td>r</td><td>Read </td></tr><tr><td>w</td><td>Write </td></tr><tr><td>x</td><td>Execute </td></tr><tr><td>X</td><td>Execute for folders</td></tr></tbody></table>  