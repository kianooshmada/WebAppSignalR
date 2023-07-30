using Microsoft.AspNet.SignalR;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Web;

namespace WebApp
{
    public class WebHub : Hub
    {
        public void SendMessage(string message)
        {
           Clients.Others.UpdateOutput(message);
        }
    }
}