import os
import tkinter as tk
from tkinter import filedialog

#Take csv input to get items
def parse_csv(csvinput):
	exportArray = []
	lastComment = ""
	lastCommentStart = ""
	#open passed csv
	with open(csvinput, "r", encoding='utf8') as f:
		#Iterate through each line in csv
		for line in f:
			#Split csv via seperator
			lineArray = line.split(',')
			lineA = lineArray[1].strip().replace(" ", "_").replace("-", "_").replace("(","_").replace(")","_")
			_spaces = 46 - len(lineArray[0])
			_class = "	class " + lineArray[0] + _spaces * " " + "{ quality = " + lineA + "Quality; price = " + lineA + "Price; };"
			_comment = "  //NOTE " + lineArray[1]

			lastComment = lineArray[1]

			if (lastCommentStart != lineArray[1][:6]):
				lastCommentStart = lineArray[1][:6]
				_class = "\n	//" + lastComment + _class

			exportArray.append(_class + _comment)
	return exportArray


#Create instance of tk mainwindow
root = tk.Tk()
#Withdrawn mainwindow
root.withdraw()
#Create an "Open file" dialog to get csv file
try:
	file_path = filedialog.askopenfilename(initialdir=os.getcwd(), title="Select CSV File", filetypes=[("CSV FILES", "*.csv")])
except FileNotFoundError:
	print("Select a file")
	pass
#Pass file (location) to be parsed
formatted = parse_csv(file_path)
with open("owo.hpp", "w") as f:
	for x in formatted:
		f.write(x)