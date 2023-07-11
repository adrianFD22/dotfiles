#
# ~/.bashrc
#

BASHRC_DIR=${XDG_CONFIG_HOME:-$HOME/.config}/bashrc

# Load the 'init.sh'.
source $BASHRC_DIR/init.sh

# Find all '.sh' files in ~/bashrc, exclude 'init.sh'.
RC_FILES=$(find $BASHRC_DIR -name '*.sh' -not -name 'init.sh')

for FILE in $RC_FILES; do
    source $FILE
done

unset FILE
unset BASHRC_DIR
