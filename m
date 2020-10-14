Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3158AC433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BD48820BED
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 12:55:33 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="O0zGMkYj"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729267AbgJNMza (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 14 Oct 2020 08:55:30 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:56419 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1729912AbgJNMz0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 14 Oct 2020 08:55:26 -0400
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 09ECrFHb008363;
        Wed, 14 Oct 2020 14:55:16 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=from : to : cc : subject
 : date : message-id : in-reply-to : references : mime-version :
 content-type; s=STMicroelectronics;
 bh=owCUp3ap2EbMKfAx/xEipaA99wmq/HRTHA1XL0MNvMw=;
 b=O0zGMkYjrp+snAThNA0jh9W+T3GPMxy6pvDN7c95YYNoBRzLoDpvz/CuF4r+luK3KWCR
 ikz3P22WMC7yDMKvkMYz7syj+C5i6DQ0bHyaOTTKyy1Bhj9JK6angLLj5O34YWzs9+NA
 EP9uIq4pSwk79dbjhFmz964BENdWIgAfsJX5oYfKTu32hoLnpTTwGXzSHTZlCO1iPaSn
 tHBEWzmADnLb+bvNLmM/vj/uLV8T61Qyp2Ra5MnuNs+yfU5Mwdf0gXWxR6FMsLXsKYOR
 B64VTURmSa8p7veUXDdvR9lUz3BVqFnLk+6Jbhv+omImwsmSTcm+4nQciEEIa9VGG2ij 7Q== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3435875uxk-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 14 Oct 2020 14:55:14 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 09872100034;
        Wed, 14 Oct 2020 14:55:13 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id EEED12DA52A;
        Wed, 14 Oct 2020 14:55:12 +0200 (CEST)
Received: from localhost (10.75.127.44) by SFHDAG3NODE1.st.com (10.75.127.7)
 with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 14 Oct 2020 14:55:12
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
Subject: [PATCH v2 3/4] dt-bindings: remoteproc: stm32_rproc: update syscon descriptions
Date:   Wed, 14 Oct 2020 14:54:40 +0200
Message-ID: <20201014125441.2457-4-arnaud.pouliquen@st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20201014125441.2457-1-arnaud.pouliquen@st.com>
References: <20201014125441.2457-1-arnaud.pouliquen@st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.44]
X-ClientProxiedBy: SFHDAG4NODE2.st.com (10.75.127.11) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.235,18.0.687
 definitions=2020-10-14_07:2020-10-14,2020-10-14 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Align other syscon descriptions with st,syscfg-m4-state and
st,syscfg-rsc-tbl descriptions by suppressing the cells
description.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 .../devicetree/bindings/remoteproc/st,stm32-rproc.yaml      | 6 ------
 1 file changed, 6 deletions(-)

diff --git a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
index 3207942d51bf..a1171dfba024 100644
--- a/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
+++ b/Documentation/devicetree/bindings/remoteproc/st,stm32-rproc.yaml
@@ -38,9 +38,6 @@ properties:
   st,syscfg-tz:
     description:
       Reference to the system configuration which holds the RCC trust zone mode
-      - Phandle of syscon block.
-      - The offset of the RCC trust zone mode register.
-      - The field mask of the RCC trust zone mode.
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
     maxItems: 1
 
@@ -91,9 +88,6 @@ properties:
     $ref: "/schemas/types.yaml#/definitions/phandle-array"
     description: |
       Reference to the system configuration which holds the remote
-        1st cell: phandle to syscon block
-        2nd cell: register offset containing the deep sleep setting
-        3rd cell: register bitmask for the deep sleep bit
     maxItems: 1
 
   st,syscfg-m4-state:
-- 
2.17.1

