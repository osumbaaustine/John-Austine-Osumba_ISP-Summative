

I am using Queues to simulate an intersection, north/south, east/west.
Cars randomly show up every 30 seconds from east and west traffic and every 10 seconds from north and south traffic. 
When the light turns green for one direction it will dequeue cars until its time runs out, then it will "turn red"
and then turn green for the other direction for a different amount of time.