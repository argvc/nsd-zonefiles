import glob
import os
import re
import sys

list= glob.glob('../zone/*.zone')
for file in list:
 f = open(file, 'r')
 f2 = open(file+'.tmp', 'w')
 try:
   lc = 0
   for line in f:
     if line.find(sys.argv[1]) != -1:
       print file,lc 
       line = re.sub(sys.argv[1], sys.argv[2], line)
       f2.write(line)
     lc = lc + 1
 finally:
   f.close()
   f2.close()
 if os.path.isfile(file) and os.path.isfile(file+'.tmp'):
   print file+'.tmp' , ' -> ' , file
   os.remove(file)
   os.rename(file+'.tmp', file)
 
 
 
 print file


