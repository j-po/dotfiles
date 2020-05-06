{:tools
 {:plugins [[lein-ancient "0.6.15"]]}
 :user
 {:plugins [[cider/cider-nrepl "0.24.0"]
            #_[venantius/ultra "0.5.2"]
            #_[venantius/pyro "0.1.1"]
            #_[lein-exec "0.3.7"]
            [lein-kibit "0.1.8"]
            #_[lein-pprint "1.2.0"]
            #_[jonase/eastwood "0.3.5"]
            #_[lein-cljfmt "0.6.4"]
            #_[lein-cloverage "1.1.1"]]
  :aliases {"rebl" ["trampoline" "run" "-m" "rebel-readline.main"]}}}
