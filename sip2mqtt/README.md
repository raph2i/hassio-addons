# sip2mqtt
 
Dockerfile inspired by MartyTremblay / https://github.com/MartyTremblay/pjsip-docker 
and minoruta / https://github.com/minoruta/pjsip-node-alpine

## configuration.yaml
```
sensor:
  - platform: mqtt
    name: sip2mqtt
    state_topic: "home/sip"
    value_template: '{{ value_json.verb }}'
    json_attributes_topic: "home/sip"
```

## hass sensor
![alt text](https://raw.githubusercontent.com/raph2i/hassio-addons/master/sip2mqtt/pic.png "mqtt_sensor")
