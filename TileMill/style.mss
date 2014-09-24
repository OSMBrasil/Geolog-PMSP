@label-offset: 15;
@text-size: 9;

#geolog {
  line-width:1;
  line-color:#168;
  [zoom>=15]{
    	::labels {
  			text-name: [TITULO]+' '+[PREP]+' '+[NAME];
  			text-face-name: 'Arial Bold';
  			// text-fill: @text;
  			text-size: 12;
      		text-placement: line;
			text-halo-radius: 1;
            text-max-char-angle-delta: 15;
      		      text-wrap-width: 1;
		      text-wrap-character: '_';
      }
  
  }
}



// Adresses LEFT
#geolog-left {
  [zoom>=15]{

	// north-south
    [ORIENTA_O='NORTE-SUL']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_LEFT]+" - "+[START_LEFT]+")";
      text-dy: @label-offset;
    }
    
	// south-north
    [ORIENTA_O='SUL-NORTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_LEFT]+" - "+[START_LEFT]+")";
      text-dy: @label-offset * -1;
    }
    
	// east-west
    [ORIENTA_O='LESTE-OESTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_LEFT]+" - "+[START_LEFT]+")";
      text-dy: @label-offset;
    }
    
	// west-east
    [ORIENTA_O='OESTE-LESTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_LEFT]+" - "+[START_LEFT]+")";
      text-dy: @label-offset * -1;
    }    
    
    
  }
}

// Adresses RIGHT
#geolog-right {
  [zoom>=15]{
    
    // north-south
    [ORIENTA_O='NORTE-SUL']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_RIGHT]+" - "+[START_RIGH]+")";
      text-dy: @label-offset * -1;
    }
    
    // south-north
    [ORIENTA_O='SUL-NORTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_RIGHT]+" - "+[START_RIGH]+")";
      text-dy: @label-offset ;
    }    
    
	// east-west
    [ORIENTA_O='LESTE-OESTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_RIGHT]+" - "+[START_RIGH]+")";
      text-dy: @label-offset * -1;
    }
    
	// west-east
    [ORIENTA_O='OESTE-LESTE']{
      text-face-name: 'Arial Bold';
      text-size: @text-size;
      text-placement: line;
      text-halo-radius: 1;        
      text-name: "("+[END_RIGHT]+" - "+[START_RIGH]+")";
      text-dy: @label-offset ;
    }    
    
  }
}