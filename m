Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7C30AC433E2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:36:38 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5E55B619DB
	for <linux-remoteproc@archiver.kernel.org>; Wed, 31 Mar 2021 07:36:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234003AbhCaHgH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 31 Mar 2021 03:36:07 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:44058 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S234107AbhCaHfm (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 31 Mar 2021 03:35:42 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12V7W6Kq000671;
        Wed, 31 Mar 2021 09:35:29 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=IeHxfLmsaKojnEfoxgRyw8CnxhiIhINNKvdtNDXRh1k=;
 b=o9ldYfFQSf1wRLYJyaoZyoxFmrHKexf8eDFgsp+vK4/rlqzg0ex+9G3uwQpVF1LBYpZA
 zIFWjo0eEFYvx3FU2614I9IqFnN9E9zQOYor5uVNuiYq5JvK3roJBb2dyvar5hxTrPLp
 amhLto3FWhLdnXVjrx+krd3H0qTR1DhZzvumXwyO2neDcogOc3KGOdTYyfrZvZoKJ1RI
 km+pYSqNOA8fr9a7+02CWhxudnx0a7ZOXpwpgDOgr6tHenytkPeNRFYWaIzCvJFQxQCp
 O7TVpnlhaJeRjAQxiKJWazlcG4ZpFIhWHPx3LOUHusq5CW4gU6guG3V1oeb516IcpZYC 5w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37maa2jvga-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 31 Mar 2021 09:35:29 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id B6010100034;
        Wed, 31 Mar 2021 09:35:28 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id A5B9F224823;
        Wed, 31 Mar 2021 09:35:28 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Wed, 31 Mar 2021 09:35:28
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v4 1/2] dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach
Date:   Wed, 31 Mar 2021 09:33:46 +0200
Message-ID: <20210331073347.8293-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
References: <20210331073347.8293-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG1NODE1.st.com (10.75.127.1) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-31_01:2021-03-30,2021-03-31 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the "detach" mailbox item, that allows to define a mailbox to
send a IPCC signal to the remote processor on remoteproc detach action.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Reviewed-by: Rob Herring <robh@kernel.org>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml           | 11 +++++++++--
 1 file changed, 9 insertions(+), 2 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index a1171dfba024..64afdcfb613d 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -65,16 +65,23 @@ properties:
           Unidirectional channel:
             - from local to remote, where ACK from the remote means that it is
               ready for shutdown
+      - description: |
+          A channel (d) used by the local proc to notify the remote proc that it
+          has to stop interprocessor communnication.
+          Unidirectional channel:
+            - from local to remote, where ACK from the remote means that communnication
+              as been stopped on the remote side.
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   mbox-names:
     items:
       - const: vq0
       - const: vq1
       - const: shutdown
+      - const: detach
     minItems: 1
-    maxItems: 3
+    maxItems: 4
 
   memory-region:
     description:
-- 
2.17.1

