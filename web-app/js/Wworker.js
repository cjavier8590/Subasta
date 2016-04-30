var setMessage = function(msg) {
    var msgDiv = document.getElementById('message');
    msgDiv.innerHTML = msg;  
  }


var myWorker = null,
    URL = window.URL || (window.webkitURL);

window.URL = URL;

var workerData = new Blob([document.getElementById('myWorker').textContent], {
    type: "text/javascript"
});

function init() {
    if (typeof (Worker) === undefined) {
        alert('No webworker supported');
        return false;
    }

    myWorker = new Worker(window.URL.createObjectURL(workerData));
    myWorker.onmessage = function (e) {
        document.getElementById('counter').innerHTML = e.data;
      if (e.data === 0) {
        setMessage("LIFT OFF!");
      }
      if (e.data === -4) {
        setMessage("Tower has been cleared... ");
      }
      if (e.data === -10) {
        setMessage("Whoooohoo, magic carpet ride! ");
      }
    };
}

init();