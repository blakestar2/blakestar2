Blas Core version 0.1.0.1
==========================

Release is now available from:

  <https://blakestar.com/downloads/>

This is a new minor version release, bringing various bugfixes and other
improvements.

Please report bugs using the issue tracker at github:

  <https://github.com/blakestar2/blakestar2/issues>


Upgrading and downgrading
=========================

How to Upgrade
--------------

If you are running an older version, shut it down. Wait until it has completely
shut down (which might take a few minutes for older versions), then run the
installer (on Windows) or just copy over /Applications/Blas-Qt (on Mac) or
blasd/blas-qt (on Linux).

Notable changes
===============

InstantSend fixes
-----------------

Coin selection could work slightly incorrect in some edge cases which could
lead to a creation of an InstantSend transaction which only the local wallet
would consider to be a good candidate for a lock. Such txes was not locked by
the network but they were creating a confusion on the user side giving an
impression of a slightly higher InstantSend failure rate.

Another issue fixed in this release is that masternodes could vote for a tx
that is not going to be accepted to the mempool sometimes. This could lead to
a situation when user funds would be locked even though InstantSend transaction
would not show up on the receiving side.

Fix -liquidityprovider option
-----------------------------

Turned out that liquidityprovider mixing mode practically stopped working after
recent improvements in the PrivateSend mixing algorithm due to a suboptimal
looping which occurs only in this mode (due to a huge number of rounds). To fix
the issue a small part of the mixing algorithm was reverted to a pre-0.1.0.1 one
for this mode only. Regular users were not affected by the issue in any way and
will continue to use the improved one just like before.