function goDownload(filename) {
    window.location.href = "/download?fileName=" + encodeURI(encodeURI(filename));
}  