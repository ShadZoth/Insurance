<%@ page defaultCodec="html" %>
<%@ page import="org.springframework.util.ClassUtils" %>
<%@ page import="grails.plugin.searchable.internal.lucene.LuceneUtils" %>
<%@ page import="grails.plugin.searchable.internal.util.StringQueryUtils" %>
<html>
<head>
    <meta name='layout' content='main'/>
    <meta http-equiv="content-type" content="text/html; charset=UTF-8">
    <title>Поиск</title>
    <style type="text/css">

    #search_page_in {
        padding: 10px;
    }
    #header_search_in {
        padding-left: 20px;
    }
    #header_search_in form input {
        padding: 1.5em;
    }

    #header_search_in .hint {
        color: gray;
    }

    #header_search_in h1 a {
        text-decoration: none;
        font-family: Georgia, serif;
        color: dimgray;
    }

    #header_search_in h1 {
        letter-spacing: -0.1em;
        float: left;
    }

    #header_search_in h1 span {
        font-family: Georgia, serif;
        color: #424242;
    }

    #header_search_in form {
        margin-left: 22em;
        padding-top: .1em;
    }

    #search_page_in .title {
        margin: 1em 0;
        padding: .3em .5em;
        text-align: right;
        background-color: seashell;
        border-top: 1px solid lightblue;
    }

    #search_page_in .result {
        margin-bottom: 1em;
    }

    #search_page_in .result .displayLink {
        color: green;
    }

    #search_page_in .result .name {
        font-size: larger;
    }

    #search_page_in .paging a.step {
        padding: 0 .3em;
    }

    .paging span.currentStep {
        font-weight: bold;
    }

    #search_page_in ul {
        margin: 1em 2em;
    }

    #search_page_in li, p {
        margin-bottom: 1em;
    }
    </style>
    <script type="text/javascript">
        var focusQueryInput = function () {
            document.getElementById("querySearch").focus();
        }
    </script>
</head>

<body onload="focusQueryInput();">
<div id="search_page_in">
    <div id="header_search_in">
        <h1>Поиск</h1>
        %{--<g:form url='[controller: "searchable", action: "index"]' id="searchableForm" name="searchableForm" method="get">--}%
        %{--<g:textField name="q" value="${params.q}" size="50"/> <input type="submit" value="Search"/>--}%
        %{--</g:form>--}%
    </div>

    <div id="main">
        <g:set var="haveQuery" value="${params.q?.trim()}"/>
        <g:set var="haveResults" value="${searchResult?.results}"/>
        <div class="title">
            <span>
                <g:if test="${haveQuery && haveResults}">
                    Результаты <strong>${searchResult.offset + 1}</strong> - <strong>${searchResult.results.size() + searchResult.offset}</strong> of <strong>${searchResult.total}</strong>
                    по запросу <strong>${params.q}</strong>
                </g:if>
                <g:else>
                    &nbsp;
                </g:else>
            </span>
        </div>

        <g:if test="${haveQuery && !haveResults && !parseException}">
            <p>Ничего не найдено по вашему запросу - <strong>${params.q}</strong></p>
            <g:if test="${!searchResult?.suggestedQuery}">
                <p>Советы:</p>
                <ul>
                    <li>Проверьте корректность введенного запроса</li>
                    <li>Проверьте, обладаете ли вы достаточным уровнем доступа к запрашиваемым данным</li>
                </ul>
            </g:if>
        </g:if>

        <g:if test="${searchResult?.suggestedQuery}">
            <p>Did you mean <g:link controller="searchable" action="index"
                                    params="[q: searchResult.suggestedQuery]">${StringQueryUtils.highlightTermDiffs(params.q.trim(), searchResult.suggestedQuery)}</g:link>?</p>
        </g:if>

        <g:if test="${parseException}">
            <p>Your query - <strong>${params.q}</strong> - is not valid.</p>

            <p>Suggestions:</p>
            <ul>
                <li>Fix the query: see <a
                        href="http://lucene.apache.org/java/docs/queryparsersyntax.html">Lucene query syntax</a> for examples
                </li>
                <g:if test="${LuceneUtils.queryHasSpecialCharacters(params.q)}">
                    <li>Remove special characters like <strong>" - [ ]</strong>, before searching, eg, <em><strong>${LuceneUtils.cleanQuery(params.q)}</strong>
                    </em><br/>
                        <em>Use the Searchable Plugin's <strong>LuceneUtils#cleanQuery</strong> helper method for this: <g:link
                                controller="searchable" action="index"
                                params="[q: LuceneUtils.cleanQuery(params.q)]">Search again with special characters removed</g:link>
                        </em>
                    </li>
                    <li>Escape special characters like <strong>" - [ ]</strong> with <strong>\</strong>, eg, <em><strong>${LuceneUtils.escapeQuery(params.q)}</strong>
                    </em><br/>
                        <em>Use the Searchable Plugin's <strong>LuceneUtils#escapeQuery</strong> helper method for this: <g:link
                                controller="searchable" action="index"
                                params="[q: LuceneUtils.escapeQuery(params.q)]">Search again with special characters escaped</g:link>
                        </em><br/>
                        <em>Or use the Searchable Plugin's <strong>escape</strong> option: <g:link
                                controller="searchable"
                                action="index"
                                params="[q: params.q, escape: true]">Search again with the <strong>escape</strong> option enabled</g:link>
                        </em>
                    </li>
                </g:if>
            </ul>
        </g:if>

        <g:if test="${haveResults}">
            <div class="results">
                <g:each var="result" in="${searchResult.results}" status="index">
                    <div class="result">
                        <g:set var="className" value="${ClassUtils.getShortName(result.getClass())}"/>
                        <g:set var="link"
                               value="${createLink(controller: className[0].toLowerCase() + className[1..-1], action: 'show', id: result.id)}"/>
                        <div class="name"><a href="${link}">${className} #${result.id}</a></div>
                        <g:set var="desc" value="${result.toString()}"/>
                        <g:if test="${desc.size() > 120}"><g:set var="desc" value="${desc[0..120] + '...'}"/></g:if>
                        <div class="desc">${desc.encodeAsHTML()}</div>

                        <div class="displayLink">${link}</div>
                    </div>
                </g:each>
            </div>

            <div>
                <div class="paging">
                    <g:if test="${haveResults}">
                        Page:
                        <g:set var="totalPages" value="${Math.ceil(searchResult.total / searchResult.max)}"/>
                        <g:if test="${totalPages == 1}"><span class="currentStep">1</span></g:if>
                        <g:else><g:paginate controller="searchable" action="index" params="[q: params.q]"
                                            total="${searchResult.total}" prev="&lt; previous"
                                            next="next &gt;"/></g:else>
                    </g:if>
                </div>
            </div>
        </g:if>
    </div>
</div>
</body>
</html>
