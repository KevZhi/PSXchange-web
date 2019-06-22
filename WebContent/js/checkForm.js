/**
 * 
 */
function checkForm() {
	var submit = document.getElementById("submit");
	var logid = document.getElementsByName("logid");
	var password = document.getElementsByName("password");
	var password2 = document.getElementsByName("password2");
	var err_id_tip = document.getElementById("err_id_tip");
	var err_pswd_tip = document.getElementById("err_pswd_tip");
	var err_repswd_tip = document.getElementById("err_repswd_tip");
	if (logid[0].value == "") {
		logid[0].focus();
		submit.disabled = true;
		submit.className = "btn btn-lg btn-primary btn-block";
		if(err_id_tip)
			err_id_tip.style.display = "";
		if(err_pswd_tip)
			err_pswd_tip.style.display = "none";
		if(err_repswd_tip)
		    err_repswd_tip.style.display = "none";
	} else {
		if(err_id_tip)
			err_id_tip.style.display = "none";
		if (password[0].value == "") {
			password[0].focus();
			if(err_pswd_tip)
			document.getElementById("err_pswd_tip").style.display = "";
			if (err_repswd_tip)
				err_repswd_tip.style.display = "none";
		} else {
			if(err_pswd_tip)
				document.getElementById("err_pswd_tip").style.display = "none";
			if (password2[0]
					&& (password[0].value != password2[0].value)) {
				password2[0].focus();
				submit.disabled = true;
				submit.className = "btn btn-lg btn-primary btn-block";
				if(err_repswd_tip)
					err_repswd_tip.style.display = "";
			} else {
				if(err_repswd_tip)
					err_repswd_tip.style.display = "none";
				submit.disabled = false;
				submit.className = "btn btn-lg btn-primary btn-block";
			}
		}
	}
}