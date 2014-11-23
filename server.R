library(shiny)

# calcBMI performs the calculations needed to determine a person's body fat.
calcBMI <- function(weight, waist, wrist, hips, forearm, gender) 
{
    # if the weight is 0, return 0 to avoid divide by zero errors below.
    if(weight == 0)
    {
        0
    }
    else
    {
        # If the person is male, the BMI depends on weight and waist size only
        if(gender == 'male')
        {
            LeanBodyMass <- weight * 1.082 + 94.42 - waist * 4.15
        }
        # If the person is female, the BMI depends on all the inputs
        else
        {
            LeanBodyMass <- weight * .732 + 8.987 + wrist/3.14 - waist*.157 - hips*.249 + forearm*.434
        }
    
        BodyFatWeight <- weight - LeanBodyMass
        BodyFatPercentage <- BodyFatWeight*100/weight
        BodyFatPercentage
    }
}

# Take all the inputs, pass them to the BMI calculation function, and then store the result in an output
# variable
shinyServer(
    function(input, output) {
        output$bodyFat <- renderPrint({calcBMI(input$weight, input$waist, input$wrist, input$hips, input$forearm, input$gender)})
    }
)