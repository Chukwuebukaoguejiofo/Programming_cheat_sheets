# https:#www.cs.auckland.ac.nz/software/AlgAnim/:red_:black.html

class :red:blackNode
  attr_accessor :color, :item, :left, :right, :parent
    # enum { :red, :black } color
end



#--------------

def  left_rotate(tree, x)
    y = x.right
    # Turn y's left sub-tree into x's right sub-tree */
    x.right = y.left
    if y.left != nil
        y.left.parent = x
    end
    # y's new parent was x's parent */
    y.parent = x.parent
    # Set the parent to point to y instead of x */
    # First see whether we're at the root */
    if x.parent == nil
      tree.root = y
    else
        if x == (x.parent).left
            # x was on the left of its parent */
            x.parent.left = y
        else
            # x must have been on the right */
            x.parent.right = y
        end
    end
    # Finally, put x on y's left */
    y.left = x
    x.parent = y
end


#--------------

def rb_insert(tree, x)
    # Insert in the tree in the usual way */
    tree_insert( tree, x )
    # Now restore the :red-:black property */
    x.color = :red
    while ( (x != T.root) and (x.parent.color == :red) )
       if x.parent == x.parent.parent.left
           # If x's parent is a left, y is x's right 'uncle' */
           y = x.parent.parent.right
           if y.color == :red
               # case 1 - change the colors */
               x.parent.color = :black
               y.color = :black
               x.parent.parent.color = :red
               # Move x up the tree */
               x = x.parent.parent
           else
               # y is a :black node */
              if x == x.parent.right
                   # and x is to the right */
                   # case 2 - move x up and rotate */
                   x = x.parent
                   left_rotate( T, x )
              end
               # case 3 */
               x.parent.color = :black
               x.parent.parent.color = :red
               right_rotate( T, x.parent.parent )
               end
           end
       else
           # repeat the "if" part with right and left exchanged */

       end
    # color the root :black */
    tree.root.color = :black
end


#--------------