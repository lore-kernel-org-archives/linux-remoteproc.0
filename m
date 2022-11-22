Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1B869C4332F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 22 Nov 2022 02:03:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231788AbiKVCD5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 21 Nov 2022 21:03:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:33248 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231675AbiKVCD5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 21 Nov 2022 21:03:57 -0500
Received: from szxga02-in.huawei.com (szxga02-in.huawei.com [45.249.212.188])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5405BDDF93
        for <linux-remoteproc@vger.kernel.org>; Mon, 21 Nov 2022 18:03:56 -0800 (PST)
Received: from dggpeml500024.china.huawei.com (unknown [172.30.72.54])
        by szxga02-in.huawei.com (SkyGuard) with ESMTP id 4NGSGQ5PlWzRpcS;
        Tue, 22 Nov 2022 10:03:26 +0800 (CST)
Received: from [10.174.178.41] (10.174.178.41) by
 dggpeml500024.china.huawei.com (7.185.36.10) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256) id
 15.1.2375.31; Tue, 22 Nov 2022 10:03:54 +0800
Message-ID: <d50405cf-cf16-6704-d5fc-a5e8de994d29@huawei.com>
Date:   Tue, 22 Nov 2022 10:03:54 +0800
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.0
Subject: Re: [PATCH] remoteproc: omap_remoteproc: Fix compile errors about
 casting
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
CC:     <andersson@kernel.org>, <s-anna@ti.com>,
        <jaswinder.singh@linaro.org>, <t-kristo@ti.com>, <afd@ti.com>,
        <linux-remoteproc@vger.kernel.org>
References: <20221118074755.121424-1-yuancan@huawei.com>
 <20221121172530.GB457869@p14s>
From:   Yuan Can <yuancan@huawei.com>
In-Reply-To: <20221121172530.GB457869@p14s>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 8bit
X-Originating-IP: [10.174.178.41]
X-ClientProxiedBy: dggems701-chm.china.huawei.com (10.3.19.178) To
 dggpeml500024.china.huawei.com (7.185.36.10)
X-CFilter-Loop: Reflected
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


在 2022/11/22 1:25, Mathieu Poirier 写道:
> On Fri, Nov 18, 2022 at 07:47:55AM +0000, Yuan Can wrote:
>> The following errors was given when compiling
>> drivers/remoteproc/omap_remoteproc.c:
>>
>> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_mbox_callback’:
>> drivers/remoteproc/omap_remoteproc.c:497:12: error: cast from pointer to integer of different size [-Werror=pointer-to-int-cast]
>>    u32 msg = (u32)data;
>>              ^
>> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_kick’:
>> drivers/remoteproc/omap_remoteproc.c:548:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>    ret = mbox_send_message(oproc->mbox, (void *)vqid);
>>                                         ^
>> drivers/remoteproc/omap_remoteproc.c: In function ‘_omap_rproc_suspend’:
>> drivers/remoteproc/omap_remoteproc.c:783:39: error: cast to pointer from integer of different size [-Werror=int-to-pointer-cast]
>>    ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
>>                                         ^
>> In file included from ./include/linux/device.h:15,
>>                   from ./include/linux/node.h:18,
>>                   from ./include/linux/cpu.h:17,
>>                   from ./include/linux/of_device.h:5,
>>                   from drivers/remoteproc/omap_remoteproc.c:22:
>> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_of_get_internal_memories’:
>> drivers/remoteproc/omap_remoteproc.c:1211:16: error: format ‘%x’ expects argument of type ‘unsigned int’, but argument 6 has type ‘size_t’ {aka ‘long unsigned int’} [-Werror=format=]
>>     dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
>>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>
> I am not seeing any of this on my side with gcc 9.4.0:
>
> $ arm-linux-gnueabihf-gcc --version
> arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>
> What version do you use?
Thanks for the reply, I was working with the wrong cross compiler, sorry 
about the noise.

-- 
Best regards,
Yuan Can

