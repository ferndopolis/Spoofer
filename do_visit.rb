#!/usr/bin/ruby
#run script
require 'visit_spoofer'
make_ps_req('192.168.1.80:3000',{500 => [{:sid => 12, :requests => 5},
                     {:sid => 15, :requests => 2},
                     {:sid => 17, :requests => 20}],
             501 => [{:sid => 9, :requests => 5},
                     {:sid => 30, :requests => 20}],
             505 => [{:sid => 39, :requests => 18}]
})


