Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-18.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 24B98C47099
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:23 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 12C8A6023F
	for <linux-remoteproc@archiver.kernel.org>; Fri,  4 Jun 2021 09:14:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230019AbhFDJQH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 4 Jun 2021 05:16:07 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:57386 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S229978AbhFDJQG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 4 Jun 2021 05:16:06 -0400
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 15496nHi028540;
        Fri, 4 Jun 2021 11:14:18 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=from : to : cc :
 subject : date : message-id : in-reply-to : references : mime-version :
 content-type; s=selector1;
 bh=hWeHL/dTAIQeVW4i01Rf5rhS3v5QysYOAQCXNxNaV/M=;
 b=sC0Tmmaju6/0qo5098Eflny3cZmxnwAvvb5+hugHxJ8TPw4aNrto4s4FQ1sFnodPVGUh
 ISQrRkyzJ9+LOG5w81q4qCKdb/KVHnyL8qAZWxcxin9t3tLMiqZuv1Tmp2xmXCbIOEbT
 0+JCqdqtnte5iIT+wXdveiuS7N4ronQ+h28pohcsxI09iVBHHS/Kx0fa+yM06kGpphOT
 VBUNSNFX0swQnGraYCRjzWgz464WemmvZGIxcmmjn/WxAehEeNkEyzjZ423agIMmbjkG
 7djwaHqs0MxWmKacF5idk/gbOf6GAeiwkuvlVgUwv1shpr4YqUMnwZgLEcAxU8iWu9gk tA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 38yg960gre-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Fri, 04 Jun 2021 11:14:18 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 733A910003A;
        Fri,  4 Jun 2021 11:14:18 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node3.st.com [10.75.127.6])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 6513D216EEF;
        Fri,  4 Jun 2021 11:14:18 +0200 (CEST)
Received: from localhost (10.75.127.50) by SFHDAG2NODE3.st.com (10.75.127.6)
 with Microsoft SMTP Server (TLS) id 15.0.1497.2; Fri, 4 Jun 2021 11:14:17
 +0200
From:   Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>,
        <arnaud.pouliquen@foss.st.com>
Subject: [PATCH 2/4] rpmsg: ctrl: Introduce RPMSG_RELEASE_DEV_IOCTL
Date:   Fri, 4 Jun 2021 11:14:04 +0200
Message-ID: <20210604091406.15901-3-arnaud.pouliquen@foss.st.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
References: <20210604091406.15901-1-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE3.st.com
 (10.75.127.6)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.391,18.0.761
 definitions=2021-06-04_05:2021-06-04,2021-06-04 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Implement the RPMSG_RELEASE_DEV_IOCTL to allow the user application to
release a rpmsg device created either by the remote processor or with
the RPMSG_CREATE_DEV_IOCTL call.
Depending on the back-end implementation, the associated rpmsg driver is
removed and a NS destroy rpmsg can be sent to the remote processor.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
---
 drivers/rpmsg/rpmsg_ctrl.c | 7 +++++++
 include/uapi/linux/rpmsg.h | 5 +++++
 2 files changed, 12 insertions(+)

diff --git a/drivers/rpmsg/rpmsg_ctrl.c b/drivers/rpmsg/rpmsg_ctrl.c
index 4aa962df3661..cb19e32d05e1 100644
--- a/drivers/rpmsg/rpmsg_ctrl.c
+++ b/drivers/rpmsg/rpmsg_ctrl.c
@@ -98,6 +98,13 @@ static long rpmsg_ctrldev_ioctl(struct file *fp, unsigned int cmd,
 		}
 		break;
 
+	case RPMSG_RELEASE_DEV_IOCTL:
+		ret = rpmsg_release_channel(ctrldev->rpdev, &chinfo);
+		if (ret)
+			dev_err(&ctrldev->dev, "failed to release %s channel (%d)\n",
+				chinfo.name, ret);
+		break;
+
 	default:
 		ret = -EINVAL;
 	}
diff --git a/include/uapi/linux/rpmsg.h b/include/uapi/linux/rpmsg.h
index f9d5a74e7801..38639ba37438 100644
--- a/include/uapi/linux/rpmsg.h
+++ b/include/uapi/linux/rpmsg.h
@@ -38,4 +38,9 @@ struct rpmsg_endpoint_info {
  */
 #define RPMSG_CREATE_DEV_IOCTL	_IOW(0xb5, 0x3, struct rpmsg_endpoint_info)
 
+/**
+ * Release a local rpmsg device.
+ */
+#define RPMSG_RELEASE_DEV_IOCTL	_IOW(0xb5, 0x4, struct rpmsg_endpoint_info)
+
 #endif
-- 
2.17.1

