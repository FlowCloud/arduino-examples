# Returning structrured data through FlowCloud

This sketch demonstrates structered data through FlowMessaging.

The sketch allows the LED state to be toggled and can return the LED state, uptime and even calulate pi to 5 decimal places.

The data uses XML and an example status follows:
```
<status>
  <ledstatus>
    <led1>
      ON
    </led1>
  </ledstatus>
  <uptime>
    2323
  </uptime>
  <pi>
    3.14159
  </pi>
</status>
```

Check out the Flow on Arduino blog for more details. 