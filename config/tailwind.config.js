const defaultTheme = require('tailwindcss/defaultTheme')

module.exports = {
  content: [
    './public/*.html',
    './app/helpers/**/*.rb',
    './app/javascript/**/*.js',
    './app/views/**/*.{erb,haml,html,slim}'
  ],
  theme: {
    extend: {
      fontFamily: {
        poppins: ['Poppins', 'sans-serif'],
        montserrat: ['Montserrat', 'sans-serif'],
      },
      textJustify: {
        'inter-word': 'inter-word',
      },
      colors: {
        'scb-black': '#111111',
        'scb-blue': '#5893D4',
        'scb-green': '#44CF6C',
        'scb-gray': '#E7ECEF',
        'scb-dark-gray': '#737373',
        'scb-white': '#ffffff',
        'red-700': '#E53E3E',
      },
      maxHeight: {
        '132': '132px',
        '382': '382px',
      },
      minHeight: {
        '132': '132px',
        '382': '382px',
      },
    },
  },
  plugins: [
    require('@tailwindcss/forms'),
    require('@tailwindcss/typography'),
    require('@tailwindcss/container-queries'),
  ]
}
