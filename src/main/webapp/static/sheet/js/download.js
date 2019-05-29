function goDownload(filename) {
	alert("123");
	window.location.href = "/download?fileName=" + encodeURI(encodeURI(filename));
}  