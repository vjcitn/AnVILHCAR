#> colnames(sam)
# [1] "samples_id"                     "pfb:organ_part.itemsType"      
# [3] "pfb:organ_part.items"           "pfb:document_id.itemsType"     
# [5] "pfb:document_id.items"          "pfb:biomaterial_id.itemsType"  
# [7] "pfb:biomaterial_id.items"       "pfb:entity_type.itemsType"     
# [9] "pfb:entity_type.items"          "pfb:model_organ.itemsType"     
#[11] "pfb:model_organ.items"          "pfb:organ.itemsType"           
#[13] "pfb:organ.items"                "pfb:effective_organ.itemsType" 
#[15] "pfb:effective_organ.items"      "pfb:model_organ_part.itemsType"
#[17] "pfb:model_organ_part.items"   

#' exploration app
#' @import shiny
#' @import AnVILGCP
#' @note This shiny app, in development, will navigate the AnVIL DATA elements of an AnVIL workspace.
#' It is tailored at present to help explore the outputs of the Human Cell Atlas portal "Export
#' to terra" functions.
#' @export
exploreHCAexport = function() {
 dat = avtables()
 pro = avtable("projects")
 prtitle = pro[, "pfb:project_title.items"] |> unlist()
 fi = avtable("files")
 sam = avtable("samples")
 sn = names(sam)
 sn = setdiff(sn, "pfb:document_id.items")
 samlim = sam[, c("pfb:organ.items", "pfb:effective_organ.items", "pfb:organ_part.items")]
 filim = fi[, c("pfb:content_description.items", "pfb:file_format", "pfb:size", "pfb:drs_uri")]
 format_freq = list("formatFreq"=table(fi[["pfb:file_format"]]))
 ui = fluidPage(
   sidebarLayout(
    sidebarPanel(
     helpText("HCA import explorer"), 
     helpText("Project title:"),
     helpText(prtitle),
     width=2
     ),
    mainPanel(
     tabsetPanel(
      tabPanel("tables", DT::dataTableOutput("alltab")),
      tabPanel("files", verbatimTextOutput("formatfreq"), DT::dataTableOutput("files")),
      tabPanel("samples", DT::dataTableOutput("samples")),
      tabPanel("about", helpText("AnVILHCAR package support")),
      tabPanel("fullfiles", DT::dataTableOutput("fullfiles")),
      tabPanel("fullsamples", DT::dataTableOutput("fullsam")),
      )
     )
    )
   )
 server = function(input, output) {
  output$formatfreq = renderPrint(format_freq)
  output$alltab = DT::renderDataTable(dat)
  output$files = DT::renderDataTable(filim)
  output$samples = DT::renderDataTable(samlim)
  output$fullfiles = DT::renderDataTable(fi)
  output$fullsam = DT::renderDataTable(sam[,sn])
 }
 runApp(list(ui=ui, server=server))
}
  
 


		    

