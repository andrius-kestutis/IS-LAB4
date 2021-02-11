close all;
clear all;
clc;
%% raid?i¸ pavyzd?i¸ nuskaitymas ir po?ymi¸ skai?iavimas
%% read the image with hand-written characters
pavadinimas = 'apmokinimas3mini.jpg';
disp('mokinimosi paveiksliukas atidarytas');
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas,8);   
%%%%%%%%%%% ğalia atpaşinimo vaizdo reikia ávesti kiek eiluèiø raidşiø paveiksliuke yra
disp('mokinimosi paveikliukas atidarytas ir apsimokinta');

%% Atpa?intuvo k?rimas
%% Development of character recognizer
% po?ymiai i? celi¸ masyvo perkeliami ? matric?
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teising¸ atsakym¸ matrica: 11 raid?i¸, 8 eilut?s mokymui
% create the matrices of correct answers for each line (number of matrices
% = number of symbol lines)
% %%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%--5 eilutës po 8 raides-
T = [eye(8), eye(8), eye(8), eye(8), eye(8)];
% sukuriamas SBF tinklas duotiems P ir T s?ry?iams
% create an RBF network for classification with 13 neurons, and sigma = 1
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%tinklas = newrb(P,T,0,1,16);
tinklas = newrb(P,T,0,1,13);
% tinklas = newff(P,T,20);
% tinklas = train(tinklas,P,T);
%% Tinklo patikra | Test of the network (recognizer)
% skai?iuojamas tinklo i??jimas ne?inomiems po?ymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:22);
%%%%%%%%%++%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  poşymiu kiekis raid kiekis +1, buvo 12 vietos
%%%%%%%%%%%%++%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%  (raid kiekis +1)*2-1
Y2 = sim(tinklas, P2);
% ie?koma, kuriame i??jime gauta did?iausia reik?m?
% find which neural network output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
%% Visualize result
% apskai?iuosime raid?i¸ skai?i¸ - po?ymi¸ P2 stulpeli¸ skai?i¸
% calculate the total number of symbols in the row
raidziu_sk = size(P2,2);
% rezultat? saugosime kintamajame 'atsakymas'
% we will save the result in variable 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)% the symbol here should be the same as written first symbol in your image
        case 1  
            atsakymas = [atsakymas, 'A'];
        case 2  
            atsakymas = [atsakymas, 'B'];
        case 3  
            atsakymas = [atsakymas, 'C'];
        case 4  
            atsakymas = [atsakymas, 'D'];
        case 5  
            atsakymas = [atsakymas, 'E'];
        case 6  
            atsakymas = [atsakymas, 'F'];
        case 7  
            atsakymas = [atsakymas, 'G'];
        case 8  
            atsakymas = [atsakymas, 'H'];
%         case 9  
%             atsakymas = [atsakymas, 'I'];
%         case 10 
%             atsakymas = [atsakymas, 'J'];
%         case 11 
%             atsakymas = [atsakymas, 'K'];
%         case 12 
%             atsakymas = [atsakymas, 'L'];
%         case 13 
%             atsakymas = [atsakymas, 'M'];
%         case 14 
%             atsakymas = [atsakymas, 'N'];
%         case 15 
%             atsakymas = [atsakymas, 'O'];
%         case 16 
%             atsakymas = [atsakymas, 'P'];
%         case 17 
%             atsakymas = [atsakymas, 'Q'];
%         case 18 
%             atsakymas = [atsakymas, 'R'];
%         case 19 
%             atsakymas = [atsakymas, 'S'];
%         case 20 
%             atsakymas = [atsakymas, 'T'];
%         case 21 
%             atsakymas = [atsakymas, 'U'];
%         case 22 
%             atsakymas = [atsakymas, 'V'];
%         case 23 
%             atsakymas = [atsakymas, 'W'];
%         case 24 
%             atsakymas = [atsakymas, 'X'];
%         case 25 
%             atsakymas = [atsakymas, 'Y'];
%         case 26 
%             atsakymas = [atsakymas, 'Z'];
%             
            
            
            
    end
end
% pateikime rezultat? komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% ?od?io "KADA" po?ymi¸ i?skyrimas 
%% Extract features of the test image
%%%%%%
pavadinimas = 'pirmas3mini.jpg';%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% pirmas3.jpg TOTO
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%%% - ---èia iğ kurio failo atpaşinti reikia
disp('atidarome pirmà paveiksliukà atpaşinimui');
%%
%% Raid?i¸ atpa?inimas
%% Perform letter/symbol recognition
% po?ymiai i? celi¸ masyvo perkeliami ? matric?
% features from cell-variable are stored to matrix-variable
P2 = cell2mat(pozymiai_patikrai);
% skai?iuojamas tinklo i??jimas ne?inomiems po?ymiams
% estimating neuran network output for newly estimated features
Y2 = sim(tinklas, P2);
% ie?koma, kuriame i??jime gauta did?iausia reik?m?
% searching which output gives maximum value
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas | Visualization of result
% apskai?iuosime raid?i¸ skai?i¸ - po?ymi¸ P2 stulpeli¸ skai?i¸
% calculating number of symbols - number of columns
raidziu_sk = size(P2,2);
% rezultat? saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1  
            atsakymas = [atsakymas, 'A'];
        case 2  
            atsakymas = [atsakymas, 'B'];
        case 3  
            atsakymas = [atsakymas, 'C'];
        case 4  
            atsakymas = [atsakymas, 'D'];
        case 5  
            atsakymas = [atsakymas, 'E'];
        case 6  
            atsakymas = [atsakymas, 'F'];
        case 7  
            atsakymas = [atsakymas, 'G'];
        case 8  
            atsakymas = [atsakymas, 'H'];
%         case 9  
%             atsakymas = [atsakymas, 'I'];
%         case 10 
%             atsakymas = [atsakymas, 'J'];
%         case 11 
%             atsakymas = [atsakymas, 'K'];
%         case 12 
%             atsakymas = [atsakymas, 'L'];
%         case 13 
%             atsakymas = [atsakymas, 'M'];
%         case 14 
%             atsakymas = [atsakymas, 'N'];
%         case 15 
%             atsakymas = [atsakymas, 'O'];
%         case 16 
%             atsakymas = [atsakymas, 'P'];
%         case 17 
%             atsakymas = [atsakymas, 'Q'];
%         case 18 
%             atsakymas = [atsakymas, 'R'];
%         case 19 
%             atsakymas = [atsakymas, 'S'];
%         case 20 
%             atsakymas = [atsakymas, 'T'];
%         case 21 
%             atsakymas = [atsakymas, 'U'];
%         case 22 
%             atsakymas = [atsakymas, 'V'];
%         case 23 
%             atsakymas = [atsakymas, 'W'];
%         case 24 
%             atsakymas = [atsakymas, 'X'];
%         case 25 
%             atsakymas = [atsakymas, 'Y'];
%         case 26 
%             atsakymas = [atsakymas, 'Z'];
            

    end
end
% pateikime rezultat? komandiniame lange
 disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
%% ?od?io "FIKCIJA" po?ymi¸ i?skyrimas 
%% extract features for next/another test image
pavadinimas = 'antras3mini.jpg';   %%%%%%%%%%%%%%%%%%%%%%%%%%% antras.jpg AHA
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);
disp('atidarome antrà paveiksliukà atpaşinimui');
%% Raid?i¸ atpa?inimas
% po?ymiai i? celi¸ masyvo perkeliami ? matric?
P2 = cell2mat(pozymiai_patikrai);
% skai?iuojamas tinklo i??jimas ne?inomiems po?ymiams
Y2 = sim(tinklas, P2);
% ie?koma, kuriame i??jime gauta did?iausia reik?m?
[a2, b2] = max(Y2);
%% Rezultato atvaizdavimas
% apskai?iuosime raid?i¸ skai?i¸ - po?ymi¸ P2 stulpeli¸ skai?i¸
raidziu_sk = size(P2,2);
% rezultat? saugosime kintamajame 'atsakymas'
atsakymas = [];
for k = 1:raidziu_sk
    switch b2(k)
        case 1  
            atsakymas = [atsakymas, 'A'];
        case 2  
            atsakymas = [atsakymas, 'B'];
        case 3  
            atsakymas = [atsakymas, 'C'];
        case 4  
            atsakymas = [atsakymas, 'D'];
        case 5  
            atsakymas = [atsakymas, 'E'];
        case 6  
            atsakymas = [atsakymas, 'F'];
        case 7  
            atsakymas = [atsakymas, 'G'];
        case 8  
            atsakymas = [atsakymas, 'H'];
%         case 9  
%             atsakymas = [atsakymas, 'I'];
%         case 10 
%             atsakymas = [atsakymas, 'J'];
%         case 11 
%             atsakymas = [atsakymas, 'K'];
%         case 12 
%             atsakymas = [atsakymas, 'L'];
%         case 13 
%             atsakymas = [atsakymas, 'M'];
%         case 14 
%             atsakymas = [atsakymas, 'N'];
%         case 15 
%             atsakymas = [atsakymas, 'O'];
%         case 16 
%             atsakymas = [atsakymas, 'P'];
%         case 17 
%             atsakymas = [atsakymas, 'Q'];
%         case 18 
%             atsakymas = [atsakymas, 'R'];
%         case 19 
%             atsakymas = [atsakymas, 'S'];
%         case 20 
%             atsakymas = [atsakymas, 'T'];
%         case 21 
%             atsakymas = [atsakymas, 'U'];
%         case 22 
%             atsakymas = [atsakymas, 'V'];
%         case 23 
%             atsakymas = [atsakymas, 'W'];
%         case 24 
%             atsakymas = [atsakymas, 'X'];
%         case 25 
%             atsakymas = [atsakymas, 'Y'];
%         case 26 
%             atsakymas = [atsakymas, 'Z'];
%             

    end
end
% pateikime rezultat? komandiniame lange
 disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off