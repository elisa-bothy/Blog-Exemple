/* 
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/JSP_Servlet/JavaScript.js to edit this template
 */
/* global fetch */

let heure; let date;
const saintsAvecSexe = [];

function FetchSaints() {
    const uri2 = "https://nominis.cef.fr/json/nominis.php";
    fetch(uri2)
            .then(resp => {
                if (resp.ok) {
                    return resp.json();
                } else {
                    throw new Error("Données non collectées");
                }
            })
            .then(obj => {
                /* les saints */
                const prenomsMajeurs = obj.response.prenoms.majeurs;

                if (prenomsMajeurs) {
                    const nomsPrenomsMajeurs = Object.keys(prenomsMajeurs);
                    nomsPrenomsMajeurs.forEach(nom => {
                        const saint = prenomsMajeurs[nom];
                        const sexe = saint.sexe;
                        saintsAvecSexe.push({nom, sexe});
                    });
                    const pSaint1 = document.getElementById("p-saint1");
                    const pSaint2 = document.getElementById("p-saint2");
                    const saint1 = document.getElementById("saint1");
                    const saint2 = document.getElementById("saint2");

                    if (!nomsPrenomsMajeurs[0]) {
                        pSaint1.remove();
                        saint1.remove();
                        pSaint2.remove();
                        saint2.remove();
                    }

                    if (!nomsPrenomsMajeurs[1]) {
                        pSaint1.innerHTML = `${saintsAvecSexe[0].nom}`;
                        pSaint2.remove();
                        saint2.remove();

                        if (saintsAvecSexe[0].sexe === "féminin") {
                            saint1.src = "../assets/photos/icons8-angel-100.png";
                            saint1.alt = "Un ange pour représenter le saint féminin du jour";
                        } else {
                            saint1.src = "../assets/photos/icons8-halo-100.png";
                            saint1.alt = "Une auréole pour représenter le saint masculin du jour";
                        }
                    }

                    if (nomsPrenomsMajeurs[1]) {
                        pSaint1.innerHTML = `${saintsAvecSexe[0].nom}`;
                        pSaint2.innerHTML = `${saintsAvecSexe[1].nom}`;


                        if (saintsAvecSexe[0].sexe === "féminin") {
                            saint1.src = "../assets/photos/icons8-angel-100.png";
                            saint1.alt = "Un ange pour représenter le saint féminin du jour";
                        } else {
                            saint1.src = "../assets/photos/icons8-halo-100.png";
                            saint1.alt = "Une auréole pour représenter le saint masculin du jour";
                        }
                        if (saintsAvecSexe[1].sexe === "féminin") {
                            saint2.src = "../assets/photos/icons8-angel-100.png";
                            saint2.alt = "Un ange pour représenter le saint féminin du jour";
                        } else {
                            saint2.src = "../assets/photos/icons8-halo-100.png";
                            saint2.alt = "Une auréole pour représenter le saint masculin du jour";
                        }
                    }
                } else {
                    console.error("La liste des prénoms majeurs est undefined.");
                }
            })
            .catch(err => {
                console.error(err);
            });
}

function InfoVille() {
    let uri = "https://www.prevision-meteo.ch/services/json/toulouse";

    fetch(uri)
            .then(resp => {
                if (resp.ok) {
                    return resp.json();
                } else {
                    throw new Error("Données non collectées");
                }
            })
            .then(obj => {
                const pSunrise = document.getElementById("p-sunrise");
                const pSunset = document.getElementById("p-sunset");
                pSunrise.innerHTML = `${obj.city_info.sunrise}`;
                pSunset.innerHTML = `${obj.city_info.sunset}`;

                setInterval(function () {
                    let heure1 = new Date();

                    function twoDigit(n) {
                        return (n < 10) ? '0' + n : n;
                    }
                    
                    const semaine = [
                        "Lundi", "Mardi", "Mercredi", 
                        "Jeudi", "Vendredi", "Samedi", "Dimanche"
                    ];
                    
                    let day = heure1.getDay();
                    let d = heure1.getDate();
                    d = twoDigit(d);
                    let m = heure1.getMonth();
                    m = twoDigit(m);
                    let y = heure1.getFullYear();
                    y = twoDigit(y);
                    let h = heure1.getHours();
                    h = twoDigit(h);
                    let minute = heure1.getMinutes();
                    minute = twoDigit(minute);
                    let seconde = heure1.getSeconds();
                    seconde = twoDigit(seconde);

                    heure = `${h}:${minute}:${seconde}`;
                    date = `Le ${semaine[day]} ${d} ${m} ${y}`;
                    const pHeure = document.getElementById("heure");
                    const pDate = document.getElementById("date");
                    pHeure.innerHTML = `${heure}`;
                    pDate.innerHTML = `${date}`;
                }, 1000);
            })
            .catch(err => {
                console.error(err);
            });
}

window.addEventListener('load', () => {
    FetchSaints();
    InfoVille();
});
     