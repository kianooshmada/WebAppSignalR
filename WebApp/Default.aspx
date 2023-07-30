<%@ Page Language="C#" AutoEventWireup="true" CodeBehind="Default.aspx.cs" Inherits="WebApp.Default" %>

<!DOCTYPE html>
<html>
<head>
<title>Web App</title>
<script src="scripts/jquery-1.6.4.min.js"></script>
<script src="scripts/jquery.signalR-2.4.3.min.js"></script>
<script src="signalr/hubs"></script>

<script>
   jQuery(function($) {
       // Establish the SignalR connection
       var connection = $.hubConnection();
       var hubProxy = connection.createHubProxy("WebHub");

       // Define the method to update the output text box
       hubProxy.on("UpdateOutput", function(message) {
           $("#outputText").val(message);
       });

       // Start the connection
       connection.start();

       // Handle input text changes
       const inputText = document.getElementById('inputText');
       inputText.addEventListener('input', function () {
           var message = $(this).val();
           hubProxy.invoke("SendMessage", message);
       });
   });
</script>
<style>
    label, input{
        margin:8px;
        font-weight:bold;
    }

    #outputText{
        background-color:beige;
    }
</style>
</head>
<body>
    <h1>Web App SignalR Demo</h1>
    <div>
        <label for="inputText">Input:</label>
        <input type="text" id="inputText">
        <br />
        <label for="outputText">Output:</label>
        <input type="text" id="outputText" readonly>
    </div>
</body>
</html>

