Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1AA28C63797
	for <linux-remoteproc@archiver.kernel.org>; Tue, 17 Jan 2023 08:16:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235755AbjAQIQu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 Jan 2023 03:16:50 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60296 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236079AbjAQIQ2 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 Jan 2023 03:16:28 -0500
Received: from mail-wm1-x32a.google.com (mail-wm1-x32a.google.com [IPv6:2a00:1450:4864:20::32a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8E6C42B297
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Jan 2023 00:16:16 -0800 (PST)
Received: by mail-wm1-x32a.google.com with SMTP id g10so21588089wmo.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 17 Jan 2023 00:16:16 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=MniqT50xTIKf23nCYYQVIFdFTyVxB6d77UGvsd3jQmE=;
        b=QZUNGJxRadgtAqr6+gc3Q0csSv0U+Lwo0BrlcwwgeJ7BYRdGHtE7pL+sEL1oMPoycm
         0nQWVJLRNRJPFqTu7UBUczm0o3Yd75YZMEXD/RRx64l2rHPZBSg49hNBSA/IiP5jVZ2u
         k5Rdh0SZE62kBgEi5CAlAI336afwiYJcvT1ELz34ad7YrTG976NaDTDZS/9KVojsnMkj
         MK8iuBSftWcBSjCrw+jyDpAa1hBZb3qblt4pCYM//HTujb1Pb2LhfcLr52PPgJ3/w+Fd
         a69VbvJAII5II12rjYA0Hg98butbIhgkPAoFqvgJEQLozusJNmrOg9YW8wBs7RESvJ0/
         0/vQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=MniqT50xTIKf23nCYYQVIFdFTyVxB6d77UGvsd3jQmE=;
        b=rpaxm0BLTNdbpejxxM98oCDjcRR7scpHonBODzzdV37yUTAgQar446aYsvUCld0/zj
         P58lKD5qdSkd7tkLQ83Qf2CwSnxHn6+UrhCnIO3m8iAXtfz7c/pHB7jm5wunH5kprk+q
         u4/Lv1FjnvqK5qCM8fFsgDh2J7KnQeAg9zYweOiQi4HNltUdZ/Jlfqme07MDwgsZVS94
         9ZKVzBjWKHhS1ncAFJVn6cqmffy9YBUEs60CgxoihU0/Kf2MlTFw4BPa8Ss0Ted+gqfe
         A0btgww1tqsJPwxNguQwJdbcceLy3vVj5359n+VPD/oYr1AxrB8Rgo3VGwX850OhZEm9
         JwHw==
X-Gm-Message-State: AFqh2kp84610NpkK7Kx6hOq91W7MVnX6ScWFyD4deUCBB83YTrRbiRpG
        HWI0ujdW5KuOklM1tK9aSUYFqQ==
X-Google-Smtp-Source: AMrXdXthfQHssHykaq9/OgDw5mF51VE1Y9UJZjDBIV6rSLZd74JZRc3aRCTURJ8wUHySl3Dh5eyvqA==
X-Received: by 2002:a1c:f308:0:b0:3d9:fb59:c16b with SMTP id q8-20020a1cf308000000b003d9fb59c16bmr10759435wmq.36.1673943374886;
        Tue, 17 Jan 2023 00:16:14 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id g12-20020a05600c310c00b003c70191f267sm44245099wmo.39.2023.01.17.00.16.10
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 17 Jan 2023 00:16:14 -0800 (PST)
Message-ID: <96081a96-e74c-8165-c0e6-212a670c9074@linaro.org>
Date:   Tue, 17 Jan 2023 09:16:09 +0100
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.6.1
Subject: Re: [PATCH] dt-bindings: sram: Tightly Coupled Memory (TCM) bindings
Content-Language: en-US
To:     Tanmay Shah <tanmays@amd.com>, Tanmay Shah <tanmay.shah@amd.com>,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
References: <20230113073045.4008853-1-tanmay.shah@amd.com>
 <6f43e320-b533-e5fb-3886-1b6ccc7f9548@linaro.org>
 <b79f7e0a-8048-d0e1-ad0b-d15d72288fde@amd.com>
 <9f4994de-e468-43ea-f8db-d4a37ebc30e0@linaro.org>
 <980d9c9c-3dbf-3ebd-28a1-5b3b4b58e93e@amd.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <980d9c9c-3dbf-3ebd-28a1-5b3b4b58e93e@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 16/01/2023 18:43, Tanmay Shah wrote:
> 
> On 1/15/23 6:38 AM, Krzysztof Kozlowski wrote:
>> On 13/01/2023 19:08, Tanmay Shah wrote:
>>> On 1/12/23 11:52 PM, Krzysztof Kozlowski wrote:
>>>> On 13/01/2023 08:30, Tanmay Shah wrote:
>>>>> This patch introduces bindings for TCM memory address space on AMD-xilinx
>>>>> platforms. As of now TCM addresses are hardcoded in xilinx remoteproc
>>>>> driver. This bindings will help in defining TCM in device-tree and
>>>>> make it's access platform agnostic and data-driven from the driver.
>>>>>
>>>> Subject: drop second/last, redundant "bindings". The "dt-bindings"
>>>> prefix is already stating that these are bindings.
>>> Ack.
>>>
>>>
>>>> Where is driver or DTS? Are you now adding a dead binding without users?
>>>
>>> TCM is used by drivers/remoteproc/xlnx_r5_remoteproc.c driver. Howerver,
>>> we have hardcode addresses in TCM as bindings are not available yet.
>> I don't see usage of these compatibles there. You also did not supply
>> DTS here. Please provide users of bindings within the same patchset.
> 
> 
> ACK. I will supply dts as well.
> 
> However, Is it ok if I convert this patch to RFC patch, and once 
> bindings are fixed I will send actual patch with driver support.
> 
> If bindings design is not correct then I might have to change 
> corresponding driver design lot.

First, why this driver is particularly special? Why should have other
treatment then all other cases?

Second, so think about bindings and do not submit something for "driver"
but something describing hardware.

Best regards,
Krzysztof

