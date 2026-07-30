xmlport 50061 "impt standard resp cntr"
{
    Format = VariableText;

    schema
    {
        textelement(impt_standard_resp_cntr)
        {
            tableelement("Responsibility Center"; "Responsibility Center")
            {
                AutoUpdate = true;
                XmlName = 'resp_cntr';
                fieldelement(code; "Responsibility Center".Code)
                {
                }
            }
        }
    }

    requestpage
    {

        layout
        {
        }

        actions
        {
        }
    }
}

