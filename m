Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 45E2DC433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 10:39:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 27D7E60E54
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 Oct 2021 10:39:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235881AbhJKKlI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 Oct 2021 06:41:08 -0400
Received: from mx08-00178001.pphosted.com ([91.207.212.93]:51170 "EHLO
        mx07-00178001.pphosted.com" rhost-flags-OK-OK-OK-FAIL)
        by vger.kernel.org with ESMTP id S235871AbhJKKlH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 Oct 2021 06:41:07 -0400
Received: from pps.filterd (m0046660.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.16.1.2/8.16.1.2) with SMTP id 19B9et2T022265;
        Mon, 11 Oct 2021 12:39:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=subject : to : cc :
 references : from : message-id : date : mime-version : in-reply-to :
 content-type : content-transfer-encoding; s=selector1;
 bh=MyCYk6q6b+98QUO/LIMJAx33+2KlWqEKU/USaeERzKM=;
 b=1aVR09Iq3LeQV/m6AxAwRQlmOIInt84Q48kd0FwqGmDpaqq0gc3J/ZrhoKdHa0ehFXD4
 RG+IK3xuoitkthAiP7uNfc81U4WA2SMcDAV6uN/S2pD+5Dv2LTx4XW9LypmtvEzoyxAU
 q3RvvsQrTGjCNUo053a7CtLj6OpHXflrFPq+Vf2YyySmiWhhnf0zrmGxEYe2vz+tczDo
 yoyMEjTi0WVSdjCcBdqSEuNdJJX65xO5zFmaeQK7kmO7NQWdSmy3QRP4cbs8pByNVCoB
 tVjS1fCutPuZoTtNWGiQJd7cerIfcRyU8of1uGUI5tTaHzWSIvDcM8ZoxWrkPphYCX9Y ag== 
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com with ESMTP id 3bmdxrj464-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 11 Oct 2021 12:39:05 +0200
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 671DA10002A;
        Mon, 11 Oct 2021 12:39:05 +0200 (CEST)
Received: from Webmail-eu.st.com (sfhdag2node2.st.com [10.75.127.5])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5F6F721CA78;
        Mon, 11 Oct 2021 12:39:05 +0200 (CEST)
Received: from lmecxl0889.lme.st.com (10.75.127.48) by SFHDAG2NODE2.st.com
 (10.75.127.5) with Microsoft SMTP Server (TLS) id 15.0.1497.18; Mon, 11 Oct
 2021 12:39:04 +0200
Subject: Re: [PATCH v5 2/4] rpmsg: char: Export eptdev create an destroy
 functions
To:     Bjorn Andersson <bjorn.andersson@linaro.org>
CC:     Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
        <linux-stm32@st-md-mailman.stormreply.com>
References: <20210712123752.10449-1-arnaud.pouliquen@foss.st.com>
 <20210712123752.10449-3-arnaud.pouliquen@foss.st.com>
 <YWDURVTg1PpxRDEu@ripper>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Message-ID: <ea8084fa-b9b9-8e23-1adf-f5d22e94192e@foss.st.com>
Date:   Mon, 11 Oct 2021 12:39:04 +0200
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <YWDURVTg1PpxRDEu@ripper>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.75.127.48]
X-ClientProxiedBy: SFHDAG1NODE2.st.com (10.75.127.2) To SFHDAG2NODE2.st.com
 (10.75.127.5)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.182.1,Aquarius:18.0.790,Hydra:6.0.391,FMLib:17.0.607.475
 definitions=2021-10-11_03,2021-10-07_02,2020-04-07_01
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 10/9/21 1:29 AM, Bjorn Andersson wrote:
> On Mon 12 Jul 05:37 PDT 2021, Arnaud Pouliquen wrote:
> [..]
>> diff --git a/drivers/rpmsg/rpmsg_char.h b/drivers/rpmsg/rpmsg_char.h
>> new file mode 100644
>> index 000000000000..22573b60e008
>> --- /dev/null
>> +++ b/drivers/rpmsg/rpmsg_char.h
>> @@ -0,0 +1,49 @@
>> +/* SPDX-License-Identifier: GPL-2.0 WITH Linux-syscall-note */
>> +/*
>> + * Copyright (C) STMicroelectronics 2021.
>> + */
>> +
>> +#ifndef __RPMSG_CHRDEV_H__
>> +#define __RPMSG_CHRDEV_H__
>> +
>> +#if IS_REACHABLE(CONFIG_RPMSG_CHAR)
> 
> This does allow you to build a kernel with RPMSG_CHAR=m and RPMSG_CTRL=y
> without link failures. Any modules in the system will be able to call
> rpmsg_chrdev_eptdev_create(), but the rpmsg_ctrl driver will only end up
> in the stub.
> 
> This sounds like a recipe for a terrible debugging session...

The RPMSG_CREATE_EPT_IOCTL control create a dependency between the rpmsg_ctrl
and the rpmsg_char. The build error option seems not a good alternative.
And in case of RPMSG_CHAR=m and RPMSG_CTRL=y, an error is returned so not only a
stub.

What about adding a WARN_ON(1) in rpmsg_chrdev_eptdev_create
with an associated comment to ease the debug?

Regards,
Arnaud

> 
> Regards,
> Bjorn
> 
>> +/**
>> + * rpmsg_chrdev_eptdev_create() - register char device based on an endpoint
>> + * @rpdev:  prepared rpdev to be used for creating endpoints
>> + * @parent: parent device
>> + * @chinfo: associated endpoint channel information.
>> + *
>> + * This function create a new rpmsg char endpoint device to instantiate a new
>> + * endpoint based on chinfo information.
>> + */
>> +int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +			       struct rpmsg_channel_info chinfo);
>> +
>> +/**
>> + * rpmsg_chrdev_eptdev_destroy() - destroy created char device endpoint.
>> + * @data: private data associated to the endpoint device
>> + *
>> + * This function destroys a rpmsg char endpoint device created by the RPMSG_DESTROY_EPT_IOCTL
>> + * control.
>> + */
>> +int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data);
>> +
>> +#else  /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +static inline int rpmsg_chrdev_eptdev_create(struct rpmsg_device *rpdev, struct device *parent,
>> +					     struct rpmsg_channel_info chinfo)
>> +{
>> +	return -EINVAL;
>> +}
>> +
>> +static inline int rpmsg_chrdev_eptdev_destroy(struct device *dev, void *data)
>> +{
>> +	/* This shouldn't be possible */
>> +	WARN_ON(1);
>> +
>> +	return 0;
>> +}
>> +
>> +#endif /*IS_REACHABLE(CONFIG_RPMSG_CHAR) */
>> +
>> +#endif /*__RPMSG_CHRDEV_H__ */
>> -- 
>> 2.17.1
>>
