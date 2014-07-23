library(shiny)

shinyUI(fluidPage(withMathJax(),
    titlePanel(span("Wahrscheinlichkeitsverteilung der Störgrößen", style = "color:white"),
                windowTitle = "Störgrößen"),
                  
    sidebarLayout(position = "right",
        sidebarPanel(
                                	
        wellPanel(style = "background-color: #FFFFFF;", h5("Bedienfenster"),
        sliderInput('Number.of.Samples', 'Stichproben \\( (S) \\)', 
                    value = 1, min = 1, max = 1000, step = 1, animate = animationOptions(interval = 800,
                    playButton = HTML('<p align="right"><button type="button" class="btn btn-small btn-primary">
                    <span class="icon-play"></span> Start </button></p>'),
                    pauseButton = HTML('<p align="right"><button type="button" class="btn btn-small btn-primary">
                    <span class="icon-pause"></span> Pause </button></p>') )),
                    checkboxInput("checkbox", label = "Wahrscheinlichkeitsverteilung", value = T),
                    shinysky::actionButton('action', 'Stichprobenerzeugung', styleclass = 'success'),
                    downloadButton('downloadPlot', 'Grafik herunterladen')),
    br(),
    br(),
                                    
                                    
    wellPanel(p(strong("Redaktion"), style = 'margin-bottom:1px;color:black;'),
            HTML("<p style='margin-bottom:1px;color:black;'>Programmierung: Andranik Stepanyan</p>"),
            p("Text: Ludwig von Auer", style = "color:black"),
            HTML("<a , style='margin-bottom:1px;color:black;' href = 'https://www.uni-trier.de/index.php?id=50126' target='_blank'>Professur für Finanzwissenschaft</a>"),
            p("Fachbereich IV - Volkswirtschaftslehre", style = 'margin-bottom:1px;color:black;'),
            p("Universität Trier", style = "color:black"),
            p(strong("Lehrbuch"), style = 'margin-bottom:1px; color:black;'),
            HTML("<p style = 'color:black;'>Auer, Ludwig <a href = 'https://www.uni-trier.de/index.php?id=15929' target='_blank'><img src='buch.jpg' style='float: right;'></a>von (2013),
                    <a href = 'https://www.uni-trier.de/index.php?id=15929' target='_blank' style='color:black'>Ökonometrie - eine Einführung,<br>
                    6. Auflage, Springer-Gabler<a/> </p>"),
                                    					
    br(),
    br(),
    HTML('<div class="btn-group dropup">
        <a class="btn btn-info dropdown-toggle" data-toggle="dropdown" href="#">
        Weitere Animationen
        <span class="caret"></span>
        </a>
        <ul class="dropdown-menu">
        <p style="margin-bottom:1px;">&nbsp; Störgrößen</p>
        <p style="margin-bottom:1px;color:black;"><a href="https://oekonometrie.shinyapps.io/WiederholteStichproben/" target="_blank">&nbsp; KQ-Schätzer</p>
        <a href="https://oekonometrie.shinyapps.io/Intervallschaetzer/" target="_blank">&nbsp; Intervallschätzer</a>
        <p style="margin-bottom:1px;"><a href="https://oekonometrie.shinyapps.io/t-Test/" target="_blank">&nbsp; t-Test</a></p>
        <p style="margin-bottom:1px;"><a href="https://oekonometrie.shinyapps.io/Ftest/" target="_blank">&nbsp; F-Test versus t-Test</a></p>                           							 
        </ul>
        </div>')),
    list(tags$head(tags$style("body {background-color: #6d6d6d; }")))
),
    mainPanel(
            
    wellPanel(wellPanel(style = "background-color: #FFFFFF;",
                        plotOutput("densityPlot", height = "350px"))),
    wellPanel(style = "background-color: #DEEBF7;",
    tabsetPanel(type = "pills",
            
    tabPanel(h5("Was wird veranschaulicht?"),
p("In der Animation können Sie beobachten, wie für die drei
abgebildeten Störgrößen in jeder wiederholten Stichprobe immer neue Werte
erzeugt werden und wie sich bei steigendem Stichprobenumfang die geschätzte
Wahrscheinlichkeitsverteilung jeder Störgröße der Normalverteilung annährt.",
	style = "color:black") ),
 
    tabPanel(h5("Was zeigt die Anfangseinstellung?"),
p("Die Animation greift das Trinkgeld-Beispiel des Lehrbuches
auf. Für jeden Gast \\( t \\) wird das beobachtete Trinkgeld \\( y_{t} \\)
durch den Rechnungsbetrag \\( x_{t} \\) erklärt: $$y_{t}=α+βx_{t}+u_{t}$$ Die
drei Gäste der Stichprobe haben die Rechnungsbeträge \\( x_{1} = 10 \\), \\(
x_{2} = 30 \\) und \\( x_{3} = 50 \\). Jeder Gast hat seine eigene Störgröße: 
\\( u_{1} \\), \\( u_{2} \\) und \\( u_{3} \\). Alle drei Störgrößen sind
normalverteilt mit Erwartungswert \\( E(u_{t})=0 \\) und Störgrößenvarianz \\(
\\sigma^{2} = 2 \\). Die roten senkrechten Striche in den drei Grafiken 
markieren die Störgrößenwerte der ersten Stichprobe: \\( u_{1} = 0,5 \\), \\(
u_{2} = -1,1 \\) und \\( u_{3} = 0,3 \\).", style = "color:black" )),

    tabPanel(h5("Benutzungshinweise"), 
p(HTML("<p style='color:black;'>Wenn Sie im Bedienfenster auf <img src =
'Start.jpg'> klicken, werden weitere Stichproben erzeugt und die sich dabei 
ergebenden neuen Störgrößenwerte \\( u_{1} \\), \\( u_{2} \\) und \\( u_{3}
\\) werden ebenfalls in die drei Grafiken eingetragen. Wenn Ihnen der Prozess
zu langsam verläuft, klicken Sie einfach mit der linken Maustaste auf den
Stichproben-Schieber <img src = 'slider.jpg'> und bewegen sie ihn nach rechts
auf die Anzahl an Stichproben \\( S \\), welche Sie erzeugen wollen. Wenn Sie
im Bedienfeld den Knopf <img src = 'stich.jpg'> klicken, werden \\( S \\) neue
Stichproben erzeugt und die alten werden gelöscht.</p>"),
HTML('<p style="color:black;">Die bräunlichen Kurven zeigen die aus den erzeugten
Störgrößenwerten geschätzten Wahrscheinlichkeitsverteilungen. Wenn Sie im
Bedienfenster links neben dem Schriftzug „Wahrscheinlichkeitsverteilung" auf
den Haken klicken, verschwindet dieser und es werden keine
Wahrscheinlichkeitsverteilungen geschätzt.</p>'),
HTML("<p style='color:black;'>Um die aktuelle Grafik in einer jpg-Datei zu speichern, 
klicken Sie auf das Feld <img src = 'download.jpg'>.</p>"), HTML("<p
style='color:black;'>Um Animationen zu anderen ökonometrischen Themen zu
sehen, klicken Sie bitte auf <img src = 'info.jpg'>.</p>") )),

    tabPanel(h5("Details"), p("Die Animation ist mit dem statistischen
Programm R erzeugt worden. Es ist zu beachten, dass die Dichte der Sörgrößen
mit Gaußkern berechnet ist. Wobei die Bandbreite gemäß der Faustregel von
Silverman ermittelt wurde (Silverman, B. W. (1986), Density Estimation for
Statistics and Data Analysis, Chapman and Hall, London, S. 47 f).",HTML("<p
style='color:black;'>Die entsprechenden R-Skripte für die Reproduktion dieser
Seite sind unter folgendem Link aufrufbar:
<a href='https://github.com/andronikoss/Stoergroessen' target='_blank'>R
Codes.</a></p>"), style = "color:black"
    ))

    )),
br(),
br(),
br())

    )
))      





































