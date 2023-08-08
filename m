Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 35F00C001B0
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Aug 2023 16:27:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231924AbjHHQ1O (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 8 Aug 2023 12:27:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42668 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232518AbjHHQZa (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 8 Aug 2023 12:25:30 -0400
Received: from mail-wr1-x432.google.com (mail-wr1-x432.google.com [IPv6:2a00:1450:4864:20::432])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B555D8906
        for <linux-remoteproc@vger.kernel.org>; Tue,  8 Aug 2023 08:50:19 -0700 (PDT)
Received: by mail-wr1-x432.google.com with SMTP id ffacd0b85a97d-31751d7d96eso4389247f8f.1
        for <linux-remoteproc@vger.kernel.org>; Tue, 08 Aug 2023 08:50:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1691509817; x=1692114617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=q6MY1hiBmbwXLoucjEj2Xi2SFMUgMZzIdibN/5/2L+I=;
        b=rxp8KJTq0LEaIHv2ENPDFF3rMzPZKTsjH8r4psjGJSNRVRxSE0irDS+GIX/umIYqr2
         Up2K1hkCHTUBKTHcv3TfpBHqySi4iDqFfxZB0iXJYlo+GeMXtnyAwf5JBmSBlQ+B6e1Z
         mVDepLQ/YR1m2hsn9f7Cmttaj62PDfLprBP3KrgPvHUn+Nz+gxwIn4GwvIeaw7MqQk6N
         kv2IJNi0sJu0rrK1FRnDp10QviuKjg3JZ8OXnPJIUkwCVRj3OvmZAdF8++gRVy1YlaiY
         SzvXB9JLDl+E5+oNMs3qyuUp1KWJFqsNDzBOJ7yX0qO/TOTcAbF2mAOhwFgguBA6652V
         2qiQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1691509817; x=1692114617;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=q6MY1hiBmbwXLoucjEj2Xi2SFMUgMZzIdibN/5/2L+I=;
        b=I8dKwQ6ZnnHc7pGGV71WhoV0nXBZ5iRNSFJq6rRePvGVXk6Q1HauVxFomhOF9cKg+0
         VafNU96uS14ds1DyI7vE7ToWLPiR/xaqkij2vDjyAPp25WMZDjZV/RPUjeq9hSrmQl/h
         oucymPF+2gs4P5vsY7RjsBAC1qPmgEwaTHELt0ey8j9eNk0G0YRWl52ObTjn5ma/Nk1u
         XgaPwdv6k0KxT2T3fMw1EUTvjURHg7jjJ7tcuZhdiAw8LfRVKpnKMHKrc9D1s4da8xWQ
         D7zOHdzvd8i742g4l0tsLG6HSC2ErsQXq7WDvgdm5FDK3zXUio0jAzenUE5xd9vkpk30
         Qn5w==
X-Gm-Message-State: AOJu0YwGA9mxpVkkTMM0n4ebcJbSrrzqU/7G34+gjCjBnUqBhIEOJBCr
        Oom+LiF7kyR+c+dPKpuMUMO1xBE0vM2e7EhsnMg=
X-Google-Smtp-Source: AGHT+IEFM3DwvG4gSvRW8WGApgoleljA2c2Cr/zQIjyrhjF0UV2hAUM2hKy+et7OFD1S77hBApF2qg==
X-Received: by 2002:a17:906:54:b0:999:26d3:b815 with SMTP id 20-20020a170906005400b0099926d3b815mr13144104ejg.64.1691506434441;
        Tue, 08 Aug 2023 07:53:54 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.222.113])
        by smtp.gmail.com with ESMTPSA id rk22-20020a170907215600b00982a92a849asm6796311ejb.91.2023.08.08.07.53.52
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 08 Aug 2023 07:53:53 -0700 (PDT)
Message-ID: <8e7cf088-e206-746d-0360-16479b1a33c3@linaro.org>
Date:   Tue, 8 Aug 2023 16:53:51 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.14.0
Subject: Re: [PATCH] dt-bindings: remoteproc: pru: Add Interrupt property
Content-Language: en-US
To:     Md Danish Anwar <a0501179@ti.com>, Conor Dooley <conor@kernel.org>,
        MD Danish Anwar <danishanwar@ti.com>
Cc:     Suman Anna <s-anna@ti.com>, Conor Dooley <conor+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <andersson@kernel.org>,
        linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-omap@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, srk@ti.com,
        nm@ti.com
References: <20230807110836.2612730-1-danishanwar@ti.com>
 <20230807-euphemism-trailing-ef4130dc7437@spud>
 <910a4a98-712a-5517-5a5b-ffb962f83463@ti.com>
 <1ade44f5-b3d1-dcde-6819-9e944f3b115d@linaro.org>
 <5ca41ad1-4f42-f71a-4b5f-f2b6def42cb1@ti.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <5ca41ad1-4f42-f71a-4b5f-f2b6def42cb1@ti.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 08/08/2023 12:57, Md Danish Anwar wrote:
> On 08/08/23 3:48 pm, Krzysztof Kozlowski wrote:
>> On 08/08/2023 11:44, Md Danish Anwar wrote:
>>>>>    properties:
>>>>>      compatible:
>>>>> @@ -171,6 +181,9 @@ examples:
>>>>>                <0x22400 0x100>;
>>>>>          reg-names = "iram", "control", "debug";
>>>>>          firmware-name = "am65x-pru0_0-fw";
>>>>> +        interrupt-parent = <&icssg0_intc>;
>>>>> +        interrupts = <16 2 2>;
>>>>> +        interrupt-names = "vring";
>>>>>        };
>>>>
>>>> These examples would probably be more helpful if they used the
>>>> appropriate defines, no?
>>>>
>>>
>>> PRUSS Interrupt controller doesn't have any appropriate defines. This doesn't
>>> use GIC so defines from arm-gic.h can not be used here. These are specific to
>>> PRUSS INTC.
>>>
>>> I think these example are OK. Please let me know if this is OK to you.
>>
>> But isn't "2" type of the interrupt?
>>
>> Best regards,
>> Krzysztof
>>
> 
> As per the description of interrupts property in ti,pruss-intc.yaml [1]
> 
> Cell 1 is PRU System event number, cell 2 is PRU channel and cell 3 is PRU
> host_event (target). None of them is type of interrupt. So that's why they all
> are hardcoded. I don't think we can use IRQ_TYPE macros here.

OK, thanks for clarifying this.

Best regards,
Krzysztof

