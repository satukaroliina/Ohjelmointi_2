function hashPwd() {
	const uid = document.getElementById("uid");
	const pwd = document.getElementById("pwd");
	const hashedPwd = document.getElementById("hashedPwd");
	sha256(pwd.value + uid.value)
		.then((hashStr) => {
			hashedPwd.value = hashStr;
			pwd.value = "";
			tarkastaLogin();
		});		
}

async function sha256(str) {
	const msgUint8 = new TextEncoder().encode(str);
	const hashBuffer = await crypto.subtle.digest('SHA-256', msgUint8);
	const hashArray = Array.from(new Uint8Array(hashBuffer));
	const hashHex = hashArray.map((b) => b.toString(16).padStart(2, '0')).join('');
	return hashHex;
}

function tarkastaLogin() {
	let data = new URLSearchParams();
	for (const pair of new FormData(loginForm)) {
		data.append(pair[0], pair[1]);
	}
	console.log(data);
	let url = "login";
	let requestOptions = {
		method: "POST",
		headers: { "Content-Type": "application/x-www-form-urlencoded; charset=UTF-8" },
		body: data
	};
	fetch(url, requestOptions)
		.then(response => response.text())
		.then(response => document.location = response);
}