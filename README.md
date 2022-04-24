<p align= "center">
<img src = "https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/assets/icons/icon.png?raw=true" height="200"> 
</p>

---

<p align= "center">  
<b>Smart Chalet</b> è progetto realizzato in <b>Flutter</b> e <b>Spring-Boot</b> per il corso di laurea <b>L-31</b> presso <b>Università di Camerino</b>, nell’anno accademico <b>2020/2021</b>, dagli studenti <b>Vlad Dogariu</b> e <b>Pagan Denise</b> per gli esami di <b>Ingegneria del Software</b> e <b>Progettazione di Applicazioni Web e Mobili</b> seguendo i canoni di sviluppo proposti.
</p>
<br>

# Contenuti
1. [Panoramica e funzionalità di base](#panoramica) 
2. [Tecnologie utilizzate durante lo sviluppo](#tecnologie)
3. [Gli utenti](#utenti)
4. [Iterazioni](#iterazioni)
5. [Autori](#autori)

<br>
Reading Time: 5 min
<br><br>







# Panoramica e funzionalità di base <a name = "panoramica" > </a>
Lo scopo dell’applicativo proposto è quello di realizzare un'applicazione che permetta la completa gestione di una spiaggia con il suo relativo servizio bar.
I ruoli ricoperti dagli utenti nell’applicativo sono : <i>Cliente</i> , <i>Gestore</i> , <i>Personale Accoglienza</i> , <i>Animatore</i>  e <i>Bar Staff</i> . <br>
Ogni utente, in base al ruolo con cui si è registrato, visualizzerà una schermata personalizzata e potrà compiere azioni diverse.  <br><br>

Il  <b>Cliente</b>, una volta autenticato potrà prenotare un ombrellone o eventualmente modificare una prenotazione già effettuata. Una volta avuta la conferma della prenotazione, potrà usufruire del servizio bar incluso nell'applicazione grazie al quale selezionerà i prodotti desiderati tra quelli disponibili. <br>
Ogni prenotazione ha una data, un numero di obrelloni ed infine di due identificativi: uno per il cliente e uno che identifica la prenotazione stessa. <br>
La non autenticazione da parte dell'utente garantirà comunque dei servizi quali: la visualizzazione dello stato della spiaggia e la lista dei prodotti disponibili per il servizio bar.  <br>

Il <b>Gestore</b> tramite l'applicazione potrà prendere decisioni sulla gestione della spiaggia e del bar. In particolar modo potrà modificare il numero posti, modificare il tariffario, gestire quelle che sono le attività offerte dagli animatori e i prodotti disponibili per il servizio bar, nonchè effettuare o modificare una prenotazione al posto del cliente.  <br>
Così come il gestore, il <b>Personale d'Accoglienza</b> ha la possibilità di aggiungere una prenotazione o modificarla.  <br>

L'<b>Animatore</b>, invece, potrà aggiungere un'attività, impostando il nome dell'attività stessa, l'orario e il numero massimo dei partecipati. Tali attività potranno essere prenotate dal cliente sempre dopo l'avvenuta autenticazione e prenotazione dell'ombrellone.  <br>

Infine, lo <b>Staff del Bar </b>, tramite l'applicazione, riceverà gli ordini dai clienti.
Ogni ordine è associato ad un ombrellone tramite un Qr, che verrà chiesto al cliente di scansionare tramite il proprio telefono al momento dell'invio dell'ordine.  <br>

Al cliente, inoltre, viene data l'opportunità di recensire la spiaggia ed i suoi servizi. <br><br>

# Tecnologie utilizzate durante lo Sviluppo <a name = "tecnologie" > </a>

Il lato <b>Frontend</b> è stato sviluppato mediante il framework <b>Open Source Flutter</b> e il suo relativo linguaggio <b>Dart</b>, un liguaggio, che permette di sviluppare un'applicazione Cross-Platform, al fine di avere un software Single-CodeBase che sia fruibile su <b>iOS</b>, <b>Android</b> e <b>Web</b>. <br>

È stato scelto come State Management <b>Cubit</b>, un sottoinsieme della famosa implementazione del BLoC Pattern, grazie alla qualle è stato possibile suddividere le le varie aree in classi guidate da stati, permettendo una facile navigazione tra di esse e una struttura facilmente comprensibile.
Il Pattern Cubit è costituito da molte funzionalità dei pattern BLoC e Provider, pertanto è una combinazione dei due pacchetti in cui ci si libera dagli eventi e si fa affidamento sui metodi, mantenendo 
una incredibile facilità di gestione. <br> 

Il lato <b>Backend</b> del sistema è stato sviluppato in <b>Java</b> con il supporto del framework <b>Spring-Boot</b> a cui è stato affrontato il compito di gestire le <b>Rest API</b>.<br> <br>

Per <b>la persistenza dei dati</b> ci si è affidati al database non relazionale <b>MongoDB</b>

Infine per il lato sicurezza abbimo  implementato lo standard dei <b>JWT</b> (JSON Web Token). <br>

Nella cartella [Documentazione](https://github.com/thevladdo/Smart_Chalet/tree/main/Documentation) si possono osservare i modelli sviluppati e come si è proceduto durante le varie iterazioni del processo.
<br><br>

#  Gli utenti  <a name = "utenti" > </a>
Come detto in precedenza ogni utente avrà un ruolo con il quale potra effettuare le proprie operazioni. <br>
Qui sotto vengono riportate come esempio alcune schermate che si differenziano sulla base dell'avenuta/mancata autenticazione. <br>

<p align="center">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/welcome.png?raw=true" height="400">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/register.png?raw=true" height="400">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/about_us.png?raw=true" height="400">
</p>


<p align="center">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/login.png?raw=true" height="400">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/discover.png?raw=true" height="400">
<img src="https://github.com/thevladdo/Smart_Chalet/blob/develop/Frontend/smart_chalet/app_screenshots/beach_details.png?raw=true" height="400">
</p>



#  Iterazioni  <a name = "iterazioni" > </a>

Il progetto è stato implementato con 5 interazioni, della durata massima di 3 settimane, rispettando gli standard dell'Unified Process 
e l'utilizzo di Design Pattern. <br><br>
Nella prima iterazione, la fare di avvio, si è discusso dei possibili attori che potessero partecipare e quindi usufruire dell'applicazione,
attraverso la partecipazione a differenti workshop e brainstorming individuali e di gruppo. <br>

Una volta identificati tutti gli attori, nelle successive iterzaioni si è proceduto ad identificare i casi d'uso ad essi corellati, fino ad arrivare alla IV iterazione con il 90% dei casi d'uso sviluppati.<br>

La III e IV iterazione si sono focalizzate sull'implementazione del codice e progettazione di tutto il sistema. In paricolar modo nella IV iterazione sono stati prefezionate alcune funzionalità ritenute più importanti, 
come l'autenticazione e il fattore sicurezza, essendo così guidati dal rischio. <br>

Alla fine della progettazione è stata aggiunta un'iterazione extra dedicata alla fase di testing. Per la fase di testing, oltre a svariati Unit Test, è stato utilizzato il software <b>Postaman</b>, una piattaforma API per gli sviluppatori per progettare, creare, testare e iterare le API. <br>
Grazie ad esso è stato possibile replicare le chiamate e verificarne la correttezza <br>

Alla fase di testing è seguita poi l'implementazione del frontend.<br><br>


# Autori <a name = "autori" > </a>
* [Vlad Dogariu](https://github.com/thevladdo)
* [Denise Pagan](https://github.com/Deddhy)