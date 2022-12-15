Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 17F8AC4332F
	for <linux-remoteproc@archiver.kernel.org>; Thu, 15 Dec 2022 06:59:13 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229918AbiLOG7M (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 15 Dec 2022 01:59:12 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52796 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229937AbiLOG5L (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 15 Dec 2022 01:57:11 -0500
Received: from mail-wm1-x329.google.com (mail-wm1-x329.google.com [IPv6:2a00:1450:4864:20::329])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 08D605D687
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 22:56:43 -0800 (PST)
Received: by mail-wm1-x329.google.com with SMTP id f13-20020a1cc90d000000b003d08c4cf679so1083060wmb.5
        for <linux-remoteproc@vger.kernel.org>; Wed, 14 Dec 2022 22:56:42 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=KuVP+M2zKF4r2H4c9I4yjKyhc1LGvPoSRK+AlGdeuIQ=;
        b=ZURxRJADnCdUBcfIIdzlAQKDXayXRwzfFAETMBrjvQUxGiCCuVHQ2NVzqJtxazdFKQ
         PxRb+3hk8cllF1L99edHRi0C8csbZf6Ld2d2OfAbL6hRkuxKeKbmdPGxzyCek8mQ4wbt
         Bs2snw1o8+nhHlK8bEfQT7qBTjBNy7B6VaVib+jUg3knhSSvcRNw0pLO65kSGCiyWo04
         i/1DVvZaJO87r0f39Cl29TJZqQtCCt7+basSNurhlRbfJJ1ryd0641kK3Nz9IqGVbnjJ
         Ybn/4Lngmc4MDGaBtFx9a8ilfMOeetleCV+k46gBmzh5ZxD/mgK68rr+qtQL3gWNcKFO
         uh3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KuVP+M2zKF4r2H4c9I4yjKyhc1LGvPoSRK+AlGdeuIQ=;
        b=dWPP7J0tGFq3h1C8LdyOzF1XZTaNm47b6zl8al0NsTsU6yPja8A3Ks7NZLIkqgt1Mw
         1GLXsneoDMjnS8OrnhYKDrGmONfV4c8rLdqaN8qnD5JHJhGR33ZoS2ERMomKMqepC75i
         +tf6imXhu+Or01eK6JNyJdoAUxkoCnxYBAreP3pG413JFIXJgmcn71g2tEz6KiMelWb0
         Hq2A8L7llN81+F3JEIGKM6QXDNBrovMmSVvSh9y8ryExVPoX9UUAgkSgFdOyvI1T7eJg
         VKi7Tu7AZYtQfhkyAbcolf3t8rby3wwIAqNlGy7ASC6sc78hGsZzlARUR746fQQd07l5
         DwcQ==
X-Gm-Message-State: ANoB5pm7UA3KvG9Bf/aXzmiCCJjaPt1vkcjrU8n1bsPQZPoQ6v5ZZ6wf
        Y7XhQQS12XVuikl5KH2tzwlhPw==
X-Google-Smtp-Source: AA0mqf5uYVZ0oNvCI6dD1xOo1Maa+jO301fIzeTdsmmgrlbwCwV5VAvediAJVLlbEpIIaRdHG04LHA==
X-Received: by 2002:a05:600c:4f85:b0:3c6:f732:bf6f with SMTP id n5-20020a05600c4f8500b003c6f732bf6fmr21620670wmq.13.1671087401558;
        Wed, 14 Dec 2022 22:56:41 -0800 (PST)
Received: from [192.168.30.216] ([81.0.6.76])
        by smtp.gmail.com with ESMTPSA id e5-20020a05600c254500b003c6d21a19a0sm4853090wma.29.2022.12.14.22.56.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 14 Dec 2022 22:56:41 -0800 (PST)
Message-ID: <edd9bea5-0519-585a-35b2-ae1dd04a603a@linaro.org>
Date:   Thu, 15 Dec 2022 07:56:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.5.1
Subject: Re: [PATCH] remoteproc: omap_remoteproc: Fix compile errors about
 casting
Content-Language: en-US
To:     Yuan Can <yuancan@huawei.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     andersson@kernel.org, s-anna@ti.com, jaswinder.singh@linaro.org,
        t-kristo@ti.com, afd@ti.com, linux-remoteproc@vger.kernel.org
References: <20221118074755.121424-1-yuancan@huawei.com>
 <20221121172530.GB457869@p14s>
 <d50405cf-cf16-6704-d5fc-a5e8de994d29@huawei.com>
From:   =?UTF-8?Q?Philippe_Mathieu-Daud=c3=a9?= <philmd@linaro.org>
In-Reply-To: <d50405cf-cf16-6704-d5fc-a5e8de994d29@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Yuan,

On 22/11/22 03:03, Yuan Can wrote:
> 在 2022/11/22 1:25, Mathieu Poirier 写道:
>> On Fri, Nov 18, 2022 at 07:47:55AM +0000, Yuan Can wrote:
>>> The following errors was given when compiling
>>> drivers/remoteproc/omap_remoteproc.c:
>>>
>>> drivers/remoteproc/omap_remoteproc.c: In function 
>>> ‘omap_rproc_mbox_callback’:
>>> drivers/remoteproc/omap_remoteproc.c:497:12: error: cast from pointer 
>>> to integer of different size [-Werror=pointer-to-int-cast]
>>>    u32 msg = (u32)data;
>>>              ^
>>> drivers/remoteproc/omap_remoteproc.c: In function ‘omap_rproc_kick’:
>>> drivers/remoteproc/omap_remoteproc.c:548:39: error: cast to pointer 
>>> from integer of different size [-Werror=int-to-pointer-cast]
>>>    ret = mbox_send_message(oproc->mbox, (void *)vqid);
>>>                                         ^
>>> drivers/remoteproc/omap_remoteproc.c: In function ‘_omap_rproc_suspend’:
>>> drivers/remoteproc/omap_remoteproc.c:783:39: error: cast to pointer 
>>> from integer of different size [-Werror=int-to-pointer-cast]
>>>    ret = mbox_send_message(oproc->mbox, (void *)suspend_msg);
>>>                                         ^
>>> In file included from ./include/linux/device.h:15,
>>>                   from ./include/linux/node.h:18,
>>>                   from ./include/linux/cpu.h:17,
>>>                   from ./include/linux/of_device.h:5,
>>>                   from drivers/remoteproc/omap_remoteproc.c:22:
>>> drivers/remoteproc/omap_remoteproc.c: In function 
>>> ‘omap_rproc_of_get_internal_memories’:
>>> drivers/remoteproc/omap_remoteproc.c:1211:16: error: format ‘%x’ 
>>> expects argument of type ‘unsigned int’, but argument 6 has type 
>>> ‘size_t’ {aka ‘long unsigned int’} [-Werror=format=]
>>>     dev_dbg(dev, "memory %8s: bus addr %pa size 0x%x va %pK da 0x%x\n",
>>>                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
>>>
>> I am not seeing any of this on my side with gcc 9.4.0:
>>
>> $ arm-linux-gnueabihf-gcc --version
>> arm-linux-gnueabihf-gcc (Ubuntu 9.4.0-1ubuntu1~20.04.1) 9.4.0
>>
>> What version do you use?
> Thanks for the reply, I was working with the wrong cross compiler, sorry 
> about the noise.

Don't worry about being noisy ;) What would have helped here is if you
mentioned the version of the compiler you used in the commit description
(usually the output of '$CC --version').

Back to your patch content, the format string fix is correct (the 3rd
hunk).

Regard,

Phil.
