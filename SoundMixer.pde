import processing.sound.*;
import ddf.minim.*;

boolean[] buttons;
char[] letters = {'Z', 'X', 'C', 'V', 'B', 'N', 'M'};
String[] labels = {"BLUE", "GREEN", "CYAN", "RED", "PINK", "YELLOW", "WHITE"}, tracks = {"bongos.mp3", "conga_alto.mp3", "conga_bajo.mp3", "contrabajo.mp3", "guiro.mp3", "maracas_2.mp3", "piano.mp3"};
int[][] colours = {{0, 0, 1}, {0, 1, 0}, {0, 1, 1}, {1, 0, 0}, {1, 0, 1}, {1, 1, 0}, {1, 1, 1}};
WaveformRenderer[] waveforms;
AudioPlayer[] mplayer;
Minim minim;

void setup() {
  size(700, 300);

  textAlign(CENTER);
  buttons = new boolean[7];
  minim = new Minim(this);
  mplayer = new AudioPlayer[7];
  waveforms = new WaveformRenderer[7];

  for (int i = 0; i < 7; i++) {
    buttons[i] = false;
    mplayer[i] = minim.loadFile(tracks[i]);
    mplayer[i].setGain(-80);
    mplayer[i].loop();
    waveforms[i] = new WaveformRenderer(colours[i]);
    mplayer[i].addListener(waveforms[i]);
  }
}

void draw() {
  manageBackground();
  manageButtons();
  for (int i = 0; i < 7; i++) {
    if (buttons[i]) {
      mplayer[i].setGain(0);
      waveforms[i].draw();
    } else {
      mplayer[i].setGain(-80);
    }
  }
}

void manageBackground() {
  background(0);
  stroke(200);
  fill(200);
  rect(0, 200, 800, 200);
}

void manageButtons() {
  stroke(0);
  for (int i = 0; i < 7; i++) {
    if (buttons[i]) {
      fill(0, 230, 0);
    } else {
      fill(230, 0, 0);
    }
    circle(100 * i + 50, 240, 50);

    fill(0);
    text(letters[i], 100 * i + 50, 245);
    text(labels[i], 100 * i + 50, 285);
  }
}

void keyPressed() {
  if (key == 'z') {
    buttons[0] = !buttons[0];
  } else if (key == 'x') {
    buttons[1] = !buttons[1];
  } else if (key == 'c') {
    buttons[2] = !buttons[2];
  } else if (key == 'v') {
    buttons[3] = !buttons[3];
  } else if (key == 'b') {
    buttons[4] = !buttons[4];
  } else if (key == 'n') {
    buttons[5] = !buttons[5];
  } else if (key == 'm') {
    buttons[6] = !buttons[6];
  } else if (key == ' ') {
    resetButtons();
  }
}

void resetButtons(){
  for (int i = 0; i < 7; i++) {
    buttons[i] = false;
  }
}

class WaveformRenderer implements AudioListener
{
  private float[] left;
  private float[] right;
  private int[] colors;

  WaveformRenderer(int[] colors)
  {
    left = null; 
    right = null;
    this.colors = colors;
  }

  public synchronized void samples(float[] samp)
  {
    left = samp;
  }

  public synchronized void samples(float[] sampL, float[] sampR)
  {
    left = sampL;
    right = sampR;
  }

  synchronized void draw()
  {
    noFill();
    stroke(colors[0] * 255, colors[1] * 255, colors[2] * 255);
    beginShape();
    for ( int i = 0; i < left.length; i++ )
    {
      vertex(i, height/4 - 15 + left[i]*100);
    }
    endShape();
    beginShape();
    for ( int i = 0; i < right.length; i++ )
    {
      vertex(i, 2*(height/4) - 15 + right[i]*100);
    }
    endShape();
  }
}
