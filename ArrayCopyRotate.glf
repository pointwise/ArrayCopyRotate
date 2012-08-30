#
# Copyright 2010 (c) Pointwise, Inc.
# All rights reserved.
#
# This sample Pointwise script is not supported by Pointwise, Inc.
# It is provided freely for demonstration purposes only.
# SEE THE WARRANTY DISCLAIMER AT THE BOTTOM OF THIS FILE.
#

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


#
# DISCLAIMER:
# TO THE MAXIMUM EXTENT PERMITTED BY APPLICABLE LAW, POINTWISE DISCLAIMS
# ALL WARRANTIES, EITHER EXPRESS OR IMPLIED, INCLUDING, BUT NOT LIMITED
# TO, IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
# PURPOSE, WITH REGARD TO THIS SCRIPT.  TO THE MAXIMUM EXTENT PERMITTED 
# BY APPLICABLE LAW, IN NO EVENT SHALL POINTWISE BE LIABLE TO ANY PARTY 
# FOR ANY SPECIAL, INCIDENTAL, INDIRECT, OR CONSEQUENTIAL DAMAGES 
# WHATSOEVER (INCLUDING, WITHOUT LIMITATION, DAMAGES FOR LOSS OF 
# BUSINESS INFORMATION, OR ANY OTHER PECUNIARY LOSS) ARISING OUT OF THE 
# USE OF OR INABILITY TO USE THIS SCRIPT EVEN IF POINTWISE HAS BEEN 
# ADVISED OF THE POSSIBILITY OF SUCH DAMAGES AND REGARDLESS OF THE 
# FAULT OR NEGLIGENCE OF POINTWISE.
#
