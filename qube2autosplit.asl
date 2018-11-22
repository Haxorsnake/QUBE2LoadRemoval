state("QUBE-Win64-Shipping")
{
    int isLoading : "QUBE-Win64-Shipping.exe", 0x26B5274;
	float Y : "QUBE-Win64-Shipping.exe", 0x02B2B000, 0x2F8, 0x758, 0x720, 0x3A0, 0x198;
	float X : "QUBE-Win64-Shipping.exe", 0x02B2B000, 0x2F8, 0x758, 0x720, 0x3A0, 0x194;
	float Z : "QUBE-Win64-Shipping.exe", 0x02B2B000, 0x2F8, 0x758, 0x720, 0x3A0, 0x190;
}
startup
{
	vars.chapter1 = "no";
	vars.chapter2 = "no";
	vars.chapter3 = "no";
	vars.chapter4 = "no";
	vars.chapter6 = "no";
	vars.chapter7 = "no";
	vars.chapter8 = "no";
	vars.chapter9 = "no";
	vars.chapter10 = "no";
	vars.chapter11 = "no";
	
	vars.c6start = "no";
	vars.c7start = "no";
	vars.c8start = "no";
	vars.c9start = "no";
}

update
{
	if (timer.CurrentPhase == TimerPhase.NotRunning)
	{
		vars.chapter1 = "no";
		vars.chapter2 = "no";
		vars.chapter3 = "no";
		vars.chapter4 = "no";
		vars.chapter6 = "no";
		vars.chapter7 = "no";
		vars.chapter8 = "no";
		vars.chapter9 = "no";
		vars.chapter10 = "no";
		vars.chapter11 = "no";
		vars.c6start = "no";
		vars.c7start = "no";
		vars.c8start = "no";
		vars.c9start = "no";
	}
	//print("Y:" + current.Y.ToString() + "X: " + current.X.ToString() + "Z: " + current.Z.ToString());
}

init
{
    timer.IsGameTimePaused = false;
    game.Exited += (s, e) => timer.IsGameTimePaused = true;
}

split
{    
	//Chapter 1 Split
	if(current.Z >= 36356  && current.Z <= 36756 && current.X >= -15679  && current.X <= -15120)
	{
		if(vars.chapter1 == "no")
		{
			print("Chapter 1 Completed");
			vars.chapter1 = "yes";
			return true;
		}
	}
	
	//Chapter 2 Split
	if(current.Z >= -22958 && current.Z <= -22758 && current.X >= -1369  && current.X <= -830)
	{
		if(vars.chapter2 == "no")
		{
			print("Chapter 2 Completed");
			vars.chapter2 = "yes";
			return true;
		}
	}
	
	//Chapter 3 Split
	if(current.Z >= 38058  && current.Z <= 38358 && current.X >= -73069  && current.X <= -72530)
	{
		if(vars.chapter3 == "no")
		{
			print("Chapter 3 Completed");
			vars.chapter3 = "yes";
			return true;
		}
	}
	
	//Chapter 4 Split
	if(current.X >= -22841  && current.X <= -22400 && current.Z >= 45130  && current.Z <= 45668)
	{
		if(vars.chapter4 == "no")
		{
			print("Chapter 4 Completed");
			vars.chapter4 = "yes";
			return true;
		}
	}
	
	//Chapter 6 Start Setup
	if(current.Z >= -4143  && current.Z <= -3969 && current.X >= -669  && current.X <= -130)
	{
		if(vars.c6start == "no")
		{
			print("Chapter 6 Started");
			vars.c6start = "yes";
			return false;
		}
	}
	
	//Chapter 6 Split
	if(current.Z >= -5958  && current.Z <= -5600 && current.X >= -669  && current.X <= -130)
	{
		if (vars.c6start == "yes" && vars.chapter6 == "no")
		{
			print("Chapter 6 Completed");
			vars.chapter6 = "yes";
			return true;
		}
	}
	
	
	//Chapter 7 Start Setup
	if(current.Z >= -9569  && current.Z <= -9369 && current.X >= -769  && current.X <= -220)
	{
		if(vars.c7start == "no")
		{
			print("Chapter 7 Started");
			vars.c7start = "yes";
			return false;
		}
	}
	
	//Chapter 7 Split
	if(current.Z >= -11200  && current.Z <= -11009 && current.X >= -769  && current.X <= -220)
	{
		if(vars.c7start == "yes" && vars.chapter7 == "no")
		{
			print("Chapter 7 Completed");
			vars.chapter7 = "yes";
			return true;
		}
	}
	
	
	//Chapter 8 Start Setup
	if(current.Z >= -5005  && current.Z <= -4804 && current.X >= 190  && current.X <= 809)
	{
		if(vars.c8start == "no")
		{
			print("Chapter 8 Started");
			vars.c8start = "yes";
			return false;
		}
	}
	
	//Chapter 8 Split
	if(current.Z >= -5719  && current.Z <= -5509 && current.X >= 190  && current.X <= 809)
	{
		if(vars.c8start == "yes" && vars.chapter8 == "no")
		{
			print("Chapter 8 Completed");
			vars.chapter8 = "yes";
			return true;
		}
	}
	
	
	//Chapter 9 Start Setup
	if(current.Z >= -4900  && current.Z <= -4700 && current.X >= 190  && current.X <= 809 && vars.chapter8 == "yes")
	{
		if(vars.c9start == "no")
		{
			print("Chapter 9 Started");
			vars.c9start = "yes";
			return false;
		}
	}
	
	//Chapter 9 Split
	if(current.Z >= -5619  && current.Z <= -5400 && current.X >= 190  && current.X <= 809 && vars.chapter8 == "yes")
	{
		if(vars.c9start == "yes" && vars.chapter9 == "no")
		{
			print("Chapter 9 Completed");
			vars.chapter9 = "yes";
			return true;
		}
	}
	
	
	//Chapter 10 Split
	if(current.Z >= 16158  && current.Z <= 16400 && current.X >= -20069  && current.X <= -19530)
	{
		if(vars.chapter10 == "no")
		{
			print("Chapter 10 Completed");
			vars.chapter10 = "yes";
			return true;
		}
	}
	
}

isLoading
{
	return current.isLoading == 0;
}
