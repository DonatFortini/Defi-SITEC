import numpy as np
import math

tab=np.loadtxt("resaux.txt")
fp=open("resaux.txt","r")
sommets=fp.readline()[1:].split()
fp.close()

def acceptable(chemin,nkm,ei,e):
    global tab,nkm_min,Pcc
    if e in chemin or tab[ei,e]==0 or (nkm+tab[ei,e])>nkm_min:
        return False
    return True


Pcc=[]
nkm_min=math.inf
depart=0
arrive=5
chemin=[]
chemin.append(depart)
nkm=0

def pcchemin(chemin,nkm,ei):
    global Pcc,nkm_min,tab
    if ei==arrive:
        if nkm<nkm_min:
            nkm_min=nkm;Pcc=chemin.copy()
            return 
    for e in range(len(tab)):
        if acceptable(chemin,nkm,ei,e):
            chemin.append(e);nkm+=tab[ei,e]
            pcchemin(chemin,nkm,e)
            del chemin[-1];nkm-=tab[ei,e]


print(pcchemin(chemin,nkm,0))
chemin_nom=[sommets[x] for x in Pcc]
print(chemin_nom)


