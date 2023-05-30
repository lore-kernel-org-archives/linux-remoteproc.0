Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B7B71C77B73
	for <linux-remoteproc@archiver.kernel.org>; Tue, 30 May 2023 10:45:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231695AbjE3Kpt (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 30 May 2023 06:45:49 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39432 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231696AbjE3Kpc (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 30 May 2023 06:45:32 -0400
Received: from mail-ej1-x631.google.com (mail-ej1-x631.google.com [IPv6:2a00:1450:4864:20::631])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7CB821A5
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 03:45:13 -0700 (PDT)
Received: by mail-ej1-x631.google.com with SMTP id a640c23a62f3a-96fa4a6a79bso626859466b.3
        for <linux-remoteproc@vger.kernel.org>; Tue, 30 May 2023 03:45:13 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1685443512; x=1688035512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=ZVwdZi18tOx4F5EpOQikJaJC+N1FG0YCZmCcPhomPHk=;
        b=S73mFiWbxirjBnXaVpi44ZylcB1rk2ju47gQOmZCRxQN2+s/sqVV1D8hvtUrluFh6E
         no9M/snhG8IGrnRjrp/0xLZxudsQlPuvOzuHvd6vBtx2b5F5l1Szqih9fBYKrBVG1v7U
         lpyV9KLdT4b8zcRvAjcdbvA9YuzHeVxK0SSiTx2LfKVerRUEZBhuAIyQn9Wewc7oGq8v
         qg6nkPqS67PIzeqbmPQU8BlGbbmOfLOx9xTCXFfNPCojYzzzenV/f+Yy1FlbU8C2V0ZS
         uFqTcCVCsSf+3x+VWGzFUnCDVvsrIA9qbSooaz8Vi37COFaDiRwwXAljEV0iT5P/kk50
         swJA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1685443512; x=1688035512;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=ZVwdZi18tOx4F5EpOQikJaJC+N1FG0YCZmCcPhomPHk=;
        b=WfVByq8e2upBmpcdNlQBIsMwM69eJYOIRv9+RWNJAXuwoaFps61UhY2mZp07/mmFjP
         LPEYUcf8GIRvF8WFRTf45VD6upiP78Oktq2UDZw4AcGXHnX5ir36SBkdoLqEnpMpCx12
         3AxHex9YkQDcXVkP2nXfIMwkRaIOL/S6zyHgdDcLEij93hhnsi9j2QjX4abDJ3vBCAMx
         TKBX/EtSpbMbzokuKEZOSapd+xou4aVCdPbqxKxZWDU6S19DE4hIoft1K4UxU7fYPkzB
         4JdxHVED1hBRIePIeWHjJjn7xH8i18SSyuLowjHJwaisCQxx//FxMedLV5z/QJLyZCRy
         Nbww==
X-Gm-Message-State: AC+VfDzFqPdLsw2jEJLZZ81R+XjsePAeLjvOkAYA7473X4qgwdI854DS
        0CPCMITJB0lmHDp5EI7tuqW7UQ==
X-Google-Smtp-Source: ACHHUZ5uBamxXB8i6XT3BS/ZYvZ++f/DXv7dyXHtwOOk5zHSIIHgpWmLsU4LBbiyiCdthKlAqh1erw==
X-Received: by 2002:a17:907:7d94:b0:973:e184:e0fd with SMTP id oz20-20020a1709077d9400b00973e184e0fdmr1899181ejc.70.1685443511792;
        Tue, 30 May 2023 03:45:11 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.199.204])
        by smtp.gmail.com with ESMTPSA id o2-20020a1709062e8200b0094f698073e0sm7040396eji.123.2023.05.30.03.45.09
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 30 May 2023 03:45:11 -0700 (PDT)
Message-ID: <30832bc4-c5b9-9131-2450-3522197ee05d@linaro.org>
Date:   Tue, 30 May 2023 12:45:08 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.0
Subject: Re: [PATCH 01/11] dt-bindings: remoteproc: qcom: Add support for
 multipd model
Content-Language: en-US
To:     Manikanta Mylavarapu <quic_mmanikan@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
        robh+dt@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        jassisinghbrar@gmail.com, mathieu.poirier@linaro.org,
        mturquette@baylibre.com, sboyd@kernel.org, quic_gurus@quicinc.com,
        loic.poulain@linaro.org, quic_eberman@quicinc.com,
        robimarko@gmail.com, linux-arm-msm@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-clk@vger.kernel.org
Cc:     quic_srichara@quicinc.com, quic_gokulsri@quicinc.com,
        quic_sjaganat@quicinc.com, quic_kathirav@quicinc.com,
        quic_arajkuma@quicinc.com, quic_anusha@quicinc.com,
        quic_poovendh@quicinc.com
References: <1678164097-13247-1-git-send-email-quic_mmanikan@quicinc.com>
 <1678164097-13247-2-git-send-email-quic_mmanikan@quicinc.com>
 <38a5a268-7d8a-6e61-4272-8e9155df0034@linaro.org>
 <790496d7-98dc-c92e-dedc-1c89395a1ad8@quicinc.com>
 <4669eed6-b76c-8e68-74b1-36ea52a4bd5b@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <4669eed6-b76c-8e68-74b1-36ea52a4bd5b@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 18/05/2023 19:22, Manikanta Mylavarapu wrote:
>>>
>> It's not required. I am going to remove it.
>>>> +  reg:
>>>> +    maxItems: 1
>>>> +
>>>> +  interrupts-extended:
>>>
>>> Instead interrupts
>>>
>> Sure. I will use 'interrupts'.
>>
> Please discard my previous reply. Here i couldn't able to use 
> 'interrupts' because i am using interrupts from two different interrupt 
> controllers. Sorry for previous wrong reply.

The bindings still should have interrupts. I did not comment on DTS, but
on bindings. interrupts imply (or allow) interrupts-extended.


Best regards,
Krzysztof

