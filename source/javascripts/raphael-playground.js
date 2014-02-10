window.onload = function () {
  var paper = Raphael("canvas", 500, 500);
  if (paper){
    
    var diam = 15;
    var point = [0,0];

    for (i=0; i < 800; i++) {

      point[0] = 500*Math.random();
      point[1] = 500*Math.random();
      for (j=0; j < diam; j++) {
        paper.circle(point[0], point[1], j+2).
          attr('opacity',(1+diam-j)/(diam*diam)).
          attr('fill','#f00').
          attr('stroke-width', '0');
      }
    }
  }
}