Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id DEBF0C3DA78
	for <linux-remoteproc@archiver.kernel.org>; Sun, 15 Jan 2023 14:38:40 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230137AbjAOOij (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 15 Jan 2023 09:38:39 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40898 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231199AbjAOOii (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 15 Jan 2023 09:38:38 -0500
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 32C42113F8
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Jan 2023 06:38:37 -0800 (PST)
Received: by mail-ej1-x62f.google.com with SMTP id hw16so50749500ejc.10
        for <linux-remoteproc@vger.kernel.org>; Sun, 15 Jan 2023 06:38:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ciei+9RK1lP1ir2O6VrlKkT6Olp4GCKQ9yN4RQZHNxc=;
        b=UF9T6/XDnO2y+7mSMLLO3flansazxWXJIU1S3Uardt/Isqon5iFZ1kyCnrEH3ZsyuH
         7u6t8k5yY0F3qhqmXu8T9wJcZaWEx6qpbd5MkZe9KoMyTcU3m80HXiKmTMXPhHGPo2Ge
         s51mkktv4D+9gwg2+kfo5a4sMaAsM0f27EaLfC6cWbyHABXJED9Sa0kUw8BOxe+qH7/D
         FuJi9WcxM3ZPdlbLJdRekr7MxWFulU4d+HC49WSjK8fJLUID/wPj+4WIpdLV5LdhHVg2
         ro4cdQU00K3bNnb6+/b57X2uMYU1sTdrYfiNlZ5e/QFtGep1fqwXB6nI8wlbzfOM8CcA
         YbpQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ciei+9RK1lP1ir2O6VrlKkT6Olp4GCKQ9yN4RQZHNxc=;
        b=jCOlG9YkuddY/AvoWNTqXJlARM5clsqD7z5UZJuI/p6Jm/yr1qUBeYCFfgyXGhHT8Z
         ue1Tx/SMPGSxaxTEGyWbKvFis3cTDkv3WzFGO90BLZ6OAGjwn5vdS7kKld97nlQ+Fs+4
         +5Uskgx20qFTe1U2sC0yTv1ZUnzxfUrQch9Xr0OA1uJUIOg0kq3/NrIFllK2c6QZqoj5
         kqbjfyr9z6gTsPSNZlNICvskn8q0VSenWWHmqh4QbfoB/EgzwR+elRgyCjt2wihEINc5
         +7lzWbHXrAEZgWob2ZsvoAhf/A5nNAX5wl2FyKNYsh6jcJVp3B4PSAzpR3056ZGVHKRN
         m6Sw==
X-Gm-Message-State: AFqh2krGz4Bca5fg5NlYPgOY/QKJoyzvuty9LWWZRUkj/TU2N3Mt50IS
        t1+N1fCsrz5uCfoDh0bTrAl+zg==
X-Google-Smtp-Source: AMrXdXuA43mEvs+xddNRHWH4r6rh3XmWCN4ygPgTA2hYxPxnsVuVFNHY9JTMig4VsAowVle69yinow==
X-Received: by 2002:a17:906:2993:b0:86c:e53a:d20b with SMTP id x19-20020a170906299300b0086ce53ad20bmr5286286eje.21.1673793515741;
        Sun, 15 Jan 2023 06:38:35 -0800 (PST)
Received: from [192.168.1.109] ([178.197.216.144])
        by smtp.gmail.com with ESMTPSA id p14-20020a17090653ce00b0085ea718a81bsm5362037ejo.198.2023.01.15.06.38.34
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 15 Jan 2023 06:38:35 -0800 (PST)
Message-ID: <9f4994de-e468-43ea-f8db-d4a37ebc30e0@linaro.org>
Date:   Sun, 15 Jan 2023 15:38:33 +0100
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
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <b79f7e0a-8048-d0e1-ad0b-d15d72288fde@amd.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13/01/2023 19:08, Tanmay Shah wrote:
> 
> On 1/12/23 11:52 PM, Krzysztof Kozlowski wrote:
>> On 13/01/2023 08:30, Tanmay Shah wrote:
>>> This patch introduces bindings for TCM memory address space on AMD-xilinx
>>> platforms. As of now TCM addresses are hardcoded in xilinx remoteproc
>>> driver. This bindings will help in defining TCM in device-tree and
>>> make it's access platform agnostic and data-driven from the driver.
>>>
>> Subject: drop second/last, redundant "bindings". The "dt-bindings"
>> prefix is already stating that these are bindings.
> 
> Ack.
> 
> 
>>
>> Where is driver or DTS? Are you now adding a dead binding without users?
> 
> 
> TCM is used by drivers/remoteproc/xlnx_r5_remoteproc.c driver. Howerver, 
> we have hardcode addresses in TCM as bindings are not available yet.

I don't see usage of these compatibles there. You also did not supply
DTS here. Please provide users of bindings within the same patchset.


Best regards,
Krzysztof

