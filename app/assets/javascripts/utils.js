var Utils = {

	/**
		Preview image file in a given canvas, by default shows defaultImageUrl
	**/
	preview : function(input, canvas, defaultImageUrl){
	  input.addEventListener('change', handleFiles);
	  var ctx = canvas.getContext('2d');
	  var img = new Image;
	  var width = canvas.width;
	  var height = canvas.height;
	  
	  if (defaultImageUrl) {
	    img.src = defaultImageUrl;
	    img.onload = function() {
	      ctx.drawImage(img, 0, 0, height, img.height * (width/img.width));
	    }
	  }

	  function handleFiles(e) {
	    img.src = URL.createObjectURL(e.target.files[0]);
	    img.onload = function() {
	        ctx.clearRect(0, 0, canvas.width, canvas.height);
	        ctx.drawImage(img, 0, 0, height,  img.height * (width/img.width));
	    }
	  }
	}

};