Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8ADB6C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 23 Apr 2022 09:30:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234467AbiDWJdG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 23 Apr 2022 05:33:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57822 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233884AbiDWJdD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 23 Apr 2022 05:33:03 -0400
Received: from mail-ed1-x52c.google.com (mail-ed1-x52c.google.com [IPv6:2a00:1450:4864:20::52c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9E6C9BF5C
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Apr 2022 02:30:06 -0700 (PDT)
Received: by mail-ed1-x52c.google.com with SMTP id f17so13090020edt.4
        for <linux-remoteproc@vger.kernel.org>; Sat, 23 Apr 2022 02:30:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :references:from:in-reply-to:content-transfer-encoding;
        bh=gWNw5+tyYy38JczrM/Le6iFuWZtqe0ibvfQtEBkowsM=;
        b=XrZhBiLZkTj6awE8Oa2tePjxJTvXAsAMkci6X9xRgDwn6KkvTCZio19A+yzapOy4wB
         wJu16oPNvOEvZzboyd2oTUeA6n+AgzqlviXIq1j6WOUpGCRDlZR3Mb1DuX+AzWjaaPOy
         KfwppWcQ//QZpmYHA+FU0n5TmhObH/Lb6NH0uhMAUjW2jC0gCEwh7+4SyylHHctS96eK
         vf/591cZagJ5+bIJaXpBE8X+B14kd5HHB69aqjvd+mDHQrk8H/Rpnpj9MUrLttvB6Ron
         JrvDpqredRVY6I/BdegUFJk4fOe4L+7I4MazPvzJy7tcVKfhGYYi5k0wh4wl8+9BxTgN
         csPw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:references:from:in-reply-to
         :content-transfer-encoding;
        bh=gWNw5+tyYy38JczrM/Le6iFuWZtqe0ibvfQtEBkowsM=;
        b=CBJ6+AhWaiLAfo5sa43FTVbR+/LJ3laKQg6FD2Y92ioS2tnV5qX5tJdfg5RKc0u7EK
         udLbQFyqta2w3SXL5fFcDHlkwqehPsYjnf9YJmnC2CrhTA6Wmb5gawk0R9zn/sLyIwbp
         X5M7r+l6K4ho8yAjXIgIenbJ0X1lhRzfH2ofZseCimhdBInopQVvtQTGS2FO71aRzCy6
         0Bb0cRzGTHrOweuX/wCFY1RagJIMKPSprAoxcTdEWG8Jkr8Hz78wgmWP8yPszG4YaPfA
         huCPkmb8zDAuDGpxFPaIi3OWz+fkJ8wV8mK200R305bIQTu96jffAsZIDKQ5Uq0Y0c8z
         INNw==
X-Gm-Message-State: AOAM530Wtk1NtC3IYz7L1bvSVdBMBFwIbmt5y8ZH6aPtFgwmyxfpp5Hh
        0auw7nnObQTAdSEb1gBtykKV3g==
X-Google-Smtp-Source: ABdhPJxeDR7QS2kOkE0ODj+LMaknx4juR2ZAXuS9FLTupPezfuk6ii3SSBINfNMgM2GUf4ES/6+/JA==
X-Received: by 2002:a05:6402:14c2:b0:41d:816a:4eb0 with SMTP id f2-20020a05640214c200b0041d816a4eb0mr9178123edx.301.1650706205187;
        Sat, 23 Apr 2022 02:30:05 -0700 (PDT)
Received: from [192.168.0.234] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id bw3-20020a170906c1c300b006e88cdfbc32sm1529556ejb.45.2022.04.23.02.30.04
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 23 Apr 2022 02:30:04 -0700 (PDT)
Message-ID: <b96bb266-e4d2-c291-ddb3-f27e55d10fbd@linaro.org>
Date:   Sat, 23 Apr 2022 11:30:03 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.7.0
Subject: Re: (subset) [PATCH] rpmsg: qcom_smd: Fix irq_of_parse_and_map()
 return value
Content-Language: en-US
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org
References: <20220422105326.78713-1-krzysztof.kozlowski@linaro.org>
 <165068558593.2759280.17055526649115604333.b4-ty@linaro.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <165068558593.2759280.17055526649115604333.b4-ty@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 23/04/2022 05:46, Bjorn Andersson wrote:
> On Fri, 22 Apr 2022 12:53:26 +0200, Krzysztof Kozlowski wrote:
>> The irq_of_parse_and_map() returns 0 on failure, not a negative ERRNO.
>>
>>
> 
> Applied, thanks!
> 
> [1/1] rpmsg: qcom_smd: Fix irq_of_parse_and_map() return value
>       commit: 1a358d35066487d228a68303d808bc4721c6b1b9

Thanks, unfortunately Jakub Kicinski pointed out issue with returning 0
later, which needs a fix. I'll send a fix which can be squashed.


Best regards,
Krzysztof
