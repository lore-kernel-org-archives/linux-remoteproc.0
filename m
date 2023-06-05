Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8CD2FC7EE23
	for <linux-remoteproc@archiver.kernel.org>; Mon,  5 Jun 2023 19:56:09 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236101AbjFET4H (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 5 Jun 2023 15:56:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36130 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235835AbjFET4F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 5 Jun 2023 15:56:05 -0400
Received: from mail-lj1-x233.google.com (mail-lj1-x233.google.com [IPv6:2a00:1450:4864:20::233])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E99B6D3
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 12:56:03 -0700 (PDT)
Received: by mail-lj1-x233.google.com with SMTP id 38308e7fff4ca-2b1a66e71f9so61828431fa.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 12:56:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685994962; x=1688586962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=idaUBqVeErLky4F1j+heLBMP/TcoaCa3uvkOaqMKVks=;
        b=jB2mTZhpHSkaKfna/9C4EkxRefLNVSzOE97EH/giJXs1JDAR+sl5Uvol5xS3AtIc7K
         oP0eoqMJdaFo2MOPPT/gzn7E7jWUw1/C3yDQ9DwbIrOrZnWe07z2SrVIqLc/Xo33v8Gr
         w/iL4jPlgtm3zErEcqnJ4LmrtQz45wfH+ba1n9MEC0KNGkh+xh6dbbQs40ibsfBNN8YL
         KKvrvR50bDv7H2EBVnE8TIpGQo/3f3H6ug8HgKVgv8Ym4Pw9TM1X9rQ2S6Yyw1cam97F
         OjrZvgsaGL/m5yR/+Bc8MZSbX45FbV5aPlo3f5SUttqe6o7rzbVFS0abvyit27+sT/I9
         3OXw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685994962; x=1688586962;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=idaUBqVeErLky4F1j+heLBMP/TcoaCa3uvkOaqMKVks=;
        b=MH8EeWNqnAHsgDtpAZvrh1nlEdgtOHdLGD8kf6sLF7iTeczVEREAs0w9fqreH9+Ijo
         xc3oWfiWGCtPI6o2UwFlO+phFsP3PAYQ4gpmmRnWD3k6BdOLCEG9r9QDvbhd8OCe2Oed
         cn7isBmsIEnIA6o2GUj0NN4MvmukCDJBq3eWteJS6fR3lQNJ1WBN0HN4WuCA58XThugj
         1MZSSz+3ZGTAMlPN8UxHXxei7rV4gtCJZmp8RW3ORONc426U/Vx+QSBEjIWkKyFi8hI8
         ZZXn0SwWPl8SVJOs7LpeGsJ/Z4UyvtS6adUFMuWwlkSPioUNPuFGQ7+Rl7UZ8QkBQ8mt
         DKhw==
X-Gm-Message-State: AC+VfDxeVg10iOguF53G7GUwZTgMArdIHIjEY6vYBNLhGltoed47zx+3
        hjahiYpy43To5PyTIWanTnoYbg==
X-Google-Smtp-Source: ACHHUZ6BoyY3MVTqSMuSx/F/qQNLLVXqNBfbuqwyzyxkwChn+u65546zFt0qtqmbpGYPkK/Vr2m4gg==
X-Received: by 2002:a2e:9215:0:b0:2b1:a810:e442 with SMTP id k21-20020a2e9215000000b002b1a810e442mr118835ljg.49.1685994962241;
        Mon, 05 Jun 2023 12:56:02 -0700 (PDT)
Received: from [192.168.1.101] (abyj96.neoplus.adsl.tpnet.pl. [83.9.29.96])
        by smtp.gmail.com with ESMTPSA id z7-20020a2e8e87000000b002a9ee18e9c7sm1517279ljk.69.2023.06.05.12.56.00
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 12:56:01 -0700 (PDT)
Message-ID: <ce80b713-3c42-9cd3-73b1-9dcfb194140a@linaro.org>
Date:   Mon, 5 Jun 2023 21:55:59 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 10/14] soc: qcom: Add RPM processor/subsystem driver
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>
Cc:     Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-10-e0a3b6de1f14@gerhold.net>
 <04745990-d270-b37c-7ac8-dff24b03e02b@linaro.org>
 <ZH480vq8iNgkoK78@gerhold.net>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
In-Reply-To: <ZH480vq8iNgkoK78@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org



On 5.06.2023 21:51, Stephan Gerhold wrote:
> On Mon, Jun 05, 2023 at 09:06:54PM +0200, Konrad Dybcio wrote:
>>
>>
>> On 5.06.2023 09:08, Stephan Gerhold wrote:
>>> Add a simple driver for the qcom,rpm-proc compatible that registers the
>>> "smd-edge" and populates other children defined in the device tree.
>>>
>>> Note that the DT schema belongs to the remoteproc subsystem while this
>>> driver is added inside soc/qcom. I argue that the RPM *is* a remoteproc,
>>> but as an implementation detail in Linux it can currently not benefit
>>> from anything provided by the remoteproc subsystem. The RPM firmware is
>>> usually already loaded and started by earlier components in the boot
>>> chain and is not meant to be ever restarted.
>>>
>>> To avoid breaking existing kernel configurations the driver is always
>>> built when smd-rpm.c is also built. They belong closely together anyway.
>>>
>>> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
>>> ---
[...]

> SMEM is arch_initcall() so at least for the SMD case it can never
> succeed probing in core_initcall() and would likely just cause
> unnecessary probe deferrals. That's why I chose arch_initcall().
> 
> Are you sure anything will really benefit from core_initcall() here?
> 
> I'd just like to avoid making things worse by using a random way too
> early initcall level. We have some really weird examples in the tree
> currently, e.g.:
>   - rpmpd: core_initcall()
>   - smd-rpm: arch_initcall()
>   - glink-rpm: subsys_initcall()
> But they actually need to be loaded in opposite order...
Yes, we should make some sort of dep graph and clean it up..

Konrad
> 
> Thanks,
> Stephan
