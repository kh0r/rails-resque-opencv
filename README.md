rails-resque-opencv
=============

Minimal sample to run asynchronous Jobs with Resque & OpenCV in a Rails application
Unfortunately the job crashes with a SEGFAULT. See https://github.com/ruby-opencv/ruby-opencv/issues/45

To start resque-worker simply enter:
<pre><code>bundle exec rake QUEUE=test_opencv_queue resque:work</code></pre>

To enqueue a job, start the rails server & open the startpage
