Kirby Animation Project

This project aims to create a dynamic animation using VSync to enhance the understanding of:
- Utilizing the vBlank period
- Drawing and erasing pixels in Mode 3
- Working with an infinite while loop

This project required implementing a looping animation of at least four distinct frames in Mode 3 with button controls to handle various playback functions. The theme was Kirby and I used a kirby image from Haykira's twitter page (https://x.com/i/status/1312414121778982914) as my reference

Button Controls
- A: Advance to the next frame. If at the final frame, return to the first frame.
- B: Return to the previous frame. If at the first frame, go to the final frame.
- Start: Toggle looping through frames (acts as a play/pause button).
- Select: Toggle animation direction (forwards/backwards).
- Left: Skip to the first frame without pausing.
- Right: Skip to the final frame without pausing.
- Up: Increase playback speed (max speed with at least 5 different levels, including regular speed and two faster speeds).
- Down: Decrease playback speed (min speed with at least 5 different levels, including regular speed and two slower speeds).
