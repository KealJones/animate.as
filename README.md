#animate.as
*Just-add-water ActionScript animation*

`animate.as` is a bunch of cool, fun, and ActionScript animations for you to use in your projects. Great for emphasis, home pages, sliders, and general just-add-water-awesomeness.
animate.as was built using TweenNano for ease of use, reliability, and scalability.

##Usage
To use animate.as in your flash project, simply drop the class into your `com` folder, and import the class `com.kealjones.anim.Animate`, then call the function `Animate.to(target,"fadeInDown");`. That's it! You've got an ActionScript animated element. Super!

```html
import com.kealjones.anim.Animate;
Animate.to(target,"fadeInDown");
```

Since animate.as was based on TweenNano it slightly emulates TweenNano's syntax for simple adoption.

```javascript
Animate.to(targetMovieClip,"animationString",onCompleteFunction,["onCompleteParams","MoreParams"]);
```

More Animations are being added, hopefully soon it will contain more animations than you will ever need.

## License
animate.as is licensed under the MIT license. (http://opensource.org/licenses/MIT)

## Credits
This project is a semi-port of animate.css by Daniel Eden (http://daneden.github.io/animate.css)
