import os
import tkinter as tk
from tkinter import filedialog

#Take csv input to get items
def parse_csv(csvinput):
    #Create array to pass items
    #[[name,quality,price],[secondline,,],[thirdline,,],...]
    gLauncherArray = []
    launcherArray = []
    primaryArray = []
    secondaryArray = []
    gMagazineArray = []
    magazineArray = []
    #open passed csv
    with open(csvinput, "r", encoding='utf8') as f:
        #Iterate through each line in csv
        for line in f:
            #Split csv via seperator
            lineArray = line.split(';')
            #Other launchers
            if (lineArray[1] == "Launcher"):
                if (lineArray[2].split('_')[-1] == "secondary"):
                    continue
                launcherArray.append([lineArray[2],"launcherQuality","launcherPrice"])
            #Primary weapons
            elif (lineArray[1] == "PrimaryWeapon"):
                primaryArray.append([lineArray[2],"primaryWeaponQuality","primaryWeaponPrice"])
            #Secondary weapons
            elif (lineArray[1] == "SecondaryWeapon"):
                secondaryArray.append([lineArray[2],"secondaryWeaponQuality","secondaryWeaponPrice"])
            #Ammunition
            elif (lineArray[1] == "magazine" and "grenade" in lineArray[2].split('_')):
                gMagazineArray.append([lineArray[2],"grenadeMagQuality","grenadeMagPrice"])
            elif (lineArray[1] == "magazine"):
                magazineArray.append([lineArray[2],"magazineQuality","magazinePrice"])
        #Return all items
        return [launcherArray,primaryArray,secondaryArray,gMagazineArray,magazineArray]


def export(classMatrix):
    #Keep indexes while looping
    subIndex = 0
    index = 0
    #Get user input for export name
    fileName = input("Enter export file title: ")
    #Open file with append
    with open(fileName + ".hpp", "a", encoding='utf8') as f:
        #parse classMatrix and append trader classes to file
        for x in classMatrix:
            for item in x:
                print(str(index))
                print(str(len(classMatrix)))
                classFa = "	class " + classMatrix[index][subIndex][0]
                classFb = ((67 - len(classMatrix[index][subIndex][0])) * " ")
                qualityField = "{ quality = " + str(classMatrix[index][subIndex][1])
                priceField = "; price = " + classMatrix[index][subIndex][2] + "; };\n"

                print(classFa + classFb + qualityField + priceField)
                f.write(classFa + classFb + qualityField + priceField)
                subIndex += 1
            subIndex = 0
            index += 1

    #  classMatrix:
    #    [ [[grenadeLauncher1,,],],[[launcher1,,],],[[primary1,,],],[etc] ]


while True:
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
    classMatrix = parse_csv(file_path)
    #Pass set class details to be written
    export(classMatrix)