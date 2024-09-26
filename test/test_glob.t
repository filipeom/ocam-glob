  $ glob "a/b"
  glob: internal error, uncaught exception:
        Failure("directory contents a/: No such file or directory")

  [125]
  $ mkdir -p a/b && glob "a/b"
  a/b
  $ mkdir -p a &&  glob "a/b.js"
  $ mkdir -p a && touch a/b.js && glob "a/b.js"
  a/b.js
  $ mkdir -p a && touch a/a.js && touch a/b.js && touch a/c.js && glob "a/*.js"
  a/c.js a/a.js a/b.js
  $ mkdir -p b/c && touch b/c/a.js && touch b/c/b.js && glob --recursive "b/**/*.js"
  b/c/b.js b/c/a.js
  $ mkdir -p c/d/e && touch c/d/e/a.js && touch c/d/e/b.js && glob --recursive "c/**/*.js"
  c/d/e/b.js c/d/e/a.js
