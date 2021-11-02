Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABB65C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 12:38:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7CFA760F24
	for <linux-remoteproc@archiver.kernel.org>; Tue,  2 Nov 2021 12:38:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229924AbhKBMlY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 2 Nov 2021 08:41:24 -0400
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:54816 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S229557AbhKBMlY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 2 Nov 2021 08:41:24 -0400
Received: from pps.filterd (m0241204.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with ESMTP id 1A2A7Umr011675;
        Tue, 2 Nov 2021 13:38:41 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : mime-version : content-type; s=selector1;
 bh=fiHhS2Mb7kwte0tsuCAFhpaUls6IvBjNVIQ/S4SDy1g=;
 b=icOoH+XRauc55CGZP2dmSImAVNf/ZkmUg9OIC2x15kSzSzngOp00m3mJsh4IhUza6Zql
 ReYXby2LFHigK0frV6vU6JoFFoO9oDjJ5BJYDQ/4Cn2S3Zr0Haf0DhsYsF7DQPA1YMc7
 hp+yLLb0smnueRpFWRrhaCngXnBrgNeOPLriMIhUP0uppwNlVYdJlJK+8sygfCn0eBcU
 Iov43u/cq8sIhFRi/7K4USNcVMMOXbUg4G2Sw0ztVZgA7tlLdG/3EERfstMNsIxcAdIq
 T0ELHPiToShB0j6sIH9BERSnWGuzJUbq/VnlPfFH/4PxPJeL8OhsUx8SxwXXeiLyPEAR MQ== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3c2jfj51t7-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Tue, 02 Nov 2021 13:38:41 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 7F8AA10002A;
        Tue,  2 Nov 2021 13:38:40 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 73F97231DC7;
        Tue,  2 Nov 2021 13:38:40 +0100 (CET)
Received: from localhost (10.75.127.46) by SFHDAG2NODE2.st.com (10.75.127.5)
 with Microsoft SMTP Server (TLS) id 15.0.1497.18; Tue, 2 Nov 2021 13:38:40
 +0100
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        Jiri Slaby <jirislaby@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <arnaud.pouliquen@foss.st.com>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <linux-kernel@vger.kernel.org>, <linux-remoteproc@vger.kernel.org>
Subject: [PATCH] MAINTAINERS: Add rpmsg tty driver maintainer
Date:   Tue, 2 Nov 2021 13:38:17 +0100
Message-ID: <20211102123817.19874-1-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.46]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.425,FMLib:17.0.607.475
 definitions=2021-11-02_08,2021-11-02_01,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Adding myself as rpmsg tty maintainer and also adding remoteproc
mailing list to inform about changes in the driver.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 MAINTAINERS | 6 ++++++
 1 file changed, 6 insertions(+)

diff --git a/MAINTAINERS b/MAINTAINERS
index ba9f6537abc3..e234a740707b 100644
--- a/MAINTAINERS
+++ b/MAINTAINERS
@@ -16482,6 +16482,12 @@ T:	git git://linuxtv.org/media_tree.git
 F:	Documentation/devicetree/bindings/media/allwinner,sun8i-a83t-de2-rotate.yaml
 F:	drivers/media/platform/sunxi/sun8i-rotate/
 
+RPMSG TTY DRIVER
+M:	Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
+L:	linux-remoteproc@vger.kernel.org
+S:	Maintained
+F:	drivers/tty/rpmsg_tty.c
+
 RTL2830 MEDIA DRIVER
 M:	Antti Palosaari <crope@iki.fi>
 L:	linux-media@vger.kernel.org
-- 
2.17.1

