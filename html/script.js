	function setProgress(elem, percent) {
		var
		degrees = percent * 3.6,
		transform = /MSIE 9/.test(navigator.userAgent) ? 'msTransform' : 'transform';
		elem.querySelector('.counter').setAttribute('data-percent', Math.round(percent));
		elem.querySelector('.progressEnd').style[transform] = 'rotate(' + degrees + 'deg)';
		elem.querySelector('.progress').style[transform] = 'rotate(' + degrees + 'deg)';
		if (percent >= 50 && !/(^|\s)fiftyPlus(\s|$)/.test(elem.className))
		elem.className += ' fiftyPlus';
	}

	var current = undefined
	window.addEventListener('message', function (table) {
	  let event = table.data;
	  if (event.type == 'create') {
		document.getElementById("loadingbar").style.display = 'block';
		(function() { 
			var elem = document.querySelector('.circlePercent'),
			percent = 0,
			stopped = false,
			stopPercent = 100; //Enter variable name to make it dynamic
			  (function animate() {
				  setProgress(elem, (percent += .25));
				  if (percent < 100 && !stopped)
				  	document.getElementById("fa").innerHTML = event.table.fa;
					  setTimeout(animate, event.table.seconds)
				  if (percent == stopPercent) {
					  stopped = true;
					  console.log("DONE")
						var xhr = new XMLHttpRequest();
						xhr.open("POST", 'https://renzu_progressbar/close', true);
						xhr.setRequestHeader('Content-Type', 'application/json');
						xhr.send(JSON.stringify({}));
				  }
			  })();
		  })();
	  }
	  if (event.type == 'reset') {
		document.getElementById("loadingbar").style.display = 'none';
		window.location.reload(false);
	  }
	});