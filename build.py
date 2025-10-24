import subprocess
import os

class build:
    def questions(self):
        print("******************************")
        print("*********TUXOS BUILDER********")
        print("******************************")
        print("")
        print("1- Start Build")
        print("2- Generate ISO")
        print("4- Post Create Scripts")
        print("0- EXIT")
        self.option = int(input())
    
    def main(self):
        if(self.option == 1):
            out = subprocess.run(["bash", ])

build.createinterface