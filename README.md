CsvToJson
=========

CsvToJson is a Jruby command line tool for converting a csv file to JSON.

Assumptions
-----------

<p>Below is a listing of assumptions that were made prior to coding the tool:</p>

<ul>
<li>Files to be converted will always be initially provided in .csv format</li>
<li>The converted target format is currently JSON, however, the tool has been coded in such a way that it can be easily updated for alternative formats down the line</li>
<li>Files to be converted will be approximately 1..50Mb in size</li>
<li>The tool will be used via the command line on a *NIX or MacOS* based OS</li>
</ul>

Installation from source
-------------------------

<p>This tool was written using RVM and JRuby, therefore you will need to get both</p>

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
<pre><code>source ~/.rvm/scripts/rvm
</code></pre>
<li>set default gemset
<pre><code>rvm default jruby-1.7.9
</code></pre>
</li>
<li>Install bundler
<pre><code>gem install bundle
</code></pre>
<li>Install gemset
<pre><code>bundle install
</code></pre>
</li>
</ul>

<p>Installation complete!</p>

Tests
-----

<h4>Run Acceptance tests</h4>

<pre><code>cucumber features/
</code></pre>


<h4>Run specs</h4>

<pre><code>rspec spec/
</code></pre>

Usage
-----

<p>CsvJson usage is of the form</p>

<pre><code>convert.rb &lt;file_to_convert&gt;, &lt;desired_file_format&gt;
</code></pre>

<p>Below are some examples of using the tool from the command line</p>

<h4>JSON conversion example</h4>

<pre><code>jruby convert.rb stock_data.csv json
</code></pre>

<h4>XML (simulated) conversion example</h4>

<pre><code>jruby convert.rb stock_data.csv xml
</code></pre>

Development
------------

CsvToJson was coded using the BDD paradigm. Feature tests and rspec's have been included with the source which can be run to validate the code.

The tool has been written with extensibility in mind. The application can be injected with new file generators to accommodate any need. The `XMLGenerator.rb`
has been provided to demonstrate this feature. Other generators, such as a `YAMLGenerator.rb`, could just as easily be built and plugged into the tool via the `convert.rb` ruby script
with minimal change.

Below are the steps required for incorporating a new file generator into the tool:

<ul>
<li>Write your generator, below is a simulated XML generator
</li>


<pre><code>
require 'ApplicationHelper'

class XMLGenerator

  include FileHelper

  attr_accessor :file_name

  def initialize(filename)
    @file_name = filename
  end

  def transform_file
    if valid_filename_format? and file_exists? then generate_xml end
  end

  private
  def generate_xml
    puts 'Pending implementation.. XML Data would be printed here'
  end

end
</code></pre>
</ul>

<ul>
<li>Wire it up. Update the case statement within the convert.rb script to include your new generator
</li>

<pre><code>
...
case desired_format
  when 'json'
    FileTransformer.new(JsonGenerator.new(input_file))
  when 'xml'
    FileTransformer.new(XMLGenerator.new(input_file))
  else
    puts "#{UserMessages::GeneralMessages::VALID_FILE_FORMAT}"
end
...
</code></pre>
</ul>

<ul>
<li>Run tool
</li>

<pre><code>
convert.rb stock_data.csv, xml
</code></pre>

</ul>


