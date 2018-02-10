##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Minimal ellipsis version
ELLIPSIS_VERSION_DEP='1.9.4'

# Package dependencies (informational/not used!)
ELLIPSIS_PKG_DEPS='groggemans/dot-git'

##############################################################################

pkg.install() {
    # groggemans/git package should be installed (rough check)
    ellipsis.list_packages | grep "$ELLIPSIS_PACKAGES/git" 2>&1 > /dev/null
    if [ $? -ne 0 ]; then
        log.fail "Unmet dependency 'groggemans/dot-git'"
        return 1
    fi
}

##############################################################################

pkg.link() {
    # Link users git config (.config/git should exist)
    fs.link_file "$PKG_PATH/gituserconfig" "$ELLIPSIS_HOME/.config/git/gituserconfig"
}

##############################################################################

pkg.pull() {
    # Use improved update strategy
    git remote update 2>&1 > /dev/null
    if git.is_behind; then
        pkg.unlink
        git.pull
        pkg.link
    fi
}

##############################################################################

pkg.unlink() {
    # Remove users git config
    rm "$ELLIPSIS_HOME/.config/git/gituserconfig"

    hooks.unlink
}

##############################################################################

pkg.uninstall() {
    : # No action
}

##############################################################################

