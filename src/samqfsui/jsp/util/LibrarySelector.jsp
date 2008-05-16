 <%--

/*
 *    SAM-QFS_notice_begin
 *
 * CDDL HEADER START
 *
 * The contents of this file are subject to the terms of the
 * Common Development and Distribution License (the "License").
 * You may not use this file except in compliance with the License.
 *
 * You can obtain a copy of the license at pkg/OPENSOLARIS.LICENSE
 * or http://www.opensolaris.org/os/licensing.
 * See the License for the specific language governing permissions
 * and limitations under the License.
 *
 * When distributing Covered Code, include this CDDL HEADER in each
 * file and include the License file at pkg/OPENSOLARIS.LICENSE.
 * If applicable, add the following below this CDDL HEADER, with the
 * fields enclosed by brackets "[]" replaced with your own identifying
 * information: Portions Copyright [yyyy] [name of copyright owner]
 *
 * CDDL HEADER END
 */
/*
 * Copyright 2008 Sun Microsystems, Inc.  All rights reserved.
 * Use is subject to license terms.
 *
 *    SAM-QFS_notice_end
 */

// ident	$Id: LibrarySelector.jsp,v 1.5 2008/05/16 19:39:24 am143972 Exp $
--%>

<%@page info="LibrarySelector" language="java" %>
<%@taglib uri="/WEB-INF/tld/com_iplanet_jato/jato.tld" prefix="jato"%>
<%@taglib uri="/WEB-INF/tld/com_sun_web_ui/cc.tld" prefix="cc"%>
<%@taglib uri="samqfs.tld" prefix="samqfs"%>

<jato:useViewBean className="com.sun.netstorage.samqfs.web.util.LibrarySelectorViewBean">

<!-- helper javascript -->
<script type="text/javascript" src="/samqfsui/js/samqfsui.js"></script>
<script type="text/javascript" src="/samqfsui/js/popuphelper.js"></script>
<script type="text/javascript" src="/samqfsui//js/CommonTasks.js"></script>
<script>
function doSubmit(button) {
    return handleImportTapeVSNs(button);
}
</script>

<!-- header -->
<cc:header pageTitle="commontasks.selector.library.pagetitle"
           copyrightYear="2007"
           baseName="com.sun.netstorage.samqfs.web.resources.Resources"
           bundleID="samBundle"
           onLoad="initializePopup(this);">

<!-- masthead -->
<cc:secondarymasthead name="SecondaryMasthead" bundleID="samBundle"/>

<!-- the form and its contents -->
<jato:form name="LibrarySelectorForm" method="POST">

<!-- feedback alert -->
<cc:alertinline name="Alert" bundleID="samBundle"/>

<!-- page title -->
<cc:pagetitle name="pageTitle"
              bundleID="samBundle"
              pageTitleText="commontasks.selector.library.pagetitle"
              showPageTitleSeparator="true"
              showPageButtonsTop="false"
              showPageButtonsBottom="true">

<table cellspacing="10"><tr><td>
<cc:label name="libraryLabel"
          elementName="library"
          defaultValue="commontasks.selector.library.label"
          bundleID="samBundle"/>
</td><td>
<cc:dropdownmenu name="library"/>
</td></tr>
</table>

</cc:pagetitle>
</jato:form>
</cc:header>
</jato:useViewBean>
