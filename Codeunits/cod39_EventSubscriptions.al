codeunit 50139 EventSubscriptions
// CSD1.00 - 2018-01-01 - D. E. Veloper
// Chapter 7 - Lab 2-1
{
    [EventSubscriber(ObjectType::Codeunit, 212, 'OnBeforeResLedgEntryInsert', '', true, true)]
    local procedure PostResJnlLineOnBeforeResLedgEntryInsert(var ResLedgerEntry: Record "Res. Ledger Entry"; ResJournalLine: Record "Res. Journal Line");
    var
        c: Codeunit "Res. Jnl.-Post Line";
    begin
        ResLedgerEntry."CSD Seminar No." := ResJournalLine."CSD Seminar No.";
        ResLedgerEntry."CSD Seminar Registration No." := ResJournalLine."CSD Seminar Registration No.";
    end;

    [EventSubscriber(Page::Navigate, Codeunit::, '', '', true, true)]
    local procedure OnAfterNavigateShowRecords(TableID: Integer; DocNoFilter: Text; PostingDateFilter: Text; ItemTrackingSearch: Boolean)
    var
        SeminarLedgerEntry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
    begin
        case TableID of
            Database::"CSD Posted Seminar Reg. Header":
                begin
                    PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
                    PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, PostedSeminarRegHeader);
                End;
            Database::"CSD Seminar Ledger Entry":
                begin
                    SeminarLedgerEntry.SetFilter("No.", DocNoFilter);
                    SeminarLedgerEntry.SetFilter("Posting Date", PostingDateFilter);
                    Page.Run(0, SeminarLedgerEntry);
                End;
        end;


    end;

    [EventSubscriber(ObjectType::Page, Page::Navigate, 'OnAfterNavigateFindRecords', '', true, true]
    local procedure ExtendNavigateOnAfterNavigateFindRecords(VAR DocumentEntry: Record "Document Entry"; DocNoFilter: Text; PostingDateFilter: Text)
    var
        Seminarledgerentry: Record "CSD Seminar Ledger Entry";
        PostedSeminarRegHeader: Record "CSD Posted Seminar Reg. Header";
        DocNoOfRecords: Integer;
        NextEntryNo: Integer;
    begin
        if PostedSeminarRegHeader.ReadPermission() then begin
            PostedSeminarRegHeader.Reset();
            PostedSeminarRegHeader.SetFilter("No.", DocNoFilter);
            PostedSeminarRegHeader.SetFilter("Posting Date", PostingDateFilter);
            DocNoOfRecords := PostedSeminarRegHeader.Count();
            With DocumentEntry do begin
                if DocNoOfRecords = 0 then
                    exit;
                if Findlast then
                    NextEntryNo := NextEntryNo + 1
                else
                    NextEntryNo := 1;
                Init;
                "Entry No." := NextEntryNo;
                "Table ID" := Database::"CSD Posted Seminar Reg. Header";
                "Document Type" := 0;
                "Table Name" := Copystr(PostedSeminarRegHeader.TableCaption(), 1, Maxstrlen("Table Name"));
                "No. of Records" := DocNoOfRecords;
                Insert;
            end;
        end;
    end;
}
