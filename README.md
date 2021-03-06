KBL-Visualizer
==============

This program allows you to visualize keyboard
layout files (KBL) of Symbitz Software's
PopOnTop keyboard replacement for Symbian UIQ
devices.

The program itself should be self-explanatory.
The left area is the working space which
contains the keyboard layout source code you
are working on. The syntax of the command in
the current line is displayed above the text
area. You can open and save your work using
the buttons above the syntax line.

The right hand side shows a preview of the
keyboard so that you get an idea how it
looks like. Use the SpinControl next to the
"Visualize!"-button to select the map you
want to see. Click on a key to jump to that
key in the KBL source code. The key at the
cursor position is highlighted using a red
border.

The bottom left corner contains the unicode
table. It is loaded from the file
`unicode-index.txt` . A double-click on a row
will paste the unicode at the cursor position.

Bottom right there is the color editor. If you
selected a color-value in your kbl, click on
the "Get"-button to load the value into the
color editor. After changing it, you can paste
it back into your file with the "Insert"-button.

Landscape keyboards are not yet supported.

I don't take *ANY* responsibility for any
damage to your computer which might occur by
using this program.

Please make sure the file `KBLVisualizer.bmp` is
in the same directory as `KBLVisualizer.exe`. If
you rename `KBLVisualizer.exe`, do so with the bmp.

Also make sure the file `unicode-index.txt` is
besides the other files. You can get an updated
list of unicodes from [1]. After download, just
rename it to unicode-index.txt .

Feel free to replace `KBLVisualizer.bmp` by a screenshot
of your own Px00. (208x320 pixels)

[1] http://www.unicode.org/Public/UNIDATA/Index.txt

![](screenshot.png)
