# SPSStoCSV
This program converts all of the SPSS data sets in an indicated directory and to CSV files. 

This and other SPSS Python Extension functions can be found at http://www.stat-help.com/python.html

## Usage
**SPSStoCSV(indir, [outdir = "NONE"])**
* "indir" is the directory location of the original files
* "outdir" is the destination is where you want the CSV files to be placed. If the second directory is excluded, the program will put the CSV files in a subdirectory off of the location of the original files.

## Example
**SPSStoCSV(indir = "C:/School discipline/Data",    
outdir = "C:/School discipline/Data/CSV")**
* This command would find all of the .sav files in the C:/School discipline/Data directory, convert them to CSV files which are then saved to the C:/School discipline/Data/CSV directory. 
