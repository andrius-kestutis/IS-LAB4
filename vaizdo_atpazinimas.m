close all;
clear all;
clc;
%% raid?i¸ pavyzd?i¸ nuskaitymas ir po?ymi¸ skai?iavimas
%% read the image with hand-written characters
pavadinimas = 'train_data.jpg';
pozymiai_tinklo_mokymui = pozymiai_raidems_atpazinti(pavadinimas, 8);   
%%%%%%%%%%% ðalia atpaþinimo vaizdo reikia ávesti kiek eiluèiø raidþiø paveiksliuke yra
%% Atpa?intuvo k?rimas
%% Development of character recognizer
% po?ymiai i? celi¸ masyvo perkeliami ? matric?
% take the features from cell-type variable and save into a matrix-type variable
P = cell2mat(pozymiai_tinklo_mokymui);
% sukuriama teising¸ atsakym¸ matrica: 11 raid?i¸, 8 eilut?s mokymui
% create the matrices of correct answers for each line (number of matrices = number of symbol lines)
T = [eye(8), eye(8), eye(8), eye(8), eye(8), eye(8), eye(8)];
% sukuriamas SBF tinklas duotiems P ir T s?ry?iams
% create an RBF network for classification with 13 neurons, and sigma = 1
tinklas = newrb(P,T,0,1,16);
% tinklas = newff(P,T,20);
% tinklas = train(tinklas,P,T);
%% Tinklo patikra | Test of the network (recognizer)
% skai?iuojamas tinklo i??jimas ne?inomiems po?ymiams
% estimate output of the network for unknown symbols (row, that were not used during training)
P2 = P(:,12:22);
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
    switch b2(k)
        case 1
            % the symbol here should be the same as written first symbol in your image
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
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'Q'];
    end
end
% pateikime rezultat? komandiniame lange
% show the result in command window
disp(atsakymas)
% % figure(7), text(0.1,0.5,atsakymas,'FontSize',38)
%% ?od?io "KADA" po?ymi¸ i?skyrimas 
%% Extract features of the test image
pavadinimas = 'pav2.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

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
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'Q'];
    end
end
% pateikime rezultat? komandiniame lange
 disp(atsakymas)
figure(8), text(0.1,0.5,atsakymas,'FontSize',38), axis off
%% ?od?io "FIKCIJA" po?ymi¸ i?skyrimas 
%% extract features for next/another test image
pavadinimas = 'pav.jpg';
pozymiai_patikrai = pozymiai_raidems_atpazinti(pavadinimas, 1);

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
            atsakymas = [atsakymas, 'T'];
        case 8
            atsakymas = [atsakymas, 'Q'];
    end
end
% pateikime rezultat? komandiniame lange
 disp(atsakymas)
figure(9), text(0.1,0.5,atsakymas,'FontSize',38), axis off