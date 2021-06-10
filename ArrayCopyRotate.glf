#############################################################################
#
# (C) 2021 Cadence Design Systems, Inc. All rights reserved worldwide.
#
# This sample script is not supported by Cadence Design Systems, Inc.
# It is provided freely for demonstration purposes only.
# SEE THE WARRANTY DISCLAIMER AT THE BOTTOM OF THIS FILE.
#
#############################################################################

###############################################################################
##
## ArrayCopyRotate.glf
##
## Script to create copy all grid and database entities a user-prescribed 
## number of times about a user-prescribed axis and angle.
##
###############################################################################

package require PWI_Glyph 2

############################################################################
# Define all user parameters
############################################################################

set RotAxis1 "0 0 0"
set RotAxis2 "1 0 0"
set RotAngle 60
set numRotCopies 2

############################################################################
# Get and assign all database and grid entities to a variable.
############################################################################

set AllDB [pw::Database getAll]
set AllGrid [pw::Grid getAll]
set AllEnts [concat $AllDB $AllGrid]

############################################################################
## Set up control loop to paste multiple copies based
## on the prescribed rotation angle (RotAngle), the number of 
## copies (numRotCopies), and the rotation axis (RotAxis1, RotAxis2).
############################################################################

for {set i 1} { $i <= $numRotCopies} { incr i } {

   # Copy the entities.
   set copyMode [pw::Application begin Copy $AllEnts]
   # Get the pasted entities.
   set Copies [$copyMode getEntities]
   # Set up the transformation.			
   set Rotate [pwu::Transform rotation -anchor $RotAxis1 $RotAxis2 [expr $RotAngle*$i]] 
   # Rotate the pasted entities.
   pw::Entity transform $Rotate $Copies 
		
   $copyMode end
}


#############################################################################
#
# This file is licensed under the Cadence Public License Version 1.0 (the
# "License"), a copy of which is found in the included file named "LICENSE",
# and is distributed "AS IS." TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE
# LAW, CADENCE DISCLAIMS ALL WARRANTIES AND IN NO EVENT SHALL BE LIABLE TO
# ANY PARTY FOR ANY DAMAGES ARISING OUT OF OR RELATING TO USE OF THIS FILE.
# Please see the License for the full text of applicable terms.
#
#############################################################################
