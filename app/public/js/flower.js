var boxes = document.querySelectorAll('.box');

for (var i = 0; i < boxes.length; i++) {
    var box = boxes[i];

    var animate = box.animate([{
        transform: 'rotate(' + Math.random() * (-100 - 100) + 0 +'deg)',
        opacity: 0,
        offset: 0,
        blur: 0
    }, {
        transform: 'rotate(' + Math.random() * (0 - 180) + 0 +'deg)',
        opacity: .7,
        offset: 1,
        blur: 1,
    }, ], {
        duration: 7500,
        easing: 'cubic-bezier(0.77, 0, 0.175, 1)',
        delay: i * 100,
        iterations: Infinity,
        direction: 'alternate',
        fill: 'both'
    });
}