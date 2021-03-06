# Copyright 2016 Google, Inc
#
# Licensed under the Apache License, Version 2.0 (the "License");
# you may not use this file except in compliance with the License.
# You may obtain a copy of the License at
#
#     http://www.apache.org/licenses/LICENSE-2.0
#
# Unless required by applicable law or agreed to in write, software
# distributed under the License is distributed on an "AS IS" BASIS,
# WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
# See the License for the specific language governing permissions and
# limitations under the License.

# [START all]
# [START import_libraries]
require "google/cloud/vision"
# [END import_libraries]

# [START detect_landmark]
def detect_landmarks path_to_image_file:
  # [START get_vision_service]
  vision = Google::Cloud::Vision.new
  # [END get_vision_service]

  # [START construct_request]
  image    = vision.image path_to_image_file
  landmark = image.landmark
  # [END construct_request]

  # [START print_landmark]
  puts "Found landmark: #{landmark.description}" unless landmark.nil?
  # [END print_landmarks]
end

# [START run_application]
if __FILE__ == $PROGRAM_NAME
  image_file = ARGV.shift

  if image_file
    detect_landmarks path_to_image_file: image_file
  else
    puts <<-usage
Usage: ruby detect_landmarks.rb image_file

Example:
  ruby detect_landmarks.rb images/eiffel_tower.jpg
    usage
  end
end
# [END run_application]
# [END detect_landmark]
# [END all]
