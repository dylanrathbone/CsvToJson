CsvToJson
=========

CsvToJson is a Jruby command line tool for converting a csv file to json.

Assumptions
-----------

<p>Below is a listing of assumptions that were made prior to coding the tool:</p>

<ul>
<li>Files to be converted will always be in .csv format</li>
<li>The converted target format is currently JSON, however, the tool has been coded in such a way so that it can be easily updated for alternative formats down the line</li>
<li>Files to be converted will be approximately 1..50Mb in size</li>
<li>The tool will be used via the command line</li>
</ul>

Installation
------------

<p>This tool was written using RVM and JRuby, therefore you will need to get both ;)</p>

<ul>
<li>Get the RVM and JRuby
<pre><code>\curl -sSL https://get.rvm.io | bash -s stable --ruby=jruby-1.7.9
</code></pre>
</li>
<li>Get the source
<pre><code>git clone git://github.com/dylanrathbone/CsvToJson.git
cd CsvToJson
</code></pre>
<li>To start using RVM you need to run
<pre><code>source source ~/.rvm/scripts/rvm
</code></pre>
<li>Install bundler
<pre><code>gem install bundle
</code></pre>
<li>Install gemset
<pre><code>bundle install
</code></pre>
</li>
<li>set default gemset
<pre><code>rvm default jruby-1.7.9@global
</code></pre>
</li>
</ul>


<p>Installation done!</p>

Usage
-----

<p>Below are some examples of using the tool from the command line</p>

Json conversion example
-----------------------

<pre><code>convert.rb stock_data.csv, json
</code></pre>

XML (simulated) conversion example
----------------------------------

<pre><code>convert.rb stock_data.csv, xml
</code></pre>



Development
------------


