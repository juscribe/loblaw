describe('application.js', function() {

  describe('Events', function() {
    var $sandbox, $element;

    beforeEach(function() {
      setFixtures(sandbox({ class: 'sandboxClass' }));
      $sandbox = $('#sandbox');
    });

    describe('.comingSoon', function() {
      describe('on click', function() {
        beforeEach(function() {
          $element = $('<a class="comingSoon">Click Me!</a>');
          $sandbox.append($element);
        });

        it('calls preventDefault on the click event', function() {
          var clickEvent = $.Event('click');
          spyOn(clickEvent, 'preventDefault');
          $element.trigger(clickEvent);
          expect(clickEvent.preventDefault).toHaveBeenCalled();
        });

        // Kind of an alternate, less hacky way
        it('actually prevents default', function() {
          var spyEvent = spyOnEvent($element, 'click');
          $element.click();
          expect('click').toHaveBeenPreventedOn($element);
          expect(spyEvent).toHaveBeenPrevented();
        });

        it('calls stopPropagation on the click event', function() {
          var clickEvent = $.Event('click');
          spyOn(clickEvent, 'stopPropagation');
          $element.trigger(clickEvent);
          expect(clickEvent.stopPropagation).toHaveBeenCalled();
        });
      });

      it('has the tooltip plugin behavior attached', function() {
        expect($element.tooltip).toBeDefined();
      });

      it('initializers the tooltip plugin with desired options', function() {
        spyOn(jQuery.fn, 'tooltip');
        var $newElement = $('<p class="comingSoon">Some paragraph</p>');
        // expect(jQuery.fn.tooltip).not.toHaveBeenCalled();
        // $sandbox.append($newElement);
        // expect(jQuery.fn.tooltip).not.toHaveBeenCalled();
        // $newElement.click();
        // expect(jQuery.fn.tooltip).toHaveBeenCalled();
        expect($newElement.tooltip).toBeDefined();
        expect(typeof $newElement.tooltip).toEqual('function');
      });
    });
  });

  describe('Juscribe', function() {

    it('is defined at the main level', function() {
      expect(Juscribe).toBeDefined();
    });

    it('is an object', function() {
      expect(typeof Juscribe).toEqual('object');
    });

    it('has a Page property which is a function', function() {
      expect(Juscribe.Page).toBeDefined();
    });

    describe('.Page', function() {
      var result;

      beforeEach(function() {
        result = new Juscribe.Page('myController', 'myAction', 'myId');
      });

      it('is a function (constructor)', function() {
        expect(typeof Juscribe.Page).toEqual('function');
      });

      it('constructs an object', function() {
        expect(result).toBeDefined();
        expect(typeof result).toEqual('object');
      });

      describe('constructed object', function() {

        it('has a controller property', function() {
          expect(result.controller).toEqual('myController');
        });

        it('has an action property', function() {
          expect(result.action).toEqual('myAction');
        });

        it('has an id property', function() {
          expect(result.id).toEqual('myId');
        });
      });
    });
  });
});
