$('.center').slick({
  centerMode: true,
  infinite: true,
  arrows: true,
  centerPadding: '25%',
  slidesToShow: 1,
  speed: 500,
  variableWidth: false,
  dots: false,
  responsive: [
    {
      breakpoint: 768,
      settings: {
        arrows: true,
        centerMode: true,
        centerPadding: '10%',
        slidesToShow: 1
      }
    },
    {
      breakpoint: 480,
      settings: {
        arrows: true,
        centerMode: false,
        centerPadding: '40px',
        slidesToShow: 1
      }
    }
  ]
});
