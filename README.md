Pure Function As An Object (PFAAO) Pattern Demonstration
========================================================

This is a tiny project to demonstrate the PFAAO pattern.
It converts a JSON document to an XML document.
The accompanying article article is available here: <http://www.rubypigeon.com/posts/the-pure-function-as-an-object-pfaao-pattern/>


Running The Code
----------------

First, install the dependencies with:

```sh
bundle install
```

Then run the code with:

```sh
bundle exec ruby convert.rb
```


Acknowledgements
----------------

The `input.json` data set comes from JSON Studio website:

<http://jsonstudio.com/resources/>

This pattern is inspired and influenced by all of [Rich Hickey's Clojure talks][] and [Casey Muratori's API design talks][].

[Rich Hickey's Clojure talks]: http://www.infoq.com/author/Rich-Hickey#Presentations
[Casey Muratori's API design talks]: http://mollyrocket.com/casey/stream_0028.html
