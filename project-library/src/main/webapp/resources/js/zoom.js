	function getProperties(obj)
	{
		var properties = "";
		for(var property in obj){
			properties += property + "<br>";
		}
		document.write(properties)
	}

	var offset = 10;
	var minZoom = 60;
	var maxZoom = 200;

	var zoomVal = 0;
	if(zoomVal == 0){
		zoomVal = 100;
	}

	setZoom('100%');

	function setZoom(v)
	{
		if(document.body !="" && document.body != null){
			//document.getElementById('wrapbg').style.zoom = v ;
			document.body.style.zoom = v ;
			
		}
	}



	function zoomIn()
	{
		if ( zoomVal < maxZoom )
		{
			zoomVal += offset;
			setZoom(zoomVal+ "%");
		}
		else
		{
			alert("더이상 확대되지 않습니다.");
		}
	}


	function zoomOut()
	{
		if ( zoomVal > minZoom )
		{
			zoomVal -= offset;
			setZoom(zoomVal+ "%");
		}
		else
		{
			alert("더이상 축소되지 않습니다.");
		}
	}


	function resetZoom()
	{
		zoomVal =100;
		setZoom(zoomVal+ "%");
	}