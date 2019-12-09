<%@ page language="java" contentType="text/html; charset=UTF-8"  pageEncoding="UTF-8" isELIgnored="false"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt"  prefix="fmt"%>
<%
    request.setCharacterEncoding("UTF-8");
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
<head>
    <meta name="viewport" content="width=device-width, user-scalable=no, minimum-scale=1.0, maximum-scale=1.0">
    <title>doubleRighttt</title>
    <!--引入JQuery的JS文件：JQuery的JS文件要在BootStrap的js的文件的前面引入-->
    <script type="text/javascript" src="${pageContext.request.contextPath}/js/jquery-1.11.3.min.js" ></script>
    <script src="${pageContext.request.contextPath}/js/three.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/tween.module.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/TrackballControls.js"></script>
    <script src="${pageContext.request.contextPath}/js/CSS3DRenderer.js"></script>

    <script>
        function fangdajing() {
            var sc = document.creatElement('style');
            sc.innerHTML="                  "
        }
    </script>
    <style>
        html,
        body {
            height: 100%;
        }

        body {
            background-color: #000000;
            margin: 0;
            font-family: Helvetica, sans-serif;
        ;
            overflow: hidden;
        }

        a {
            color: #ffffff;
        }

        #info {
            position: absolute;
            width: 100%;
            color: #ffffff;
            padding: 5px;
            font-family: Monospace;
            font-size: 13px;
            font-weight: bold;
            text-align: center;
            z-index: 1;
        }

        .menu {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            font-family: verdana, Tahoma, Arial, Hei, "Microsoft Yahei", SimHei;
        }

        .m {
            position: absolute;
            bottom: 20px;
            width: 100%;
            text-align: center;
            font-family: verdana, Tahoma, Arial, Hei, "Microsoft Yahei", SimHei;
            padding-left: 850px;
            padding-top: 90px;
        }

        .element {
            width: 150px;
            height: 200px;
            box-shadow: 0px 0px 12px rgba(0, 255, 255, 0.5);
            border: 1px solid rgba(127, 255, 255, 0.25);
            text-align: center;
            cursor: default;
        }


        .element .number {
            position: absolute;
            top: 20px;
            right: 20px;
            font-size: 12px;
            color: rgba(127, 255, 255, 0.75);
        }

        .element .symbol {
            position: absolute;
            top: 40px;
            left: 0px;
            right: 0px;
            font-size: 15px;
            font-weight: bold;
            color: rgba(255, 255, 255, 0.75);
            text-shadow: 0 0 10px rgba(0, 255, 255, 0.95);
        }

        .element .details {
            position: absolute;
            bottom: 15px;
            left: 0px;
            right: 0px;
            font-size: 12px;
            color: rgba(127, 255, 255, 0.75);
        }

        button {
            color: rgba(127, 255, 255, 0.75);
            background: transparent;
            outline: 1px solid rgba(127, 255, 255, 0.75);
            border: 0px;
            padding: 5px 10px;
            cursor: pointer;
        }

        button:hover {
            background-color: rgba(0, 255, 255, 0.5);
        }

        button:active {
            color: #000000;
            background-color: rgba(0, 255, 255, 0.75);
        }
    </style>
</head>
<body>
<div id="container"></div>
<div id="info">
    <h3>doubleRighttt</h3>
    <div class="m">
        <button id="message">留言</button>
    </div>
</div>
<div class="menu">
    <button id="table">表面</button>
    <button id="sphere">球体</button>
    <button id="helix">螺旋</button>
    <button id="grid">网格</button>
</div>

<script>
    $(function () {
        $("#message").click(function () {
            window.open("login.jsp");
        });
    });
</script>
<script>
    //这里是定义table元素放入展示的内容,在后面再对table进行解析
    var table = ${ml};
    var camera, scene, renderer;
    var controls;

    var objects = [];
    var targets = {
        table: [],
        sphere: [],
        helix: [],
        grid: []
    };

    init();
    animate();

    function init() {

        camera = new THREE.PerspectiveCamera(40, window.innerWidth / window.innerHeight, 1, 10000);
        //透视投影相机,PerspectiveCamera(fov, aspect, near, far)
        // - fov 可视角度
        // - aspect 为width/height,通常设置为canvas元素的高宽比。
        // - near近端距离
        // - far远端距离
        //只有离相机的距离大于near值，小于far值，且在相机的可视角度之内，才能被相机投影到。

        camera.position.z = 3000;
        //3000是camera的竖直高度,可以理解为值越大可见度越大

        scene = new THREE.Scene();


        // table 表格
        //这里是对table表格里的数据进行解析,然后分配到每个div中构成模块
        for (var i = 0; i < table.length; i += 5) {

            var element = document.createElement('div');
            element.className = 'element';
            element.style.backgroundColor = 'rgba(0,127,127,' + (Math.random() * 0.5 + 0.25) + ')';

            var number = document.createElement('div');
            number.className = 'number';
            number.textContent = (i / 5) + 1;
            element.appendChild(number);

            var symbol = document.createElement('div');
            symbol.className = 'symbol';
            symbol.textContent = table[i];
            element.appendChild(symbol);

            var details = document.createElement('div');
            details.className = 'details';
            details.innerHTML = table[i + 1] + '<br>' + table[i + 2];
            element.appendChild(details);

            var object = new THREE.CSS3DObject(element);
            object.position.x = Math.random() * 4000 - 2000;
            object.position.y = Math.random() * 4000 - 2000;
            object.position.z = Math.random() * 4000 - 2000;
            scene.add(object);

            objects.push(object);



            var object = new THREE.Object3D();
            object.position.x = (table[i + 3] * 165) - 1320;
            object.position.y = -(table[i + 4] * 215) + 990;

            targets.table.push(object);

        }

        // sphere 球

        var vector = new THREE.Vector3();

        for (var i = 0, l = objects.length; i < l; i++) {

            var phi = Math.acos(-1 + (2 * i) / l);
            var theta = Math.sqrt(l * Math.PI) * phi;

            var object = new THREE.Object3D();

            object.position.x = 800 * Math.cos(theta) * Math.sin(phi);
            object.position.y = 800 * Math.sin(theta) * Math.sin(phi);
            object.position.z = 800 * Math.cos(phi);

            vector.copy(object.position).multiplyScalar(2);

            object.lookAt(vector);

            targets.sphere.push(object);

        }

        // helix 螺旋

        var vector = new THREE.Vector3();

        for (var i = 0, l = objects.length; i < l; i++) {

            var phi = i * 0.175 + Math.PI;

            var object = new THREE.Object3D();

            object.position.x = 950 * Math.sin(phi);
            object.position.y = -(i * 8) + 490;
            object.position.z = 950 * Math.cos(phi);

            vector.x = object.position.x * 2;
            vector.y = object.position.y;
            vector.z = object.position.z * 2;

            object.lookAt(vector);

            targets.helix.push(object);

        }

        // grid 网格

        for (var i = 0; i < objects.length; i++) {

            var object = new THREE.Object3D();

            object.position.x = ((i % 5) * 400) - 800;
            object.position.y = (-(Math.floor(i / 5) % 5) * 400) + 800;
            object.position.z = (Math.floor(i / 25)) * 1000 - 2000;

            targets.grid.push(object);

        }

        //

        renderer = new THREE.CSS3DRenderer();
        renderer.setSize(window.innerWidth, window.innerHeight);
        renderer.domElement.style.position = 'absolute';
        document.getElementById('container').appendChild(renderer.domElement);

        //

        controls = new THREE.TrackballControls(camera, renderer.domElement);
        controls.rotateSpeed = 0.5; //旋转速度
        controls.minDistance = 500; //最小距离
        controls.maxDistance = 10000; //最大距离
        controls.addEventListener('change', render);

        var button = document.getElementById('table');
        button.addEventListener('click', function(event) {

            transform(targets.table, 2000); //展示表格

        }, false);

        var button = document.getElementById('sphere');
        button.addEventListener('click', function(event) {

            transform(targets.sphere, 2000); //展示球

        }, false);

        var button = document.getElementById('helix');
        button.addEventListener('click', function(event) {

            transform(targets.helix, 2000); //展示螺旋

        }, false);

        var button = document.getElementById('grid');
        button.addEventListener('click', function(event) {

            transform(targets.grid, 2000); //展示网格

        }, false);

        transform(targets.table, 5000);

        //

        window.addEventListener('resize', onWindowResize, false);

    }


    function transform(targets, duration) {
        //targets对象,duration持续时间

        TWEEN.removeAll();

        for (var i = 0; i < objects.length; i++) {

            var object = objects[i];
            var target = targets[i];

            new TWEEN.Tween(object.position)
                .to({
                    x: target.position.x,
                    y: target.position.y,
                    z: target.position.z
                }, Math.random() * duration + duration)
                .easing(TWEEN.Easing.Exponential.InOut)
                .start();

            new TWEEN.Tween(object.rotation)
                .to({
                    x: target.rotation.x,
                    y: target.rotation.y,
                    z: target.rotation.z
                }, Math.random() * duration + duration)
                .easing(TWEEN.Easing.Exponential.InOut)
                .start();

        }

        new TWEEN.Tween(this)
            .to({}, duration * 2)
            .onUpdate(render)
            .start();

    }

    function onWindowResize() {

        camera.aspect = window.innerWidth / window.innerHeight;
        camera.updateProjectionMatrix();

        renderer.setSize(window.innerWidth, window.innerHeight);

        render();

    }

    function animate() {

        requestAnimationFrame(animate);

        TWEEN.update();

        controls.update();

    }

    function render() {

        renderer.render(scene, camera);

    }
</script>
</body>
</html>





