# MATLAB Numerical Methods Launcher

O aplicație MATLAB App Designer care oferă un **launcher** pentru 11 metode numerice, fiecare implementată ca un sub‑app interactiv.

## 📝 Descriere

Acest proiect include:
- **LauncherApp**: interfață principală (sertar) din care se pot deschide aplicații individuale:
  1. Gauss simplu  
  2. Gauss cu pivotare  
  3. Chio (condensare)  
  4. Doolittle (factorare LU)  
  5. Gauss-Seidel  
  6. Aproximări succesive  
  7. Newton tangent  
  8. Metoda celor trei puncte pentru integrale polygonale  
  9. Polinom de interpolare Newton  
  10. Krylov (polinom caracteristic)  
  11. Regula trapezoidală pentru integrale  

- **Fiecare sub‑app** are:
  - Input din tabele — noduri, coeficienți, condiții inițiale etc.
  - Butoane: *SetSize*/Setup, *Solve*, *Visualize*, *Info*, *Back*.
  - Grafice și tabele detaliate de progres (heatmap, evoluție pivot/eroare).
  - Mesaje *UIAlert* pentru rezultate și descrieri ale metodei.

## ✅ Cerințe

- MATLAB R2021a sau mai nou, cu App Designer.

## 🚀 Instalare și rulare

1. Descarcă acest repository (zip sau clonare Git):
   ```bash
   git clone https://github.com/PLOAE-DARIUS-ADONIS-IONUT/ProiectPractica
   cd ProiectPractica/NumericalLauncherApp
   ```
2. Adaugă calea în MATLAB:
   ```matlab
   addpath(genpath(pwd))
   savepath
   ```
3. În MATLAB Command Window, lansează:
   ```matlab
   LauncherApp
   ```

## 🎨 Interfața grafică

- Interfață unitară, cu design **dark** (opțional) și controale standard App Designer.
- Tabele pentru introducerea și afișarea datelor.
- UIAxes pentru grafice: heatmap, evoluție pivot/eroare, diagrame.
- Slider pentru navigarea pas-cu-pas în evoluție.
- Butoane back pentru revenire la launcher.

## ⚙️ Structura proiectului

```
/project
│
├─ LauncherApp.mlapp          % aplicația principală
├─ gauss.mlapp                % sub‑app Gauss simplu
├─ gaussPivotApp.mlapp        % Gauss cu pivotare
├─ chioApp.mlapp              % Chio condensation
├─ doolittleApp.mlapp         % Doolittle LU
├─ seidelApp.mlapp            % Gauss-Seidel
├─ succesiveAprox.mlapp       % Aproximări succesive
├─ newtonTangentApp.mlapp     % Newton tangent
├─ polygonIntegralApp.mlapp   % Integrare poligonală
├─ NewtonPolynomialApp.mlapp  % Interpolare Newton
├─ kyrlovApp.mlapp            % Krylov
├─ trapezoidrRuleIntegralsApp.mlapp
│
└─ README.md                  % acest fișier
```

## 🔧 Funcționalități

- **Selecție din dropdown** și **buton** *Deschide* pentru fiecare metodă.  
- **Comparare timpi** de execuție pentru toate metodele în Launcher.  
- **Back** pentru revenire la launcher din orice sub‑app.  
- **Info**: mesaje explicative despre fiecare metodă.  

## 📚 Tehnologii folosite

- **MATLAB App Designer** (UIAxes, UITable, uislider, uibutton)  
- **Funcții și script‑uri MATLAB** pentru algoritmi numerici.  
- **Message dialogs** (uialert) pentru feedback.

## 🔎 Exemple de utilizare

- Deschide `LauncherApp`, selectează *Polinom Interpolare Newton*, introdu noduri în tabel, apasă *Setup*, apoi *Solve* și *Visualize*.  
- Schimbă *z* pentru evaluarea polinomului și observă pas-cu-pas diferențele divizate și graficul polinomului.  

