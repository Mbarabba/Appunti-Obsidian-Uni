/*VARIABLES
  Nomber of animals :
     hog_spr
     hog_aug
     cow_dry
     cow_pa
     cow_mi

  Production of hay (tons) :
     hay_apr
     hay_may
     hay_jun
     hay_jul
     hay_aug
     hay_sep
*/

/* OBJECTIVE: MAXIMIZE THE PROFIT */
max: 139 hog_spr + 88 hog_aug + 133 cow_dry + 137 cow_pa + 165 cow_mi;

/* LABOR HOURS RESTRICTIONS */
hjan: 1.4 hog_spr + 1.8 hog_aug + 1.5 cow_dry + 1.4 cow_pa + 1.4 cow_mi                <= 420;
hfev: 9.8 hog_spr + 2.4 hog_aug + 1.4 cow_dry + 1.4 cow_pa + 1.4 cow_mi                <= 415;
hmar: 4.0 hog_spr + 0.4 hog_aug + 1.4 cow_dry + 1.4 cow_pa + 1.4 cow_mi                <= 355;
hapr: 2.8 hog_spr + 0.6 hog_aug + 1.3 cow_dry + 1.4 cow_pa + 1.5 cow_mi + 5.5 hay_apr  <= 345;
hmay: 2.2 hog_spr + 0.4 hog_aug + 1.3 cow_dry + 1.5 cow_pa + 1.2 cow_mi + 5.5 hay_may  <= 160;
hjun: 2.2 hog_spr + 0.4 hog_aug + 1.3 cow_dry + 1.3 cow_pa + 1.2 cow_mi + 5.5 hay_jun  <= 95;
hjul: 2.2 hog_spr + 0.6 hog_aug + 1.3 cow_dry + 1.3 cow_pa + 1.2 cow_mi + 5.5 hay_jul  <= 380;
haug: 2.6 hog_spr + 5.8 hog_aug + 1.5 cow_dry + 1.5 cow_pa + 1.2 cow_mi + 5.5 hay_aug  <= 395;
hsep: 0.6 hog_spr + 4.0 hog_aug + 1.3 cow_dry                           + 5.5 hay_sep  <= 270;
hoct: 0.6 hog_spr + 1.2 hog_aug + 1.3 cow_dry + 1.3 cow_pa + 2.6 cow_mi                <= 230;
hnov: 0.6 hog_spr + 1.8 hog_aug + 1.2 cow_dry + 1.2 cow_pa + 1.2 cow_mi                <= 310;
hdec: 0.6 hog_spr + 1.8 hog_aug + 1.5 cow_dry + 1.4 cow_pa + 1.4 cow_mi                <= 420;

/* PASTURE CONSUMPTION RESTRICTIONS */
pastaprmay: 16 hog_spr + 12 cow_pa + 35 cow_mi + 50 hay_apr + 50 hay_may <= 5200;
pastjunjul: 20 hog_spr + 36 cow_pa + 50 cow_mi + 50 hay_jun + 50 hay_jul <= 5200;
pastaugsep: 16 hog_spr + 12 cow_pa + 35 cow_mi + 50 hay_aug + 50 hay_sep <= 3600;

/* HAY CONSUMPTION RESTRICTIONS */
dhay: 0.1 hog_aug + 0.9 cow_dry + 0.8 cow_pa + 2.3 cow_mi 
      -hay_apr - hay_may - hay_jun - hay_jul - hay_aug - hay_sep <= 0;

/* INTEGER RESTRICTIONS */
/*
int hog_spr, hog_aug, cow_dry, cow_pa, cow_mi;
*/