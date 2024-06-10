* Encoding: UTF-8.
* Convert SPSS files to CSV
* By Jamie DeCoster

* This program converts all of the SPSS data sets in an indicated directory and
converts them to CSV files. 

**** Usage: SPSStoCSV(indir, [outdir], [readnames], [qualifier])
**** "indir" is the directory location of the original files
**** "outdir" is the destination is where you want the CSV files to be 
* placed. If the second directory is excluded, the program will put the CSV 
* files in a subdirectory off of the location of the original files.  

**** Example
* SPSStoCSV(indir = "C:/School discipline/Data",
* outdir = "C:/School discipline/Data/CSV")
**** This command would find all of the .sav files in the C:/School discipline/Data directory,
* convert them to CSV files which are then saved to the C:/School discipline/Data/CSV
* directory. 

**********
* Version History
**********
* 2019-10-07 Created based on CSVtoSPSS 2017-09-27.sps

set printback = off.
BEGIN PROGRAM PYTHON3.
import spss, os, time

def SPSStoCSV(indir, outdir = "NONE", readnames = True, qualifier = '"'):

# Strip / at the end if it is present
    for dir in [indir, outdir]:
        if (dir[len(dir)-1] == "/"):
            dir = dir[:len(dir)-1]
            
# If outdir is excluded, create output directory if it doesn't exist
    if outdir == "NONE":
        if not os.path.exists(indir + "/CSV"):
            os.mkdir(indir + "/CSV")
        outdir = indir + "/CSV"

# Get a list of all .sav files in the directory (savfiles)
    allfiles=[os.path.normcase(f)
    	for f in os.listdir(indir)]
    savfiles=[]
    for f in allfiles:
    	fname, fext = os.path.splitext(f)
    	if ('.sav' == fext and fname[:2] != '~$'):
    		savfiles.append(fname)

# Convert .sav files
    for fname in savfiles:
        submitstring = """GET
  FILE='{0}/{1}.sav'.
DATASET NAME $DataSet WINDOW=FRONT.
        
SAVE TRANSLATE OUTFILE='{2}/{1}.csv'
  /TYPE=CSV
  /ENCODING='UTF8'
  /MAP
  /REPLACE
  /FIELDNAMES
  /CELLS=VALUES.""".format(indir, fname, outdir)
        spss.Submit(submitstring)
end program python.
set printback = on.
