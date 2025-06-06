/// This is a sample business rule to deal with cats and dogs
Class dc.Demo.FilterPostsRoutingRule Extends Ens.Rule.Definition
{

Parameter RuleAssistClass = "EnsLib.MsgRouter.RuleAssist";

XData RuleDefinition [ XMLNamespace = "http://www.intersystems.com/rule" ]
{
<ruleDefinition alias="" context="EnsLib.MsgRouter.RoutingEngine" production="dc.Demo.Production">
<variable name="company"></variable>
<ruleSet name="" effectiveBegin="" effectiveEnd="">
<rule name="">
<constraint name="msgClass" value="dc.Demo.PostMessage"></constraint>
<when condition="(ToUpper(Document.Post.Selftext)) Contains &quot;DOG&quot;" comment="">
<assign property="Document.ToEmailAddress" value="&quot;dog@company.com&quot;"></assign>
<assign property="Document.Found" value="&quot;Dog&quot;"></assign>
<send transform="" target="dc.Demo.FileOperation"></send>
<return></return>
</when>
<when condition="ToUpper(Document.Post.Selftext) Contains &quot;CAT&quot;" comment="">
<assign property="Document.ToEmailAddress" value="&quot;cat@company.com&quot;"></assign>
<assign property="Document.Found" value="&quot;Cat&quot;"></assign>
<send transform="" target="dc.Demo.FileOperation"></send>
<return></return>
</when>
<otherwise>
<return></return>
</otherwise>
</rule>
</ruleSet>
</ruleDefinition>
}

}
