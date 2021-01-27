Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.2 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 0C917C433E6
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 09:24:37 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id B494B20758
	for <linux-remoteproc@archiver.kernel.org>; Wed, 27 Jan 2021 09:24:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232320AbhA0JYS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 27 Jan 2021 04:24:18 -0500
Received: from mx07-00178001.pphosted.com ([185.132.182.106]:22578 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S231338AbhA0JWL (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 27 Jan 2021 04:22:11 -0500
Received: from pps.filterd (m0046668.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.0.43/8.16.0.43) with SMTP id 10R9DEtg008341;
        Wed, 27 Jan 2021 10:21:25 +0100
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=STMicroelectronics;
 bh=kcZRKLt0/T1SGV05doeMSST8p3+eAg9tjvXn0Coubak=;
 b=Py/9+O8rdNXbySkZf49e4BEO59Ooqc88cVQAbpr9OUaHm4hgHOnuujKDvOQD+3T5/KXz
 qEpenW2VswS4JUANnXi/yzQ+LJV17GMvp9X0dYrYccJGaolsVyXfLmZjD4VQCorn21GW
 sLtpI6zYaoai+xScbBNPVMRF4H5i6PVruVehS0iSBzzlB/KU4+IOzMdf24+LBdcrkBzX
 JHUwF3bZfbuE9EJSzcC8/vAI1JDnxWa+nFAJtUWGMkh5RRji7GsFE9p5mCc5ucgsnQ+0
 EOA5XShx6gBbGLisRACPjpeIpD4ML16pY+wgWWVfH1u+KdRz5Mw4igrN/+eym2TOoVQn XA== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 368a56px60-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 27 Jan 2021 10:21:25 +0100
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 2124110002A;
        Wed, 27 Jan 2021 10:21:25 +0100 (CET)
Received: from Webmail-eu.st.com (sfhdag3node1.st.com [10.75.127.7])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 0BFB02296FA;
        Wed, 27 Jan 2021 10:21:25 +0100 (CET)
Received: from lmecxl0889.lme.st.com (10.75.127.47) by SFHDAG3NODE1.st.com
 (10.75.127.7) with Microsoft SMTP Server (TLS) id 15.0.1473.3; Wed, 27 Jan
 2021 10:21:24 +0100
Subject: Re: [PATCH v4 00/17] remoteproc: Add support for detaching a rproc
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        "ohad@wizery.com" <ohad@wizery.com>,
        "bjorn.andersson@linaro.org" <bjorn.andersson@linaro.org>,
        "robh+dt@kernel.org" <robh+dt@kernel.org>
CC:     "linux-remoteproc@vger.kernel.org" <linux-remoteproc@vger.kernel.org>,
        "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
        "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>
References: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@st.com>
Message-ID: <64b559dc-9e89-c351-ddee-f9cebd155ed7@st.com>
Date:   Wed, 27 Jan 2021 10:21:24 +0100
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20201218173228.2277032-1-mathieu.poirier@linaro.org>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.47]
X-ClientProxiedBy: SFHDAG2NODE2.st.com (10.75.127.5) To SFHDAG3NODE1.st.com
 (10.75.127.7)
X-Proofpoint-Virus-Version: vendor=fsecure engine=2.50.10434:6.0.343,18.0.737
 definitions=2021-01-27_04:2021-01-26,2021-01-27 signatures=0
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Mathieu

On 12/18/20 6:32 PM, Mathieu Poirier wrote:
> Following the work done here [1], this set provides support for the
> remoteproc core to release resources associated with a remote processor
> without having to switch it off. That way a platform driver can be removed
> or the application processor power cycled while the remote processor is
> still operating.
> 
> Of special interest in this series are patches 5 and 6 where getting the
> address of the resource table installed by an eternal entity if moved to
> the core.  This is to support scenarios where a remote process has been
> booted by the core but is being detached.  To re-attach the remote
> processor, the address of the resource table needs to be known at a later
> time than the platform driver's probe() function.
> 
> Applies cleanly on v5.10
> 
> Thanks,
> Mathieu
> 
> [1]. https://lkml.org/lkml/2020/7/14/1600
> 
> ----
> New for v4:
> - Made binding description OS agnostic (Rob)
> - Added functionality to set the external resource table in the core
> - Fixed a crash when detaching (Arnaud)
> - Fixed error code propagation in rproc_cdev_relase() and rproc_del() (Arnaud)
> - Added RB tags


I tested you series, attach and  detach is working well.

Then I faced issue when tried to re-attach after a detach.

But I don't know if this feature has to be supported in this step.

The 2 issues I found are:

1) memory carveouts are released on detach so need to be reinitialized.
The use of prepare/unprepare for the attach and detach would solve the issue but
probably need to add parameter to differentiate a start/stop from a attach/detach.

2) The vrings in the loaded resource table (so no cached) has to be properly
reinitialized. In rproc_free_vring  the vring da is set to 0 that is then
considered as a fixed address.

Here is a fix which works on the stm32 platform

@@ -425,7 +425,7 @@ void rproc_free_vring(struct rproc_vring *rvring)
 	 */
 	if (rproc->table_ptr) {
 		rsc = (void *)rproc->table_ptr + rvring->rvdev->rsc_offset;
-		rsc->vring[idx].da = 0;
+		rsc->vring[idx].da = FW_RSC_ADDR_ANY;
 		rsc->vring[idx].notifyid = -1;
 	}
 }

Here, perhaps a better alternative would be to make a cached copy on attach
before updating it. On the next attach, the cached copy would be copied as it is
done in rproc_start.

Thanks,
Arnaud


> 
> Mathieu Poirier (17):
>   dt-bindings: remoteproc: Add bindind to support autonomous processors
>   remoteproc: Re-check state in rproc_shutdown()
>   remoteproc: Remove useless check in rproc_del()
>   remoteproc: Rename function rproc_actuate()
>   remoteproc: Add new get_loaded_rsc_table() remoteproc operation
>   remoteproc: stm32: Move resource table setup to rproc_ops
>   remoteproc: Add new RPROC_ATTACHED state
>   remoteproc: Properly represent the attached state
>   remoteproc: Properly deal with a kernel panic when attached
>   remoteproc: Add new detach() remoteproc operation
>   remoteproc: Introduce function __rproc_detach()
>   remoteproc: Introduce function rproc_detach()
>   remoteproc: Add return value to function rproc_shutdown()
>   remoteproc: Properly deal with a stop request when attached
>   remoteproc: Properly deal with a start request when attached
>   remoteproc: Properly deal with detach request
>   remoteproc: Refactor rproc delete and cdev release path
> 
>  .../bindings/remoteproc/remoteproc-core.yaml  |  27 +++
>  drivers/remoteproc/remoteproc_cdev.c          |  32 ++-
>  drivers/remoteproc/remoteproc_core.c          | 211 +++++++++++++++---
>  drivers/remoteproc/remoteproc_internal.h      |   8 +
>  drivers/remoteproc/remoteproc_sysfs.c         |  20 +-
>  drivers/remoteproc/stm32_rproc.c              | 147 ++++++------
>  include/linux/remoteproc.h                    |  24 +-
>  7 files changed, 344 insertions(+), 125 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/remoteproc-core.yaml
> 
