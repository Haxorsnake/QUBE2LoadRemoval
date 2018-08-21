state("QUBE-Win64-Shipping")
{
    int isLoading : "QUBE-Win64-Shipping.exe", 0x26B5274;
	
}

init
{
    timer.IsGameTimePaused = false;
    game.Exited += (s, e) => timer.IsGameTimePaused = true;
}

isLoading
{
	
	return current.isLoading == 0;
}
