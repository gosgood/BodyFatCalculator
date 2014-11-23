library(shiny)

# This application measures a person's body fat based on various characteristics, including
# weight, waist size, wrist size, hip size, forearm size, and gender.  We collect those inputs,
# let the server calculate the body fat based on them, and then display the body fat percentage.
shinyUI(pageWithSidebar(
    headerPanel("Body Fat Calculator"),
    sidebarPanel(
        p("Documentation:",a("Body Fat Calculator", href="help.html", target="_blank")),
        numericInput('weight', 'Weight, in pounds', 0, min = 0, step = 1),
        numericInput('waist', 'Waist size, in inches', 0, min = 0, step = 1),
        numericInput('wrist', 'Wrist size, in inches', 0, min = 0, step = 1),
        numericInput('hips', 'Hip size, in inches', 0, min = 0, step = 1),
        numericInput('forearm', 'Forearm size, in inches', 0, min = 0, step = 1),
        radioButtons('gender', 'Gender', c('Female' = 'female', 'Male' = 'male'))
    ),
    mainPanel(
        h3('Your overall body fat percentage'),
        verbatimTextOutput("bodyFat")
    )
))


