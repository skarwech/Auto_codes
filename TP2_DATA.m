clear all; clc; clf; close all;

th = arx2th([1 -1.5 0.7],[0 1 0.5],1,1);  %le modele ARX

u = idinput(255,'prbs'); % la SBPA

figure,plot(u),title('SBPA'); %la forme du SBPA

y = idsim(th,u); %simuler la reponse de systeme avec une entree SBPA

figure,plot(y),title('la sortie (SBPA)'); %visualiser la reponse (SBPA)

rir = impulse(th); %la reponse impulsionnelle du sys

figure,plot([0:length(rir)-1],rir),title('la reponse impulsionnelle'); %visualiser la reponse (impul)

U=u;
Y=y;
F = [Y U];
save('DATA','U','Y','rir'); %enregistrer les donnees U,Y et rire dans DATA.maT


