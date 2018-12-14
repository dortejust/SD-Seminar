page 50100 "CDS Seminar Setup Card"
{
    PageType = Card;
    ApplicationArea = All;
    UsageCategory = Administration;
    SourceTable = "CSD Seminar Setup";
    Caption = 'Seminar Setup';

    layout

    {

        area(Content)
        {
            group(Numbering)

            {
                field("CSD Primary Key"; "CSD Primary Key")
                {
                    ApplicationArea = All;

                }
                field("CSD Seminar Registration Nos."; "CSD Seminar Registration Nos.")
                {
                    ApplicationArea = All;

                }
                field("CSD Semniar Nos."; "CSD Semniar Nos.")
                {
                    ApplicationArea = All;

                }
                field("Posted Seminar Reg. Nos."; "Posted Seminar Reg. Nos.")
                {
                    ApplicationArea = All;

                }
            }
        }
    }

    var
        myInt: Integer;

}