// Oliver Noss AP Computer Science
// check target in searchWalk()
int n; 
Bacteria[] a = new Bacteria[20];
Food[] techSustinance = new Food[10];

void setup()   
{     
	
	for (int i = 0; i < techSustinance.length; i++) 
	{
		techSustinance[i] = new Food();
	}
	for (int i = 0; i < a.length; i++) 
	{
		a[i] = new Bacteria();
	}
	size(500,500);
	background(0);
	noStroke();
	frameRate(15);
}   

void draw()   
{  
	n=0;
	background(0);
	while(n<a.length)  
	{

		a[n].show();
		a[n].wrapCheck();
		a[n].searchWalk();
		a[n].searchWalk();
		a[n].searchWalk();
		n++;
	}
	n=0;
	while(n<techSustinance.length)  
	{
		techSustinance[n].show();
		n++;
	}
}  
class Bacteria    
{   
	float[] distList;
	int target;
	color rgb;
	int x, y; 
	float d;
	Bacteria()
	{

		distList = new float[techSustinance.length];
		x = (int)(Math.random()*499+1);
		y = (int)(Math.random()*499+1);
		for (int i = 0; i < techSustinance.length; i++) 
		{
			distList[i] = dist(x,y,techSustinance[i].x,techSustinance[i].y);
		}
		rgb = color((int)(Math.random()*30),(int)(Math.random()*256),(int)(Math.random()*100+155)); 

		d = 20;
	}
	void show()
	{
		fill(rgb); 		
		ellipse(x, y, int(d), int(d));
		//shrink
		d*=.95;
		
		if(d<2)
		{
			x = (int)(Math.random()*499+1);
			y = (int)(Math.random()*499+1);
			rgb = color((int)(Math.random()*30),(int)(Math.random()*256),(int)(Math.random()*100+155)); 
			d=20;
		}
	}
	void wrapCheck()
	{
		if (x < 0){x = 500;}
		if (x > 500){x = 0;}
		if (y < 0){y = 500;}
		if (y > 500){y = 0;}
	}
	void searchWalk()
	{	
		for (int i = 0; i < techSustinance.length; i++) 
		{
			distList[i] = dist(x,y,techSustinance[i].x,techSustinance[i].y);
		}


		for (int i = 0; i < distList.length; i++) {
			if (min(distList)==distList[i]) 
			{

				target = i;

			}
		}
		if(min(distList)<100)
		{
			if (techSustinance[target].x>=x)
			{
				x += (int)(Math.random()*8-2);
			}
			if (techSustinance[target].x<x)
			{
				x += (int)(Math.random()*8-6);
			}
			if (techSustinance[target].y>=y)
			{
				y += (int)(Math.random()*8-2);
			}
			if (techSustinance[target].y<y)
			{
				y += (int)(Math.random()*8-6);
			}

			if (dist(x,y,techSustinance[target].x,techSustinance[target].y)<=d/2)
			{
				techSustinance[target].eaten();
				d+=10;
			}
		}
		else {
			x+= (int)(Math.random()*8-4);
			y+= (int)(Math.random()*8-4);
		}
	}
}
class Food
{

	int x, y;
	color rgb;
	Food()
	{
		x = (int)(Math.random()*499+1);
		y = (int)(Math.random()*499+1);
		rgb = color((int)(Math.random()*50+205),(int)(Math.random()*100),(int)(Math.random()*30));
	}
	void show()
	{
		fill(rgb);
		ellipse(x,y,5,5);

	}
	void eaten()
	{
		x = (int)(Math.random()*499+1);
		y = (int)(Math.random()*499+1);
		rgb = color((int)(Math.random()*50+205),(int)(Math.random()*100),(int)(Math.random()*30));
	}
}