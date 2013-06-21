#
# Cookbook Name:: openstack-common
# library:: networks
#
# Copyright 2013, Craig Tracey <craigtracey@gmail.com>
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in writing, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.
#

module ::Openstack

  # Function to grab the IP address of a specific network interface
  def interface_ip(name, type='inet')
    interface_node = node["network"]["interfaces"][name]["addresses"]
    ip_address = interface_node.select do |address, data|
      if data['family'] == type
        return address
      end
    end
  end

end
