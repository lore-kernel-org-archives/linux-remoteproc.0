Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 98886C71153
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 13:53:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236363AbjIDNxN (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 09:53:13 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57904 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229796AbjIDNxN (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 09:53:13 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DF44DE3
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 06:53:09 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 3848dBqV025072;
        Mon, 4 Sep 2023 15:53:06 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=MnDCG2XIK7vxP2jAB6/q+SWGxfYH2m264bPDZkOnujU=; b=aa
        T5larRuMVBJXMMU5VQ0oJpBhx1el45A2S71+jMzreMSJrhmGsorpMiZh8XemdM2g
        CDEddqVMgUTRZGjCTMVzYY/zp8tWOvN5W/MOkVxTWlkrqoVfekHiG+YWtu4gyUo4
        muzFtdkYcZXYasyOT2lmRMBsb5sG1GYJQyiJJLkIP+zcL5AlARQQfyDO0RVHFzUB
        usJ7mo7ajBTI2UZumB+P8H+HWuPfkJaSghYpUCcVdhXZxyp0AbCi5LeDgKscAWfP
        Mb5E6J76inawzLT/wyqe4S7DJ6WO3kQQVLlTJX8QJ/yrMZwgPerjJa67s+QstAhx
        tXWmkDttPP5IWcqQ2duQ==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3svem0d64w-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Mon, 04 Sep 2023 15:53:06 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 6177E100063;
        Mon,  4 Sep 2023 15:53:05 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 5B093217B79;
        Mon,  4 Sep 2023 15:53:05 +0200 (CEST)
Received: from [10.252.2.43] (10.252.2.43) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.21; Mon, 4 Sep
 2023 15:53:03 +0200
Message-ID: <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com>
Date:   Mon, 4 Sep 2023 15:52:56 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.13.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
To:     Tim Blechmann <tim.blechmann@gmail.com>,
        <linux-remoteproc@vger.kernel.org>
CC:     Tim Blechmann <tim@klingt.org>
References: <20230904083602.106703-1-tim@klingt.org>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <20230904083602.106703-1-tim@klingt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.252.2.43]
X-ClientProxiedBy: EQNCAS1NODE4.st.com (10.75.129.82) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.957,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-04_07,2023-08-31_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello Tim,

On 9/4/23 10:36, Tim Blechmann wrote:
> when we cannot get a tx buffer (`get_a_tx_buf`) `rpmsg_upref_sleepers`
> enables tx-complete interrupt.
> however if the interrupt is executed after `get_a_tx_buf` and before
> `rpmsg_upref_sleepers` we may mis the tx-complete interrupt and sleep
> for the full 15 seconds.


Is there any reason why your co-processor is unable to release the TX RPMSG
buffers for 15 seconds? If not, you should first determine the reason why it is
stalled.

Regards,
Arnaud

> 
> in this case, so we re-try once before we really start to sleep
> 
> Signed-off-by: Tim Blechmann <tim@klingt.org>
> ---
>  drivers/rpmsg/virtio_rpmsg_bus.c | 24 +++++++++++++++---------
>  1 file changed, 15 insertions(+), 9 deletions(-)
> 
> diff --git a/drivers/rpmsg/virtio_rpmsg_bus.c b/drivers/rpmsg/virtio_rpmsg_bus.c
> index 905ac7910c98..2a9d42225e60 100644
> --- a/drivers/rpmsg/virtio_rpmsg_bus.c
> +++ b/drivers/rpmsg/virtio_rpmsg_bus.c
> @@ -587,21 +587,27 @@ static int rpmsg_send_offchannel_raw(struct rpmsg_device *rpdev,
>  
>  	/* no free buffer ? wait for one (but bail after 15 seconds) */
>  	while (!msg) {
>  		/* enable "tx-complete" interrupts, if not already enabled */
>  		rpmsg_upref_sleepers(vrp);
>  
> -		/*
> -		 * sleep until a free buffer is available or 15 secs elapse.
> -		 * the timeout period is not configurable because there's
> -		 * little point in asking drivers to specify that.
> -		 * if later this happens to be required, it'd be easy to add.
> -		 */
> -		err = wait_event_interruptible_timeout(vrp->sendq,
> -					(msg = get_a_tx_buf(vrp)),
> -					msecs_to_jiffies(15000));
> +		/* make sure to retry to grab tx buffer before we start waiting */
> +		msg = get_a_tx_buf(vrp);
> +		if (msg) {
> +			err = 0;
> +		} else {
> +			/*
> +			 * sleep until a free buffer is available or 15 secs elapse.
> +			 * the timeout period is not configurable because there's
> +			 * little point in asking drivers to specify that.
> +			 * if later this happens to be required, it'd be easy to add.
> +			 */
> +			err = wait_event_interruptible_timeout(vrp->sendq,
> +						(msg = get_a_tx_buf(vrp)),
> +						msecs_to_jiffies(15000));
> +		}
>  
>  		/* disable "tx-complete" interrupts if we're the last sleeper */
>  		rpmsg_downref_sleepers(vrp);
>  
>  		/* timeout ? */
>  		if (!err) {
