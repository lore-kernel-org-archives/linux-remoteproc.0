Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.3 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AA824C2D0E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:22:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30E1121D91
	for <linux-remoteproc@archiver.kernel.org>; Thu, 12 Nov 2020 18:22:00 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=st.com header.i=@st.com header.b="Ilr9ToLt"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726293AbgKLSV7 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 12 Nov 2020 13:21:59 -0500
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:54344 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S1726194AbgKLSV7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 12 Nov 2020 13:21:59 -0500
Received: from pps.filterd (m0046661.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.42/8.16.0.42) with SMTP id 0ACI70kh030349;
        Thu, 12 Nov 2020 19:21:55 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=IIY7oSVszrrP52r40D2VAywfdHgEmTtymOnkPmjPvm4=;
 b=Ilr9ToLtA3Nfe5jmtgr9OY4LjeANSqzu1ECvRpJQJ4iey/1sDa9xfUnYdU02XErt2ghS
 vuDolZ8/D+t3lHFpkl6VFpGRx7q4zDhaYMLj9ppTLSKfe+vvfFwML7le0VopVNgPT+72
 L1Oh8XFcresCpSNJiYN4O+4Jq8LUz1LlQbZ2bHFPWroVZ2x8qqtWnFUoTgHnBdLzmERH
 Dh57XLm9uEIu7jEFL4XlwsLBvTk3WXXhFS267hp6mpDBmbVlef6a82O5HJipXPZS8Hp3
 Q11huOyusfm15quXhVBFW0twL6pQL6TqB2B1bofTqMpu454k1HcPE/xYuM051yrIBa0h 2w== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 34nkbnew8h-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 12 Nov 2020 19:21:55 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id AE48610002A;
        Thu, 12 Nov 2020 19:21:50 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 977AF2314D9;
        Thu, 12 Nov 2020 19:21:50 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.50) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Thu, 12 Nov
 2020 19:20:49 +0100
Subject: Re: [PATCH v2 00/14] remoteproc: Add support for detaching from rproc
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>
References: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <b5cd1310-8f20-3d55-5126-bb20004db889@st.com>
Date:   Thu, 12 Nov 2020 19:20:49 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201030195713.1366341-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.50]
X-ClientProxiedBy: SFHDAG2NODE1.st.com (10.75.127.4) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.312,18.0.737
 definitions=2020-11-12_09:2020-11-12,2020-11-12 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu,


On 10/30/20 8:56 PM, Mathieu Poirier wrote:
> Following the work done here [1], this set provides support for the
> remoteproc core to release resources associated with a remote processor
> without having to switch it off. That way a platform driver can be removed
> or the applcation processor power cycled while the remote processor is
> still operating.

I performed some non-regression tests on firmware attachment + few tests on
detach. I don't see any major problem introduced by this patchset (except the
minor problem I reported in patch 11/14:remoteproc: correctly process a stop
request when attached).

My concern is that without the bindings, we still have a problem on the recovery.
If a crash occurs while attached to a remote processor, the remote framework is
in an unexpected state, which requires a system reset to recover it.

To reproduce the issue, simply generate the crash :
 cat 1 >/sys/kernel/debug/remoteproc/remoteproc0/crash

At the end of the mail, I attached a temporary patch to apply on top of this
series, waiting for the bindings management. The patch shutdowns the attached
remote processor instead of trying to recover it.

I wonder if we should fix this for version 4.10 based on the current
implementation (if the patch window is not closed)...
Please tell me what would be the best strategy. If it's not too late, I can
prepare and send a patch tomorrow for v5.10.

Regards
Arnaud
> 
> The only thing that changes in this revision are the last two patches where
> device tree bindings to control how to handle attached remote processors have
> been added.  More specifically two bindings are being proposed:
> 
> "autonomous_on_core_reboot": When rproc_cdev_release() or rproc_del() are called
> and the remote processor has been attached to, it will be detached from (rather
> than turned off) if "autonomous_on_core_reboot" is specified in the DT.
> 
> "autonomous_on_remote_crash": When a remote processor that has been attached to
> crashes, it will be detached from if "autonomous_on_remote_crash" is specified
> in the DT. It is _not_ used in this set and presented to show how I intend to 
> organise things. 


> 
> I spent a fair amount of time coming up with the name for the bindings and would
> welcome other ideas.  I will write a proper yaml file and CC the linux-kernel
> mailing list once we have an agreement on the naming convention.
> 
> Applies cleanly on v5.10-rc1
> 
> Thanks,
> Mathieu
> 
> [1]. https://lkml.org/lkml/2020/7/14/1600
> 
> Mathieu Poirier (14):
>   remoteproc: Re-check state in rproc_shutdown()
>   remoteproc: Remove useless check in rproc_del()
>   remoteproc: Add new RPROC_ATTACHED state
>   remoteproc: Properly represent the attached state
>   remoteproc: Properly deal with a kernel panic when attached
>   remoteproc: Add new detach() remoteproc operation
>   remoteproc: Introduce function __rproc_detach()
>   remoteproc: Introduce function rproc_detach()
>   remoteproc: Rename function rproc_actuate()
>   remoteproc: Add return value to function rproc_shutdown()
>   remoteproc: Properly deal with a stop request when attached
>   remoteproc: Properly deal with detach request
>   remoteproc: Add automation flags
>   remoteproc: Refactor rproc delete and cdev release path
> 
>  drivers/remoteproc/remoteproc_cdev.c  |  24 +++-
>  drivers/remoteproc/remoteproc_core.c  | 183 +++++++++++++++++++++-----
>  drivers/remoteproc/remoteproc_sysfs.c |  17 ++-
>  include/linux/remoteproc.h            |  19 ++-
>  4 files changed, 199 insertions(+), 44 deletions(-)
> 

From a04866cf0add0020b65e9ab80d62d44290a1d695 Mon Sep 17 00:00:00 2001
From: Arnaud Pouliquen <arnaud.pouliquen@st.com>
Date: Thu, 12 Nov 2020 18:25:52 +0100
Subject: [PATCH] remoteproc: core fix unexpected state on crash for attached
 firmware

The recovery falls in an unexpected state when attached to a remote
processor.
As no firmware to load is found, the remote processor has
just been stopped but associated resources are not free.
As consequence rproc->power is remaining at 1 and it s no more
possible to recover the remote processor.
This patch shutdown the attached remote processor instead of trying
to recover it.

Signed-off-by: Arnaud Pouliquen <arnaud.pouliquen@st.com>
---
 drivers/remoteproc/remoteproc_core.c | 17 +++++++++++++----
 1 file changed, 13 insertions(+), 4 deletions(-)

diff --git a/drivers/remoteproc/remoteproc_core.c
b/drivers/remoteproc/remoteproc_core.c
index a0611d494758..a38209dd782c 100644
--- a/drivers/remoteproc/remoteproc_core.c
+++ b/drivers/remoteproc/remoteproc_core.c
@@ -1739,6 +1739,8 @@ static void rproc_crash_handler_work(struct work_struct *work)
 {
 	struct rproc *rproc = container_of(work, struct rproc, crash_handler);
 	struct device *dev = &rproc->dev;
+	unsigned int rproc_attached = false;
+

 	dev_dbg(dev, "enter %s\n", __func__);

@@ -1750,15 +1752,21 @@ static void rproc_crash_handler_work(struct work_struct
*work)
 		return;
 	}

+	if (rproc->state == RPROC_ATTACHED)
+		rproc_attached = true;
+
 	rproc->state = RPROC_CRASHED;
 	dev_err(dev, "handling crash #%u in %s\n", ++rproc->crash_cnt,
 		rproc->name);

 	mutex_unlock(&rproc->lock);

-	if (!rproc->recovery_disabled)
-		rproc_trigger_recovery(rproc);
-
+	if (!rproc->recovery_disabled) {
+		if (!rproc_attached)
+			rproc_trigger_recovery(rproc);
+		else
+			rproc_shutdown(rproc);
+	}
 	pm_relax(rproc->dev.parent);
 }

@@ -1862,7 +1870,8 @@ int rproc_shutdown(struct rproc *rproc)
 		return ret;
 	}

-	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED) {
+	if (rproc->state != RPROC_RUNNING && rproc->state != RPROC_ATTACHED &&
+	    rproc->state != RPROC_CRASHED) {
 		ret = -EPERM;
 		goto out;
 	}
-- 
2.17.1



