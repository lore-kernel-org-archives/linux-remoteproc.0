Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 16E3AC433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Mar 2021 09:43:11 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id DF8BF61A45
	for <linux-remoteproc@archiver.kernel.org>; Fri, 26 Mar 2021 09:43:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230094AbhCZJmj (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 26 Mar 2021 05:42:39 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:21164 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229761AbhCZJmb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 26 Mar 2021 05:42:31 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 12Q9RON0028997;
        Fri, 26 Mar 2021 10:42:29 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=dZG1xFLM/pSDG+IqSCLf3eiur3BbtYeJz9BtuCio8Fw=;
 b=vXMsM12PX0zoFz3wG2eJZq2QapPItF4h1Dg4nZ5ykWrv9MxVmk3kwI1g0H8cAQn18RAm
 xTlF9adnF3DQPH+BNzVDtfJdl9ozlLJnPoIMXkQAFw7Ab83Neh5M6o/M6g/pTwFnjvyX
 ZE18KJa8Zr3Lexzj9D6z7e11thAItGTW5K2mIpCN9Hv+IeyXK2ez/YmtuS/Uf3BW8YRJ
 /SgoX33MjMuDmbvhrdFsXOCVHU1md90bQcQwFOK8ygAMxfDajBrZRvGk3J4JFDnu2qXk
 vPG5jMRg1+VHzAcofmNBt4pW5eON3C6lMFltYnte8hhmUpsAB20SH2q8M5ysuQQmemxm Lw== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 37h13638hu-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 26 Mar 2021 10:42:29 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 5BC5110002A;
        Fri, 26 Mar 2021 10:42:29 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 4EC012463D6;
        Fri, 26 Mar 2021 10:42:29 +0100 (CET)
Received: from localhost (10.75.127.49) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 26 Mar 2021 10:42:28
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH v3 1/2] dt-bindings: remoteproc: stm32-rproc: add new mailbox channel for detach
Date:   Fri, 26 Mar 2021 10:42:08 +0100
Message-ID: <20210326094209.29750-2-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
References: <20210326094209.29750-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.49]
X-ClientProxiedBy: SFHDAG3NODE2.st.com (10.75.127.8) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.369,18.0.761
 definitions=2021-03-26_03:2021-03-26,2021-03-26 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add the "detach" mailbox item, that allows to define a mailbox to
send a IPCC signal to the remote processor on remoteproc detach action.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
No Update from V2.

Update from V1:
Fix indentation error reported by 'make dt_binding_check'.

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

