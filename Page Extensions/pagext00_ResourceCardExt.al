pageextension 50100 "CSD ResourceCardExt Page" extends "Resource Card"
{
    layout
    {
        addlast(General)
        {
            field("CSD Resource Type"; "CSD Resource Type")

            {
            }


            field("CSD Quantity per Day"; "CSD Quantity per Day")
            {

            }

        }
        addafter("Personal Data")
        {
            group("CSD Room")
            {
                Caption = 'Room';

            }
        }

    }

    trigger OnAfterGetRecord();
    begin
        ShowMaxField := (Type = Type::Machine);
        CurrPage.Update(false);

    end;

    var
        [InDataSet]
        ShowMaxField: Boolean
}

