Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4371C43467
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 446BE20BED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:34 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="FADOcfjh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729886AbgJNMzZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 08:55:25 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:56100 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729267AbgJNMzY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 08:55:24 -0400
Received: from pps.filterd (m0046037.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09ECr9no003174;
        Wed, 14 Oct 2020 14:55:13 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=jPr7oz6V/C/0BCEXLC3ve38DWAGIvboOAC9KbnxfjRg=;
 b=FADOcfjh94aoXJOAUwU11FS9n2wTKyglNEX1KyRCI6gxkZOAUInXdcIxhR+xUoYOnH/k
 dCKuZwwTkBbRsbPGlzWb0bgMkMsrBn5PcX4VWtbLYHilekkHdOkewdSGBw7gDyYobXdD
 ctgOgS0SqyOrkUazbpjbM7ThiZzvF43Ys3wp1x9XKNo7axj8iY90N7taDJWh9NeqBvP/
 GmSS2VNxrB/GwVGDqkSehm/ZxoAApFqcNoIuRInAqAc4ZC9tfUS7UrPQM19f2wrvRmj6
 C1IrfwwxxirRfV/K2Y9mqPCPXjYwoRgISZJLatfv5cbe+zBTfzI+LUU0q1q/whWN2tPp 6Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34356edsr4-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 14:55:13 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id E092810002A;
        Wed, 14 Oct 2020 14:55:11 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id D1AC82DA52A;
        Wed, 14 Oct 2020 14:55:11 +0200 (CEST)
Received: from localhost (10.75.127.45) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:11
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@st.com>
To:     Rob Herring <robh@kernel.org>,
        Alexandre Torgue <alexandre.torgue@st.com>
CC:     <devicetree@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        Arnaud Pouliquen <arnaud.pouliquen@st.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ahmad Fatoum <a.fatoum@pengutronix.de>
Subject: [PATCH v2 2/4] dt-bindings: remoteproc: stm32_rproc: update for firmware synchronization
Date:   Wed, 14 Oct 2020 14:54:39 +0200
Message-ID: <20201014125441.2457-3-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.45]
X-ClientProxiedBy: SFHDAG7NODE3.st.com (10.75.127.21) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_07:2020-10-14,2020-10-14 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add new properties description used to attach to a pre-loaded
firmware according to the commit 9276536f455b3
("remoteproc: stm32: Parse syscon that will manage M4 synchronisation")
which updates the driver part.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../bindings/remoteproc/st,stm32-rproc.yaml       | 15 +++++++++++++++
 1 file changed, 15 insertions(+)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 4ffa25268fcc..3207942d51bf 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -96,6 +96,19 @@ properties:
         3rd cell: register bitmask for the deep sleep bit
     maxItems: 1
 
+  st,syscfg-m4-state:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which exposes the Cortex-M4 state.
+    maxItems: 1
+
+  st,syscfg-rsc-tbl:
+    $ref: "/schemas/types.yaml#/definitions/phandle-array"
+    description: |
+      Reference to the tamp register which references the Cortex-M4
+      resource table address.
+    maxItems: 1
+
   st,auto-boot:
     $ref: /schemas/types.yaml#/definitions/flag
     description:
@@ -122,6 +135,8 @@ examples:
       resets = <&rcc MCU_R>;
       st,syscfg-holdboot = <&rcc 0x10C 0x1>;
       st,syscfg-tz = <&rcc 0x000 0x1>;
+      st,syscfg-rsc-tbl = <&tamp 0x144 0xFFFFFFFF>;
+      st,syscfg-m4-state = <&tamp 0x148 0xFFFFFFFF>;
     };
 
 ...
-- 
2.17.1

