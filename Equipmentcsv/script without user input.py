import os
import tkinter as tk
from tkinter import filedialog

#Take csv input to get items
def parse_csv(csvinput):
    #Create array to pass items
    #[[name,quality,price],[secondline,,],[thirdline,,],...]
    Binocular = []
    CommonItem = []
    glasses = []
    HeadGear = []
    MuzzleAttachment = []
    NVGoggles = []
    OpticAttachment = []
    SideAttachment = []
    Uniform = []
    Vest = []
    #open passed csv
    with open(csvinput, "r", encoding='utf8') as f:
        #Iterate through each line in csv
        for line in f:
            #Split csv via seperator
            lineArray = line.split(';')

            classname = lineArray[2]
            print(str(len(lineArray)))
            try:
                if (lineArray[5] != "N/A"):
                    classname += " " + lineArray[5]
            except IndexError: continue

            if (lineArray[1] == "Binocular"):
                Binocular.append([classname,"binocularQuality","binocularPrice"])
            if (lineArray[1] == "CommonItem"):
                Binocular.append([classname,"commonItemQuality","commonItemPrice"])
            if (lineArray[1] == "glasses"):
                Binocular.append([classname,"glassesQuality","glassesPrice"])
            if (lineArray[1] == "HeadGear"):
                Binocular.append([classname,"headGearQuality","headGearPrice"])
            if (lineArray[1] == "MuzzleAttachment"):
                Binocular.append([classname,"muzzleAttachmentQuality","muzzleAttachmentPrice"])
            if (lineArray[1] == "NVGoggles"):
                Binocular.append([classname,"nvGogglesQuality","nvGogglesPrice"])
            if (lineArray[1] == "OpticAttachment"):
                Binocular.append([classname,"opticAttachmentQuality","opticAttachmentPrice"])
            if (lineArray[1] == "SideAttachment"):
                Binocular.append([classname,"sideAttachmentQuality","sideAttachmentPrice"])
            if (lineArray[1] == "Uniform"):
                Binocular.append([classname,"uniformQuality","uniformPrice"])
            if (lineArray[1] == "Vest"):
                Binocular.append([classname,"vestQuality","vestPrice"])

        #Return all items
        return [Binocular,CommonItem,glasses,HeadGear,MuzzleAttachment,NVGoggles,OpticAttachment,SideAttachment,Uniform,Vest]


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