<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "Paquete.Conectandonos"%>
<%@page import = "java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Registros de los estudiantes</title>                                                 <!Título>
</head>
<body background = "https://www.enter.co/wp-content/uploads/2021/02/4401280-768x432.jpg">

    <!Encabezado>

<header>
    <div id="fondoheader"> 
        <a href="index.html"> </a>
        <h1 class="inicio">Paginación</h1>
        <h2 class="textocentro">Parcial I</h2>
        <h3>Bogotá,Colombia</h3>
    </div>
</header>

<!--Parte CSS para los estilos-->

<style type="text/css">                                                                         
    .inicio{
        color: #fff;
        width: 300px;
        height: 35px;
        margin: auto;
        margin-bottom: 30px;
        text-align: center;

    }
    .textocentro{
        color: #fff;
        width: 90px;
        height: 30px;
        margin: auto;
        margin-bottom: 30px;

    }
    #fondoheader{
        width: 100%;
        height: 150px;
        margin: auto;
        background-image: url(https://concepto.de/wp-content/uploads/2018/09/lenguaje-de-programaci%C3%B3n-e1537466894547.jpg);
        background-repeat: no-repeat;
        background-size: cover;

    }
    h3{
        color: #fff;
        width: 150px;
        height: 30px; 
        margin: auto;
    }
    div{
        align: center; 
        margin: auto;
    }
    .numeracion{
        margin-top: 40px;
        width: 1200px;
        height: 30px;
        text-align: center;
        font-size: 30px;
        border: none;
    }

    .tabla{
        font-size: 30px;
    }

    .saludo{
        background-color: rgba(255,255,255,.5);
        height: 5vw;
        width: 30vw;
        margin-left: 35%;
    }

</style>

<!Recibe el código de la página>

<% 
String codRecibido = request.getParameter("codigo");
%>

<!Títulos después del encabezado>

<h1 class="saludo" align = center >Registros de los estudiantes de la universidad</h1>
<h1 align = center>Página #<%=codRecibido%></h1>

<!Tabla y lógica>

<div align = center >
    <p class="tabla">
        <% 
            Conectandonos objConsulta = new Conectandonos();
            String respuesta = objConsulta.contar();
                
            int numeroRegistroPorPagina =  5;
            int  paginaActual = 0;
            int numeroRegistro = Integer.parseInt(respuesta.trim());                    //El numero total de registros 
            int numeroPaginaWeb = numeroRegistro/numeroRegistroPorPagina;               //El numero total de paginas web 
            int temporal = numeroPaginaWeb*numeroRegistroPorPagina; 
                
           if(temporal!=numeroRegistro){                                           //si el resto es diferente del numero de registro original 
                numeroPaginaWeb++;                                                  //se incrementa el numero de la pagina web
            }
            if(codRecibido != null){
            paginaActual = Integer.parseInt(codRecibido.trim());
            int maximo = paginaActual*numeroRegistroPorPagina;              //se encuentra el maximo 
            int minimo = maximo-numeroRegistroPorPagina+1;                  //se encuentra el minimo 
            
            if(numeroPaginaWeb==paginaActual){
                maximo = numeroRegistro;
            }
            String respuesta2 = objConsulta.ejecutar(minimo,numeroRegistroPorPagina);
            out.println(respuesta2);
            }  
        %>
    </p>
</div>

<!Paginación>

<div class = "numeracion">
    <% 
        if(paginaActual > 1)
           out.println("<a href='http://localhost:8080/JavaWeb1/index.jsp?codigo="+(paginaActual-1)+"' style=\"color:#FF0000\">    <<</a>");                          
       
        //Permite ingresar una URL    
        for(int i=1;i<=numeroPaginaWeb; i++){
            out.println("<a href='http://localhost:8080/JavaWeb1/index.jsp?codigo="+i+"' style=\"color:#0938A5\"> ["+i+"] </a>");
        }
          
        if(paginaActual<numeroPaginaWeb)
            out.println("<a href='http://localhost:8080/JavaWeb1/index.jsp?codigo="+(paginaActual+1)+"' style=\"color:#FF0000\">    >></a>"); 
         
    %>
</div>

<!Nombres de los integrantes>
<h2 align="center" style=\"font-size:100%;\"> Jéssica Marcela García Güiza </h2>
<h2 align="center" style=\"font-size:100%;\">  Laura Vanessa Camacho Zárathe </h2>
<h2 align="center" style=\"font-size:100%;\"> Alan Enrique Bohórquez Niño </h2>

</body>
</html>