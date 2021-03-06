# Copyright (c) 2011 Wilker Lúcio
#
# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:
#
# The above copyright notice and this permission notice shall be included in
# all copies or substantial portions of the Software.
#
# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
# THE SOFTWARE.

$: << File.expand_path("../../lib", __FILE__)

require 'aidmock'

RSpec::Matchers.define :have_mock_result do |value|
  match do |framework|
    framework.mocks[0].result == value
  end

  failure_message_for_should do |framework|
    "expected the result to be #{value}, got #{framework.mocks[0].result.inspect}"
  end
end

RSpec::Matchers.define :have_mock_arguments do |value|
  match do |framework|
    framework.mocks[0].arguments == value
  end

  failure_message_for_should do |framework|
    "expected the arguments to be #{value}, got #{framework.mocks[0].arguments.inspect}"
  end
end

RSpec::Matchers.define :matches do |value|
  match do |matcher|
    matcher.match? value
  end

  failure_message_for_should do |matcher|
    %{expected the matcher #{matcher.class.name} to matches #{value.inspect}}
  end

  failure_message_for_should_not do |matcher|
    %{expected the matcher #{matcher.class.name} to don't matches #{value.inspect}}
  end
end
