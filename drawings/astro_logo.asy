/*
 * The Astrobook official logo
 */

/* Packages and modules used */
import geometry;
import fontsize;

/* Settings, configuration and LaTeX packages for the script */
usepackage("wasysym");
usepackage("marvosym");
settings.outformat="png";
defaultpen(fontsize(20pt));
unitsize(1cm);
srand(3);


/* Macros and constants */
pair OO = (0,0);
real R_SUN = 1.00;
real R_ZODIAC_OUT = R_SUN * 12.00;
real R_ZODIAC_IN = R_ZODIAC_OUT - 1.00;
real R_ZODIAC_MEAN = (R_ZODIAC_OUT + R_ZODIAC_IN) / 2.00;

/* 
 * Draw Zodiac circles, sectors and symbols 
 */
draw(circle(OO, R_ZODIAC_OUT), linewidth(2pt));
draw(circle(OO, R_ZODIAC_IN), linewidth(2pt));

int i = 1;
for (int theta = 0; theta <= 360; theta += 15) {

  /* Local loop variables */
  pair init_pos, final_pos, mean_pos;

  if (theta % 30 == 0) {
  	/* Draw a sector it 30 degrees multiple, else write Zodiac sign */
  	init_pos = (R_ZODIAC_IN * Cos(theta), R_ZODIAC_IN * Sin(theta));
  	final_pos = (R_ZODIAC_OUT * Cos(theta), R_ZODIAC_OUT * Sin(theta));
  	draw(init_pos -- final_pos, linewidth(2pt));
  } else {
	/* If mean position achieved, draw a symbol */
	mean_pos  = (R_ZODIAC_MEAN * Cos(theta), R_ZODIAC_MEAN * Sin(theta));
        label("\Zodiac{" + string(i) + "}", mean_pos);
	++i;
  }
}

/* 
 * Draw the Sun and its rays
 */
filldraw(circle(OO, R_SUN), black + linewidth(2pt));
for (int theta=180; theta<=360; theta += 5) {
	/* Filter between short or long rays */
	real f;
	if (theta % 10 == 0) {
		f = 0.9;
	} else {
		f = 0.95;
	}
	pair AA = (f * R_ZODIAC_IN * Cos(theta), f * R_ZODIAC_IN * Sin(theta));
	draw(OO -- AA, linewidth(2pt));

}

/* Draw the planets and their orbits */
real R_PLANETS[] = {1/12, 2/12, 3.5/12, 3/12, 0, 6/12, 5/12, 4/12, 4.5/12,
0.5/12};
real ECC_PLANETS[] = {0.206, 0.007, 0.017, 0.093, 0, 0.048, 0.056, 0.047, 0.009, 0.248};
string name_bodies[] = {
	"mercury",
	"venus",
	"earth",
	"mars",
	"asteroids belt",
	"jupiter",
	"saturn",
	"uranus",
	"neptune",
	"pluto",
};

for (int i=0; i<name_bodies.length - 1; ++i) {
	
	/* Semi-major and semi-minor axis computation */
	real d_sun = R_SUN + i + 1;

	/* Compute and draw orbit path */
	path orbit = arc(OO, d_sun, 0, 180);
	if (i != 4) {
		draw(orbit, solid+linewidth(1.5pt));
	} else {
		draw(orbit, dashed+linewidth(1.5pt));
	}

	/* Compute random location in Cartessian coordinates */
	real theta = unitrand() * 180;
	pair pos = (d_sun * Cos(theta), d_sun * Sin(theta));
	path planet = circle(pos, R_SUN * R_PLANETS[i]);

	/* Draw planet at previous location */
	filldraw(planet, black);
	
	if (i == 6) {
		draw(circle(pos, R_SUN * R_PLANETS[i] * 1.5), linewidth(1.2pt));
	}
	

}
