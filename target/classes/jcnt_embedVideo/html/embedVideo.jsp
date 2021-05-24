<%@ page language="java" contentType="text/html;charset=UTF-8" %>
<%@ taglib prefix="template" uri="http://www.jahia.org/tags/templateLib" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="jcr" uri="http://www.jahia.org/tags/jcr" %>
<%@ taglib prefix="ui" uri="http://www.jahia.org/tags/uiComponentsLib" %>
<%@ taglib prefix="functions" uri="http://www.jahia.org/tags/functions" %>
<%@ taglib prefix="query" uri="http://www.jahia.org/tags/queryLib" %>
<%@ taglib prefix="utility" uri="http://www.jahia.org/tags/utilityLib" %>
<%@ taglib prefix="s" uri="http://www.jahia.org/tags/search" %>
<%--@elvariable id="currentNode" type="org.jahia.services.content.JCRNodeWrapper"--%>
<%--@elvariable id="out" type="java.io.PrintWriter"--%>
<%--@elvariable id="script" type="org.jahia.services.render.scripting.Script"--%>
<%--@elvariable id="scriptInfo" type="java.lang.String"--%>
<%--@elvariable id="workspace" type="java.lang.String"--%>
<%--@elvariable id="renderContext" type="org.jahia.services.render.RenderContext"--%>
<%--@elvariable id="currentResource" type="org.jahia.services.render.Resource"--%>
<%--@elvariable id="url" type="org.jahia.services.render.URLGenerator"--%>
<c:set var="provider" value="${currentNode.properties.provider.string}"/>
<c:set var="id" value="${currentNode.properties.id.string}"/>
<c:set var="title" value="${currentNode.properties['jcr:title'].string}"/>
<c:if test="${renderContext.editMode}">
    <div class="alert alert-info" role="alert">
        Provider: ${provider}<br/>
        ID: ${id}
    </div>
</c:if>
<c:if test="${! empty title}">
    <h4>${title}</h4>
</c:if>
<c:choose>
    <c:when test="${provider eq 'youtube'}">
        <div class="embed-responsive embed-responsive-16by9">
            <iframe frameborder="0" allowfullscreen="" src="https://www.youtube.com/embed/${id}?showinfo=0&amp;wmode=opaque&amp;hl=fr&amp;cc_lang_pref=fr&amp;cc_load_policy=1"></iframe>
        </div>
    </c:when>
    <c:when test="${provider eq 'vimeo'}">
        <div class="embed-responsive embed-responsive-16by9">
            <iframe src="//player.vimeo.com/video/${id}" frameborder="0" webkitallowfullscreen mozallowfullscreen allowfullscreen></iframe>
        </div>
    </c:when>
    <c:when test="${provider eq 'wistia'}">
        <script src="https://fast.wistia.com/embed/medias/${id}.jsonp" async></script><script
            src="https://fast.wistia.com/assets/external/E-v1.js" async></script><div class="wistia_responsive_padding"
                                                                                      style="padding:56.25% 0 0 0;position:relative;"><div class="wistia_responsive_wrapper"
                                                                                                                                           style="height:100%;left:0;position:absolute;top:0;width:100%;"><span
            class="wistia_embed wistia_async_${id} popover=true popoverAnimateThumbnail=true videoFoam=true"
            style="display:inline-block;height:100%;position:relative;width:100%">&nbsp;</span></div></div>
    </c:when>
</c:choose>
