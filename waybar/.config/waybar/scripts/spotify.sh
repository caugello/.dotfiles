#!/usr/bin/sh
case $1 in
  metadata)
    ARTIST=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep 'xesam:artist' | sed 's/xesam:artist:\s//g')
    TITLE=$(qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Metadata | grep 'xesam:title' | sed 's/xesam:title:\s//g')
    echo "${ARTIST} - ${TITLE}"
    ;;
  playpause)
    qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.PlayPause
    ;;
  next)
    qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Next
    ;;
  previous)
    qdbus org.mpris.MediaPlayer2.spotify /org/mpris/MediaPlayer2 org.mpris.MediaPlayer2.Player.Previous
    ;;
esac
