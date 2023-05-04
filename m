Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6248FC77B78
	for <linux-remoteproc@archiver.kernel.org>; Thu,  4 May 2023 12:03:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229993AbjEDMDZ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 4 May 2023 08:03:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39924 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229535AbjEDMDX (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 4 May 2023 08:03:23 -0400
Received: from mail-ej1-x62f.google.com (mail-ej1-x62f.google.com [IPv6:2a00:1450:4864:20::62f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 8BB6C5FCE
        for <linux-remoteproc@vger.kernel.org>; Thu,  4 May 2023 05:03:20 -0700 (PDT)
Received: by mail-ej1-x62f.google.com with SMTP id a640c23a62f3a-94f910ea993so58739866b.3
        for <linux-remoteproc@vger.kernel.org>; Thu, 04 May 2023 05:03:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1683201799; x=1685793799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=s+Flag063oKB8Q1wi7qSq3Ulfch+IJh7NyCjAcrM3ZE=;
        b=IYSagRNF//SQQg3BUrc4S0KxF4KoLFjA33rsTrtPcO+JqKa0apRPWl3U/wTAQGSPab
         EMIlYccEyXfAq/FZbXhwWuNSi9fTJA9Mvk9gQXY3XKjy+jJyqiAgA4hdAzjo7YwIYV9A
         kLY7Gb5r0+74CruZqUJR7vCI7ztmSbAPfO5C5oDy9r/TPJX7gxQx/7lFewrjHkxU/2iD
         FJmcWSSM9eMxEfD9id6y3uUHPpxJJ9rfw9l9k8ONvWbnLsu9CXahoFDQHWwz84eFGUG6
         l4hoPL76xLEX1cchsBjY6o/dy2dFCUZUy67fDdvDV7VXOHgksXeEf/g5VnVW6OcaOHct
         luCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1683201799; x=1685793799;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=s+Flag063oKB8Q1wi7qSq3Ulfch+IJh7NyCjAcrM3ZE=;
        b=SHNfhyiOhUWvTvFBQ3Q7Fm1krg7XEcbIx8PW2SaIZ7OvXg5fWyUrLV/p5tCtsJWMw5
         ucTZXTtagzA11Rcrh715t5vUsPQR2//iWOBCKXmuNnvH6QvRVAE0bKNrLdfVs6D+Tg0a
         nNOVOvF+DscjliZY1TApnVBO5/Zjh2fOy44QFSeGLxMkCICm/C8Ao0P8/S4Fh4GmEOqV
         etQj3Tl6Bugwiqqr2G4TzUApeZEPsmaWDNn4rlVzjs6kVeO/XbqHETgG84VE9SyRt2Iz
         WGMd3FKlHaQgsAojhuGiW1wY7zy1UsCr/wPnstF0UqZz23SsTsdVShjaWtwxrLP5moDe
         y9CQ==
X-Gm-Message-State: AC+VfDzcnBis+UYWObhIR/g4LBvQTMMOpfxkwCokYK3P17OhiMYOqMzi
        2TJ7a2oBUH8bs0ER+S+ixgbW3Q==
X-Google-Smtp-Source: ACHHUZ47YNIr6sZk/XYPHNt6yECSYNBOnFaK5lc1XKM9RfUQ+Fa5l3+EvXb6aEqviIAPoQw+tOeQvQ==
X-Received: by 2002:a17:907:268c:b0:92b:3c78:91fa with SMTP id bn12-20020a170907268c00b0092b3c7891famr5405677ejc.28.1683201798867;
        Thu, 04 May 2023 05:03:18 -0700 (PDT)
Received: from ?IPV6:2a02:810d:15c0:828:cbf1:e7ef:fb81:e912? ([2a02:810d:15c0:828:cbf1:e7ef:fb81:e912])
        by smtp.gmail.com with ESMTPSA id oz15-20020a1709077d8f00b0095850aef138sm15707511ejc.6.2023.05.04.05.03.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 04 May 2023 05:03:18 -0700 (PDT)
Message-ID: <659a9637-f82c-054b-99a8-dc25416c8e13@linaro.org>
Date:   Thu, 4 May 2023 14:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.10.1
Subject: Re: [PATCH v3 02/18] remoteproc: qcom: Move minidump specific data to
 qcom_minidump.h
Content-Language: en-US
To:     Mukesh Ojha <quic_mojha@quicinc.com>, agross@kernel.org,
        andersson@kernel.org, konrad.dybcio@linaro.org, corbet@lwn.net,
        keescook@chromium.org, tony.luck@intel.com, gpiccoli@igalia.com,
        catalin.marinas@arm.com, will@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, robh+dt@kernel.org,
        linus.walleij@linaro.org, linux-gpio@vger.kernel.org,
        srinivas.kandagatla@linaro.org
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-doc@vger.kernel.org
References: <1683133352-10046-1-git-send-email-quic_mojha@quicinc.com>
 <1683133352-10046-3-git-send-email-quic_mojha@quicinc.com>
 <fe94ed5c-c444-436d-720a-c96538c1026d@linaro.org>
 <e69862cc-4185-a7a2-07b2-15e331c4678a@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <e69862cc-4185-a7a2-07b2-15e331c4678a@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 04/05/2023 13:58, Mukesh Ojha wrote:
> 
> 
> On 5/4/2023 5:08 PM, Krzysztof Kozlowski wrote:
>> On 03/05/2023 19:02, Mukesh Ojha wrote:
>>> Move minidump specific data types and macros to a separate internal
>>> header(qcom_minidump.h) so that it can be shared among different
>>> Qualcomm drivers.
>>
>> No, this is not internal header. You moved it to global header.
>>
>> There is no reason driver internals should be exposed to other unrelated
>> subsystems.
>>
>>>
>>> There is no change in functional behavior after this.
>>
>> It is. You made all these internal symbols available to others.
>>
>>>
>>
>> This comes without justification why other drivers needs to access
>> private and internal data. It does not look correct design. NAK.
> 
> Thanks for catching outdated commit text, will fix the commit with
> more descriptive reasoning.
> 
> It has to be global so that co-processor minidump and apss minidump can
> share data structure and they are lying in different directory.
> 

Then you should not share all the internals of memory layout but only
few pieces necessary to talk with minidump driver. The minidump driver
should organize everything how it wants.

Best regards,
Krzysztof

