$(document).foundation();

var ww, wh, isMobile, isTablet, isScrolled = true;

function scrollTick()
{
	if (isScrolled)
	{
		isScrolled = false;

		if ($('.title-parallax').length > 0)
		{
			$('.title-parallax').css('background-position', 'center '+Math.round($(window).scrollTop()*0.4)+'px');
		}
	}
	requestAnimationFrame(scrollTick);
}

$('.sub-menu').siblings('a').click(function(){
	$(this).parent().toggleClass('hover');
	if ($(this).parent().hasClass('hover'))
	{
		$(this).html('&times;');
	}
	else
	{
		$(this).html('&equiv;');
	}
});


// Throttled resize function
$(window).on('resize', Foundation.util.throttle(function () {
	ww = $(window).width();
	wh = $(window).height();
	isMobile = Foundation.MediaQuery.current === 'small';
	isTablet = Foundation.MediaQuery.current === 'medium';

	if (isMobile)
	{
		$('.schedule .day-calendar').slideUp(0);
	}
	else
	{
		$('.schedule .day-calendar').slideDown(0);
	}

}, 300));

// init

$(document).ready(function(){
	$(window).resize();
	scrollTick();
});

// mobile size calendar fold

$('.schedule').on('click', '.date-head', function(){
	if (isMobile)
	{
		var $it = $(this).closest('.schedule').find('.day-calendar');
		if ($(this).hasClass('open'))
		{
			$(this).removeClass('open');
			$it.slideUp();
		}
		else {
			$('.schedule .date-head').removeClass('open');
			$(this).addClass('open');
			$('.schedule .day-calendar').not($it).slideUp();
			$it.slideDown();
		}
	}
});

// scroll tick

$(window).scroll(function(){
	isScrolled = true;
});
