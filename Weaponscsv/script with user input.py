import os
import tkinter as tk
from tkinter import filedialog

#Take csv input to get items
def parse_csv(csvinput):
    #Create array to pass items
    #[[name,quality,price],[secondline,,],[thirdline,,],...]
    classArray = []
    #open passed csv
    with open(csvinput, "r", encoding='utf8') as f:
        #lastXXX to enable fast price settings for similar items
        lastName = ""
        lastQuality = 0
        lastPrice = 0
        #init
        quality = 0
        price = 0
        #Iterate through each line in csv
        for line in f:
            #Split csv via seperator
            lineArray = line.split(';')

            #underbarrel launcher
            if (lineArray[1] == "Launcher" and lineArray[2].split('_')[-1] == "secondary"):
                quality = 2
                price = 400

            #Get the first three strings seperated by an underscore
            firstTwo = '_'.join(lineArray[2].split('_')[0:3])
            #If this is the same as the last, it is likely a similar item
            if (lastName == firstTwo):
                print(lineArray[0] + " | " + lineArray[1] + " | " + lineArray[2])
                applyLast = input("Use same [Y/N]: ")
                if (applyLast == 'Y'):
                    #Set quality and price to same as last
                    quality = lastQuality
                    price = lastPrice
                else:
                    #Set lastName as item classname
                    lastName = firstTwo
                    continue
            else:
                #Set lastName as item classname
                lastName = firstTwo
                #Show the user the item name and category
                print(lineArray[0] + " | " + lineArray[1] + " | " + lineArray[2])
                quality = int(input("Assign Quality: "))
                price = int(input("Assign Price: "))
                #Set input values to last
                lastQuality = quality
                lastPrice = price
            #Append the class details to array to pass to write func
            classArray.append([lineArray[2],quality,price])
        #Return all items
        return classArray





def export(classArray):
    #Keep index while looping
    index = 0
    #Get user input for export name
    fileName = input("Enter export file title: ")
    #Open file with append
    with open(fileName + ".hpp", "a", encoding='utf8') as f:
        #parse classArray and append trader classes to file
        for item in classArray:
            f.write("	class " + classArray[index][0] + ((37 - len(classArray[index][0])) * " ") + "{ quality = " + str(classArray[index][1]) + "; price = " + str(classArray[index][2]) + "; sellPrice = " + str(classArray[index][2]) + "; };\n")
            index += 1




while True:
    #Create instance of tk mainwindow
    root = tk.Tk()
    #Withdrawn mainwindow
    root.withdraw()
    #Create an "Open file" dialog to get csv file
    file_path = filedialog.askopenfilename(initialdir=os.getcwd(), title="Select CSV File", filetypes=[("CSV FILES", "*.csv")])
    #Pass file (location) to be parsed
    classArray = parse_csv(file_path)
    #Pass set class details to be written
    export(classArray)