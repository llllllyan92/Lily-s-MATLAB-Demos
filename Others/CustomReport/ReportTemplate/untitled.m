import mlreportgen.report.*;
import mlreportgen.dom.*;
%%
rpt = Report("report","docx");
titlePage = TitlePage('Title','VDM Software Detailed Design');
titlePage.TemplateSrc = fullfile(pwd,"titlePageTemplate.dotx");
titlePage.Subtitle = 'Version 1.0.0.0';
%%
append(rpt,titlePage);
close(rpt);
rptview(rpt);