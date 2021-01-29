# Home Assistant sip2mqtt Add-on
 
Home Assistant add-on inspired by MartyTremblay / https://github.com/MartyTremblay/pjsip-docker 
and minoruta / https://github.com/minoruta/pjsip-node-alpine

## Notes
1. Installation of this add-on takes a __long__ time as it compiles the pjsip Pyhton buildings from C. In other words, be patient...
2. This addon is basedon Alpine 3.10 as it is the last version to support Python 2. Unfortunately, pjsip Python 3 binding isn't fully supported yet.

## configuration.yaml
```
sensor:
  - platform: mqtt
    name: Home Phone Status
    unique_id: home_phone_status
    state_topic: "home/sip"
    icon: "mdi:phone-ring"
    value_template: '{{ value_json.verb }}'
    json_attributes_topic: "home/sip"
```

## sensor
![alt text](https://raw.githubusercontent.com/raph2i/hassio-addons/master/sip2mqtt/pic.png "mqtt_sensor")
