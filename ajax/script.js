function selectoptions($selectid, xhttp) {
  xhttp.onreadystatechange = function () {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById($selectid).innerHTML = this.responseText;
    }
  };
}

function loadForm($idform, $formpage, $phppage, $e) {
  var xhttp = new XMLHttpRequest();
  selectoptions($idform, xhttp);
  xhttp.open("GET", $formpage, true);
  xhttp.send();
  selectdepart($phppage, $e);
}

function selectdepart($phppage, $e) {
  var xhttp = new XMLHttpRequest();
  selectoptions($e, xhttp);
  xhttp.open("GET", "http://127.0.0.1/ajax/"+ $phppage, true);
  xhttp.send();
}

function selectjob($idselect, $u) {
  var xhttp = new XMLHttpRequest();
  selectoptions($u, xhttp);
  var department = document.getElementById($idselect).value;
  document.getElementById("result").innerHTML = '';
  restart();
  xhttp.open("GET", "http://127.0.0.1/ajax/selectjob.php?department=" + department, true);
  xhttp.send();
}

function create() {
	var job = document.getElementById("job").value;
	var name = document.getElementById("name").value;
	var email = document.getElementById("email").value;
	var phone = document.getElementById("phone").value;
	var sxmlhttp;
	sxmlhttp = new XMLHttpRequest();

	sxmlhttp.onreadystatechange = function () {
		if (sxmlhttp.readyState == 4 && sxmlhttp.status == 200) {
      document.getElementById("result").innerHTML = 'saved record!';
      loadForm('formhide', 'form1.html');
		}
	}

	sxmlhttp.open("POST", "http://127.0.0.1/ajax/create.php", true);
	sxmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	sxmlhttp.send("job=" + job + "&name=" + name + "&email=" + email + "&phone=" + phone);
}

function view() {
	var department2 = document.getElementById("department2").value;
	var job2 = document.getElementById("job2").value;
	var sxmlhttp;
	sxmlhttp = new XMLHttpRequest();

	sxmlhttp.onreadystatechange = function () {
		if (sxmlhttp.readyState == 4 && sxmlhttp.status == 200) {
      document.getElementById("messajejson").innerHTML = 'json result file';
      document.getElementById("resultjson").innerHTML = this.responseText;
      document.getElementById("messajetable").innerHTML = 'table format';

      var myJson = JSON.parse(this.responseText);

    var col = [];
    for (var i = 0; i < myJson.length; i++) {
        for (var key in myJson[i]) {
            if (col.indexOf(key) === -1) {
                col.push(key);
            }
        }
    }

    var table = document.createElement("table");

    var tr = table.insertRow(-1);       

    for (var i = 0; i < col.length; i++) {
        var th = document.createElement("th");    
        th.innerHTML = col[i];
        tr.appendChild(th);
    }

    for (var i = 0; i < myJson.length; i++) {

        tr = table.insertRow(-1);

        for (var j = 0; j < col.length; j++) {
            var tabCell = tr.insertCell(-1);
            tabCell.innerHTML = myJson[i][col[j]];
        }
    }

    var divContainer = document.getElementById("resultable");
    divContainer.innerHTML = "";
    divContainer.appendChild(table);
		}
	}

	sxmlhttp.open("POST", "http://127.0.0.1/ajax/view.php", true);
	sxmlhttp.setRequestHeader("Content-type", "application/x-www-form-urlencoded");
	sxmlhttp.send("department2=" + department2 + "&job2=" + job2);
}

function restart(){
  document.getElementById("messajejson").innerHTML = '';
  document.getElementById("resultjson").innerHTML = '';
  document.getElementById("messajetable").innerHTML = '';
  document.getElementById("resultable").innerHTML = '';
}