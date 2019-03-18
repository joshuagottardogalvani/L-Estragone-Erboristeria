<%@ page language="java" contentType="text/html; charset=US-ASCII" pageEncoding="US-ASCII"%>
<%@ page import = "java.io.*, java.util.*, java.sql.*" %>
<!DOCTYPE html>
<html lang="en">

<head>
    <title>L'Estragone Erboristeria</title>

    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <meta http-equiv="X-UA-Compatible" content="ie=edge">

    <!--font-->
    <link href="https://fonts.googleapis.com/css?family=Montserrat:100,200,300,400,400i,500,500i,700,700i,800,900"
        rel="stylesheet">

    <!--Bootstrap-->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>

    <!--CSS-->
    <link rel="stylesheet" href="https://unpkg.com/aos@next/dist/aos.css" />
    <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.7.2/css/all.css"
        integrity="sha384-fnmOCqbTlWIlj8LyTjo7mOUStjsKC4pOpQbqyi7RrhN7udi9RwhKkMHpvLbHG9Sr" crossorigin="anonymous">
    <link rel="stylesheet" href="css/prodotti.css" type="text/css">
</head>

<body>
    <header>
        <ul>
            <li><span class="sezioni"><a href="index.html">HOME</a></span></li>
            <li><span class="sezioni"><a href="chi-siamo.html">CHI SIAMO</a></span></li>
            <li><span class="sezioni"><a href="prodotti.jsp">PRODOTTI</a></span></li>
            <li><span class="sezioni"><a href="servizi.html">SERVIZI</a></span></li>
        </ul>
    </header>
    <div id="myNav" class="overlay">
        <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
        <div class="overlay-content">
            <a href="index.html">HOME</a>
            <a href="chi-siamo.html">CHI SIAMO</a>
            <a href="prodotti.jsp">PRODOTTI</a>
            <a href="servizi.html">SERVIZI</a>
        </div>
    </div>
    <span class="nav" style="font-size:30px;cursor:pointer" onclick="openNav()"><i
            class="fas fa-bars menu-opener"></i></span>
    <div class="sfondo-header">
        <div class="tit-prodotti">PRODOTTI</div>
    </div>
    <div class="spacer"></div>
    <div class="container-prodotti">

        <%
        String username="bisso01_bisso01";
        String password="massola";
        String dbName="bisso01_Estragone";
        String dbHost="mysql3000.mochahost.com";
    
        try {
            Class.forName("com.mysql.jdbc.Driver");
        } catch(ClassNotFoundException msg) {
            out.println("Error loading driver:" + msg.getMessage());
        }
        
        String url = "jdbc:mysql://" + dbHost + ":3306/" + dbName;
        
        try {
            Connection Conn = DriverManager.getConnection(url,username, password);
            String sqlCanzone = "";
            Statement stmtCanzone = Conn.createStatement();
            sqlCanzone = "SELECT NomeProdotto, PrezzoProdotto, URLImmagineProdotto, URLImmagine2Prodotto, URLImmagine3Prodotto, URLImmagine4Prodotto FROM Prodotto ;";
            ResultSet rsCanzone = stmtCanzone.executeQuery(sqlCanzone);

            while(rsCanzone.next()){
                String nome = rsCanzone.getString("NomeProdotto");
                double prezzo = rsCanzone.getDouble("PrezzoProdotto");
                String text = Double.toString(Math.abs(prezzo));
                int integerPlaces = text.indexOf('.');
                int decimalPlaces = text.length() - integerPlaces - 1;
                String url1 = rsCanzone.getString("URLImmagineProdotto");
                %>

        <div class="prodotto">
            <div class="fake-image" style="background-image:url(<%= url1 %>)">
                <div class="prezzo">
                    &euro;<% if(decimalPlaces == 1) { out.println(prezzo + "0"); } else { out.println(prezzo); } %>
                </div>
            </div>
            <h3><%= nome %></h3>
        </div>

        <% }

            rsCanzone.close();
            Conn.close();

        } catch (SQLException e) {
            String err1Msg = e.getMessage();
            out.println(err1Msg);
        } %>
    </div>

    <div class="tit-2">
        <h1>E QUESTO NON E' TUTTO!</h1>
        <h4>Questi prodotti sono solo un assaggio della nostra vasta collezione. <br> Vieni a trovarci e saremo felici di
            servirti!</h4>
    </div>

    <footer>
        <div class="logo-catena">
            <img src="img/isola_verde.PNG" alt="Isola Verde" class="logo-isola-verde">
            <div class="ragione-sociale">L'Estragone Erboristeria Centro Medico-Estetico</div>
        </div>
        <div class="contatti">
            <div><a href="tel:0299043531"><i class="fas fa-phone fa-2x"></i><span>02 9904 3531</span></a><a
                    target="__blank"
                    href="https://www.facebook.com/pages/category/Medical-Equipment-Supplier/Lestragone-Erboristeria-Centro-Medico-Estetico-512725545762007/"><i
                        class="fab fa-facebook-square fa-2x icon-social"></i></a></div>
            <div><a
                    href="https://www.google.com/maps/dir//Centro+Commerciale+Brianza,+Via+Strada+Statale+35+dei+Giovi,+20037+Paderno+Dugnano+MI/@45.5745582,9.1777924,17z/data=!4m8!4m7!1m0!1m5!1m1!1s0x4786befdc78b0045:0x9279604ad7936b0b!2m2!1d9.1799811!2d45.5745545"><i
                        class="fas fa-map-pin fa-2x"></i><span>Centro Commerciale Brianza, Via Strada Statale 35 dei
                        Giovi, Paderno Dugnano, Milano</span></a></div>
        </div>
        <div class="mappa">
            <iframe
                src="https://www.google.com/maps/embed?pb=!1m14!1m8!1m3!1d1396.401782431951!2d9.1802515!3d45.5743887!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x4786befdc78b0045%3A0x9279604ad7936b0b!2sCentro+Commerciale+Brianza!5e0!3m2!1sit!2sit!4v1550575211624"
                frameborder="0" style="border:0" allowfullscreen></iframe>
        </div>
    </footer>
    <script src="https://unpkg.com/aos@2.3.1/dist/aos.js"></script>
    <script>
        AOS.init({
            duration: 1200,
            once: true
        })
    </script>
</body>

</html>