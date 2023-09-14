Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 86E8BEEAA5D
	for <linux-remoteproc@archiver.kernel.org>; Thu, 14 Sep 2023 17:26:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S241200AbjINR0o (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 14 Sep 2023 13:26:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38642 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S241706AbjINR00 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 14 Sep 2023 13:26:26 -0400
Received: from mx07-00178001.pphosted.com (mx07-00178001.pphosted.com [185.132.182.106])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7028A2126
        for <linux-remoteproc@vger.kernel.org>; Thu, 14 Sep 2023 10:25:15 -0700 (PDT)
Received: from pps.filterd (m0369458.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38EDGoc4021823;
        Thu, 14 Sep 2023 19:25:07 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=GDwVpUOtlGr0lFx7bjTU4YIHNHYU9jj39tk0ABeaxG0=; b=58
        2VPw00BblDkQP3ZkTcbhVNTKP9/5nEkZ4/IWoUzJKJKiFfFzU3wN2B0OJwQtyUZk
        5i+sf1WcgQOBMfK4FDVvkKPJSbpw/K4iAxm2d/DkiZxqitiSNzqCXEdnSWlVpE32
        CYaqL3p3W7ws3AwlqRebcY50lyz1QrEIXoHZBNevy5bNIs/spXcOS9ABVlU3Z8Aq
        r3IKvRT8JbTa0hqicsCvJOpPcxjfs4x9EZJx3msnSqMk7d4VqVIHRZFR3tT+duGr
        ak9SiWS5QLYZ5UJ8uffoh/mX5Qs89kGHCG+hhQxBwhkErPoCQB9M9sC6S6Qmghpd
        wp2WGmZFIlG2G7ZwM/FA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2y7kh9q5-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Thu, 14 Sep 2023 19:25:07 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id ED04010005A;
        Thu, 14 Sep 2023 19:25:06 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id E693326DDDA;
        Thu, 14 Sep 2023 19:25:06 +0200 (CEST)
Received: from [10.252.13.119] (10.252.13.119) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Thu, 14 Sep
 2023 19:25:04 +0200
Message-ID: <12d59a09-bb83-26e7-321e-1407b3f814e8@foss.st.com>
Date:   Thu, 14 Sep 2023 19:25:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
To:     =?UTF-8?Q?Agosti=c3=b1o_Carballeira?= 
        <agostino.carballeira@native-instruments.com>,
        Tim Blechmann <tim@klingt.org>
CC:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Tim Blechmann <tim.blechmann@gmail.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20230904083602.106703-1-tim@klingt.org>
 <64ecb19a-b3d1-0fa1-b015-b34607aee460@foss.st.com> <ZPZBVS3R/oZuUmk5@p14s>
 <00d5edfd-808f-51ac-0233-ce8489c6722c@klingt.org>
 <a47f8cea-5dc4-cdb2-9c2d-daf84c6853e3@foss.st.com>
 <a90701cb-2c4f-9e25-deff-1b4dbd13c922@klingt.org>
 <0ec7f251-36de-f8b6-cfbe-96632519c851@foss.st.com>
 <b3374cec-946b-db27-d849-0a4ec0068b1b@klingt.org>
 <d2a303ad-4dcf-de52-38db-53695169fe33@klingt.org>
 <d37a0431-9b4d-1215-2c2c-14c8963f93a7@foss.st.com>
 <117fbe3c-3db4-4f82-1d96-11501259e209@klingt.org>
 <CAG2LOc42AG5H56=tzz8_2WrrBiy9d74qYmgPQaEVGrzWTNqodg@mail.gmail.com>
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <CAG2LOc42AG5H56=tzz8_2WrrBiy9d74qYmgPQaEVGrzWTNqodg@mail.gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.13.119]
X-ClientProxiedBy: SHFCAS1NODE2.st.com (10.75.129.73) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-14_09,2023-09-14_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/13/23 12:57, Agostiño Carballeira wrote:
> Hello!
> 
> I am the main developer of the CM4 firmware for this project.
> First of all thanks for taking the time to analyse the trace.
> Further analysis on my side has shown that the CM4 is not completely stalled in
> this situation, but it is stuck on a busywait loop within the MAILBOX_Notify
> function, awaiting a window to send a "buffer used" notification to the CA7. So
> it seems that the mailbox is locked both ways and neither side is giving way to
> unclog the traffic jam.

The Cortex-M4 is probably blocked, waiting for Linux mailbox to acknowledge a
mailbox notification[1].
Are you 100% sure that you have never exited this loop during the issue?
Could you provide the value of the 'id' variable and the call stack?

That would mean that the mailbox has not been acknowledged by Linux [2] or [3].
I don't understand how it could be possible...

[1]
https://github.com/STMicroelectronics/STM32CubeMP1/blob/master/Middlewares/Third_Party/OpenAMP/mw_if/platform_if/mbox_ipcc_template.c#L182

[2] https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/stm32-ipcc.c#L105
[3] https://elixir.bootlin.com/linux/latest/source/drivers/mailbox/stm32-ipcc.c#L134

> Interestingly, when we replace rpmsg_send by rpmsg_trysend + busywait loop, this
> mutual stall doesn't happen at all.

What do you mean by busywait? Do you add a delay between 2 rpmsg_trysend()
calls? If yes, you probably add delay that avoid the issue.

That said rpmsg_trysend is recommended for baremetal to avoid to block the system.

> Does that give you any clues?
> 
> Thanks
> Agos
> 
> On Wed, Sep 13, 2023 at 10:47 AM Tim Blechmann <tim@klingt.org
> <mailto:tim@klingt.org>> wrote:
> 
>     many thanks for your analysis, very interesting.
> 
>     > please find below an extract of your trace with my analysis:
>     >
>     >
>     >   stm32mp1_bulk_p-390     [001] .....   907.241226: rpmsg_send
>     > <-rpmsg_intercore_send_buffer.constprop.0
>     >   stm32mp1_bulk_p-390     [001] .....   907.241228: virtio_rpmsg_send
>     <-rpmsg_send
>     >   stm32mp1_bulk_p-390     [001] .....   907.241237: virtqueue_enable_cb
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [001] .....   907.241239:
>     virtqueue_enable_cb_prepare
>     >
>     > At this point seems that no more TX-buffer
>     >
>     > <-rpmsg_recv_single
>     >       kworker/0:4-67      [000] .....   907.242533: vring_interrupt
>     > <-rproc_vq_interrupt
>     >       kworker/0:4-67      [000] .....   907.242536: rpmsg_xmit_done
>     >
>     > Here you receive  an interrupt indicating that TX buffer has been released by
>     > the remote. that's the expected behavior.
>     >
>     >
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [000] .....   984.054941: rpmsg_send
>     > <-rpmsg_intercore_send_buffer.constprop.0
>     >   stm32mp1_bulk_p-390     [000] .....   984.054943: virtio_rpmsg_send
>     <-rpmsg_send
>     >   stm32mp1_bulk_p-390     [000] .....   984.054956: virtqueue_enable_cb
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [000] .....   984.054958:
>     virtqueue_enable_cb_prepare
>     > <-virtqueue_enable_cb
>     >   stm32mp1_bulk_p-390     [000] .....   999.398667: virtqueue_disable_cb
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [000] .....   999.414840: rpmsg_send
>     > <-rpmsg_intercore_send_buffer.constprop.0
>     >   stm32mp1_bulk_p-390     [000] .....   999.414843: virtio_rpmsg_send
>     <-rpmsg_send
>     >   stm32mp1_bulk_p-390     [000] .....   999.414855: virtqueue_enable_cb
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [000] .....   999.414857:
>     virtqueue_enable_cb_prepare
>     >
>     > Here you have again no more TX buffer. From this point there is no more
>     activity
>     > neither in TX nor in RX until the timeout of 15 seconds.
>     > If you have a look to rproc_vq_interrupt the last one occurs at 907.242533
>     >
>     >
>     > As you have no more virtqueue interrupts call for both directions, the
>     issue is
>     > probably either in the Cortex-M firmware, which seems to be stalled, or
>     due to a
>     > disable of the IRQs in Linux.
> 
>     afaict we can rule out a complete stall of the cortex-m firmware: if we
>     change the rpmsg_send to a rpmsg_trysend/msleep loop, the trysend will
>     succeed to get a buffer after a few iterations.
> 
>     > or due to a disable of the IRQs in Linux.
> 
>     do you have some recommendations how we could trace this?
> 
>     many thanks,
>     tim
> 
>     > <-virtqueue_enable_cb
>     >   stm32mp1_bulk_p-390     [000] .....  1014.758678: virtqueue_disable_cb
>     > <-rpmsg_send_offchannel_raw
>     >   stm32mp1_bulk_p-390     [000] .....  1014.774802: rpmsg_send
>     > <-rpmsg_intercore_send_buffer.constprop.0
>     >   stm32mp1_bulk_p-390     [000] .....  1014.774804: virtio_rpmsg_send
>     <-rpmsg_send
>     >   stm32mp1_bulk_p-390     [000] .....  1014.774815: virtqueue_enable_cb
> 
> 
> 
> 
> -- 
> 
> Agostiño Carballeira
> 
> Senior Embedded Software Engineer
> 
> agostino.carballeira@native-instruments.com
> <mailto:agostino.carballeira@native-instruments.com>
> 
> 
> Native Instruments <https://www.native-instruments.com>– now including iZotope,
> Plugin Alliance, and Brainworx
