# Import colorscheme from 'wal' asynchronously
# &   # Run the process in the background.
# ( ) # Hide shell job control messages.
([ -f ~/.cache/wal/sequences ] && cat ~/.cache/wal/sequences &)

