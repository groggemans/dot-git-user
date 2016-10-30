##############################################################################
# @file ellipsis.sh
# @date January, 2016
# @author G. Roggemans <g.roggemans@grog.be>
# @copyright Copyright (c) GROG [https://grog.be] 2016, All Rights Reserved
# @license MIT
##############################################################################

# Minimal ellipsis version
ELLIPSIS_VERSION_DEP='1.9.0'

# Package dependencies (informational/not used!)
ELLIPSIS_PKG_DEPS='groggemans/dot-git'

##############################################################################

pkg.install() {
    # groggemans/git package should be installed (rough check)
    if ! ellipsis.list_packages | grep "$ELLIPSIS_PACKAGES/git"; then
        log.fail "Unmet dependency 'groggemans/dot-git'"
        return 1
    fi
}

##############################################################################

pkg.uninstall() {
    : # No action
}

##############################################################################

