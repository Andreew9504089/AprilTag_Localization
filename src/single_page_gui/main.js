var app = new Vue({
    el:'#control_gui',
    data: {
        connected: false,
        failure: false,
        ros: null,
        ws_address: 'ws://0.0.0.0:9090',
        logs: [],
        loading: false,
        topic: null,
        message: null,
        enable_takeoff: false,
        enable_return: false,
        destination: '',
        direction: 1,
        cruise_height: 1,
        hover_time: 15
    },
    methods: {
        connect: function(){
            console.log('Connecting...')
            this.ros = new ROSLIB.Ros({
                url: this.ws_address
            })
            this.ros.on('connection', () => {
                this.logs.unshift((new Date()).toTimeString() + ' - connected')
                this.connected = true
                this.failure = false
                console.log('Connected')
                
                //TODO
                /* Determine whether the uav is static*/ 
                //if yes
                this.enable_takeoff = true
                this.enable_return = false

                this.showCamera()
            })
            this.ros.on('error', (error) => {
                this.failure = true
                this.logs.unshift((new Date()).toTimeString() + ' - Cannot establish connection with server')
                console.log('Connection Failed', error)
            })
            this.ros.on('close', () => {
                if(!(this.failure)){
                    this.logs.unshift((new Date()).toTimeString() + ' - disconnected')
                    this.connected = false
                    console.log('Connection Closed')
                }   
            })
        },
        disconnect: function(){
            this.ros.close()
            this.connected = false
            console.log('Connection Closed')
        },
        showCamera: function(){
            console.log('set camera method')
            this.cameraViewer = new MJPEGCANVAS.Viewer({
                divID: 'mjpeg',
                host: '0.0.0.0',
                width: 640,
                height: 480,
                topic: '/iris1/camera_forward/color/image_raw',
                port: 8080,
            })
            document.getElementById("cam_topic").innerHTML = '/iris1/camera_forward/color/image_raw';
        },
        takeoff: function(){
            console.log('UAV takeoff')
            this.logs.unshift((new Date()).toTimeString() + 'UAV takeoff')
            //TODO
            /* Publish Takeoff signal */
            this.enable_return = true
            this.enable_takeoff = false
        },
        returning: function(){
            console.log('uav returning')
            this.logs.unshift((new Date()).toTimeString() + 'UAV returning')
            
            //TODO
            /* Publish uav landing signal */
            this.enable_return = false
            this.enable_takeoff = true
        },
        stop: function(){
            console.log('uav stopping')
            this.logs.unshift((new Date()).toTimeString() + 'UAV stopping')
            //TODO
            /*Send emergency stop signal (LAND DIRECTLY)*/
            this.enable_return = false
            this.enable_takeoff = false
        },
        startFlight: function(){
            //TODO
            /*Send goal point, direction, hover_time & cruise_height*/

        },
        chooseDirection: function(action){
            if(document.getElementById("left_btn").disabled || document.getElementById("right_btn").disabled){
                document.getElementById("left_btn").disabled = false;
                document.getElementById("right_btn").disabled = false;
            }else{
                switch(action){
                    case "left":
                        this.direction = 0;
                        document.getElementById("left_btn").disabled = false;
                        document.getElementById("right_btn").disabled = true;
                        break;
                    case "right":
                        this.direction = 1;
                        document.getElementById("left_btn").disabled = true;
                        document.getElementById("right_btn").disabled = false;
                        break;
                }
            }

        }
    },
    updated(){
        //TODO
        //Read these info from ros topic
        document.getElementById("uav_id").innerHTML = "1";
        document.getElementById("uav_status").innerHTML = "Cruising";
        document.getElementById("uav_location").innerHTML = "Nav point";

        if(this.destination == ''){
            document.getElementById("btn_start").disabled = true;
        }else{
            document.getElementById('btn_start').disabled = false;
        }   
    },
})
