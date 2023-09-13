Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F423ECA5534
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 Sep 2023 10:02:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234107AbjIMKC3 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 Sep 2023 06:02:29 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41952 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231757AbjIMKC3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 Sep 2023 06:02:29 -0400
Received: from mx08-00178001.pphosted.com (mx08-00178001.pphosted.com [91.207.212.93])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D67F919A9
        for <linux-remoteproc@vger.kernel.org>; Wed, 13 Sep 2023 03:02:24 -0700 (PDT)
Received: from pps.filterd (m0369457.ppops.net [127.0.0.1])
        by mx07-00178001.pphosted.com (8.17.1.22/8.17.1.22) with ESMTP id 38D78tAS018489;
        Wed, 13 Sep 2023 12:02:19 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=foss.st.com; h=
        message-id:date:mime-version:subject:to:cc:references:from
        :in-reply-to:content-type:content-transfer-encoding; s=
        selector1; bh=Bzm3/ivLpH+LG73vgsjml8E0mcgjPE25yUG9T2oSf4I=; b=ic
        drHr52LJ8NsiGetG2KiRTtNBYjY30Y6VgE20HIEEfjFzuAi688xAJCeEH/645fk8
        q9o1oOY6VxImvpKow6379HiyAfkQQPcgkyr9zxzIWzIZzQIwyEsJujgaKhYquD6u
        m7QXKXg29BXiQVX/AMud5prX53hgqNk/crmpJlqXpln95cvgYmwiO1MMqFCD82xJ
        Q30K7x3j4LkfOiTBRbiOb3gHSHaKBmkYmucomQcqo/G5Jy/Jw+5qqtPSr1/HQr2V
        8dBe3HK7Nn2eYIb4Ms+Afj5oiLjk1x5X9r6B35L0No9wp3D69UmJfR4HIs1QKCrQ
        wZ89GbJK5oHp7ypCiWIA==
Received: from beta.dmz-eu.st.com (beta.dmz-eu.st.com [164.129.1.35])
        by mx07-00178001.pphosted.com (PPS) with ESMTPS id 3t2y7maq4u-1
        (version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NOT);
        Wed, 13 Sep 2023 12:02:19 +0200 (MEST)
Received: from euls16034.sgp.st.com (euls16034.sgp.st.com [10.75.44.20])
        by beta.dmz-eu.st.com (STMicroelectronics) with ESMTP id 4DAB0100057;
        Wed, 13 Sep 2023 12:02:17 +0200 (CEST)
Received: from Webmail-eu.st.com (shfdag1node2.st.com [10.75.129.70])
        by euls16034.sgp.st.com (STMicroelectronics) with ESMTP id 380A8233003;
        Wed, 13 Sep 2023 12:02:17 +0200 (CEST)
Received: from [10.252.24.233] (10.252.24.233) by SHFDAG1NODE2.st.com
 (10.75.129.70) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id 15.1.2507.27; Wed, 13 Sep
 2023 12:02:16 +0200
Message-ID: <aec60fe8-ec1d-25d1-f07d-eb0b664d8dba@foss.st.com>
Date:   Wed, 13 Sep 2023 12:02:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.15.0
Subject: Re: [PATCH 1/1] rpmsg: virtio_rpmsg_bus - prevent possible race
 condition
Content-Language: en-US
To:     Tim Blechmann <tim@klingt.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     Tim Blechmann <tim.blechmann@gmail.com>,
        <linux-remoteproc@vger.kernel.org>,
        <agostino.carballeira@native-instruments.de>
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
From:   Arnaud POULIQUEN <arnaud.pouliquen@foss.st.com>
Organization: STMicroelectronics
In-Reply-To: <117fbe3c-3db4-4f82-1d96-11501259e209@klingt.org>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.252.24.233]
X-ClientProxiedBy: EQNCAS1NODE3.st.com (10.75.129.80) To SHFDAG1NODE2.st.com
 (10.75.129.70)
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.267,Aquarius:18.0.980,Hydra:6.0.601,FMLib:17.11.176.26
 definitions=2023-09-13_04,2023-09-05_01,2023-05-22_02
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 9/13/23 10:47, Tim Blechmann wrote:
> many thanks for your analysis, very interesting.
> 
>> please find below an extract of your trace with my analysis:
>>
>>
>>   stm32mp1_bulk_p-390     [001] .....   907.241226: rpmsg_send
>> <-rpmsg_intercore_send_buffer.constprop.0
>>   stm32mp1_bulk_p-390     [001] .....   907.241228: virtio_rpmsg_send
>> <-rpmsg_send
>>   stm32mp1_bulk_p-390     [001] .....   907.241237: virtqueue_enable_cb
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [001] .....   907.241239: virtqueue_enable_cb_prepare
>>
>> At this point seems that no more TX-buffer
>>
>> <-rpmsg_recv_single
>>       kworker/0:4-67      [000] .....   907.242533: vring_interrupt
>> <-rproc_vq_interrupt
>>       kworker/0:4-67      [000] .....   907.242536: rpmsg_xmit_done
>>
>> Here you receive  an interrupt indicating that TX buffer has been released by
>> the remote. that's the expected behavior.
>>
>>
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [000] .....   984.054941: rpmsg_send
>> <-rpmsg_intercore_send_buffer.constprop.0
>>   stm32mp1_bulk_p-390     [000] .....   984.054943: virtio_rpmsg_send
>> <-rpmsg_send
>>   stm32mp1_bulk_p-390     [000] .....   984.054956: virtqueue_enable_cb
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [000] .....   984.054958: virtqueue_enable_cb_prepare
>> <-virtqueue_enable_cb
>>   stm32mp1_bulk_p-390     [000] .....   999.398667: virtqueue_disable_cb
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [000] .....   999.414840: rpmsg_send
>> <-rpmsg_intercore_send_buffer.constprop.0
>>   stm32mp1_bulk_p-390     [000] .....   999.414843: virtio_rpmsg_send
>> <-rpmsg_send
>>   stm32mp1_bulk_p-390     [000] .....   999.414855: virtqueue_enable_cb
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [000] .....   999.414857: virtqueue_enable_cb_prepare
>>
>> Here you have again no more TX buffer. From this point there is no more activity
>> neither in TX nor in RX until the timeout of 15 seconds.
>> If you have a look to rproc_vq_interrupt the last one occurs at 907.242533
>>
>>
>> As you have no more virtqueue interrupts call for both directions, the issue is
>> probably either in the Cortex-M firmware, which seems to be stalled, or due to a
>> disable of the IRQs in Linux.
> 
> afaict we can rule out a complete stall of the cortex-m firmware: if we change
> the rpmsg_send to a rpmsg_trysend/msleep loop, the trysend will succeed to get a
> buffer after a few iterations.
> 
>> or due to a disable of the IRQs in Linux.
> 
> do you have some recommendations how we could trace this?

First, check if the Cortex-M sends the IPCC mailbox notification during the
15-second period. Then, you can verify the IPCC registers to check if some flags
are pending. On the Linux side, there is probably literature available to
explain how to trace it.

> 
> many thanks,
> tim
> 
>> <-virtqueue_enable_cb
>>   stm32mp1_bulk_p-390     [000] .....  1014.758678: virtqueue_disable_cb
>> <-rpmsg_send_offchannel_raw
>>   stm32mp1_bulk_p-390     [000] .....  1014.774802: rpmsg_send
>> <-rpmsg_intercore_send_buffer.constprop.0
>>   stm32mp1_bulk_p-390     [000] .....  1014.774804: virtio_rpmsg_send
>> <-rpmsg_send
>>   stm32mp1_bulk_p-390     [000] .....  1014.774815: virtqueue_enable_cb
> 
> 
