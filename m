Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 49DCCECAAA1
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 Oct 2022 17:04:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230315AbiJ1REO (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 28 Oct 2022 13:04:14 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230306AbiJ1RD4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 28 Oct 2022 13:03:56 -0400
Received: from mail-qv1-xf2f.google.com (mail-qv1-xf2f.google.com [IPv6:2607:f8b0:4864:20::f2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23CAC7858A
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Oct 2022 10:02:24 -0700 (PDT)
Received: by mail-qv1-xf2f.google.com with SMTP id e15so4455039qvo.4
        for <linux-remoteproc@vger.kernel.org>; Fri, 28 Oct 2022 10:02:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=8Vt2NRfPYoZ2LtBVbnQGBt2MOSimjRuiE+rlZh3+5+g=;
        b=jPdqWef5RqLJJwMWlMCL6Yputv2Coc+NkBGsrEHXX6tbmnDpP2NtnvxtTSP6fRdSq3
         9Kqz/c71UIa4gQ+A2LP6PMOTjv0toDO9Wbv24q8Hi0vvzBmXumFDNfw9ZLYIwiEjZOJ8
         tWNjQ3tHwc9WfYtIkV9WiIhYUQunkYzUK40ZvlMd1aAkb7yjfS8eWBVm04flWli+1qZa
         LsSLi79kWqEp7HNoQgl4Fari2Zxp91qcZm24d/SnU/0pvHXGnlsVVzcCi79dUNo/9tVG
         JqDBVt9Yu1hENE81e2/abORwdPlEIwgnb9Sked0wA9H4R3ttr5u75sNyIpAQ/PXngxml
         Sazg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:references:to:from
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=8Vt2NRfPYoZ2LtBVbnQGBt2MOSimjRuiE+rlZh3+5+g=;
        b=GpV4GVKi3o+NFcZSDRmp0vVl7Nlq25H97wJyxppcKpXwGerNlvQT6NgXRSoEaDw5pf
         Mfm3MiTXNGtI28Mot77EQcdwcTyrRXB9iRv7fW+GuOr2oj959TKwUPVeZjGU+kaiRzWr
         Sz41D3eYWVIa4v5V3csqV9RsFs/ee/PNfgq9aw9aWQ9nigkMbyBYU6tTJZNPFigeN69l
         2NVUN9ItkoxtLDdIHQEf8FQrpPU+Z/WSaHeiQdNuyETgLGlTDmOCXQErYlGaV3Qtxp0m
         F+kz88P/jKRGUy7r72wk6uwqhJCaoGhaMHfZSkDuNB3/WdPDl+OYuLAtmNFniaR1Ofm2
         rEmA==
X-Gm-Message-State: ACrzQf3WG+VOWVFePSvR2w3WTfLw2Xzns9Rdl/SGPKMYenWLve6wcvoh
        wDN7m8xZd1ER2/fKPY5UH+4olw==
X-Google-Smtp-Source: AMsMyM7WI6/C5Bbg8LE38AWlmWBGVBzI2D+TeBS/UIIXN5bby8fjbj0k0m/zk8IVDHE2noidzevKhw==
X-Received: by 2002:a05:6214:2b06:b0:4bb:5716:d1c3 with SMTP id jx6-20020a0562142b0600b004bb5716d1c3mr365680qvb.85.1666976543183;
        Fri, 28 Oct 2022 10:02:23 -0700 (PDT)
Received: from [192.168.1.11] ([64.57.193.93])
        by smtp.gmail.com with ESMTPSA id bn1-20020a05620a2ac100b006b5c061844fsm3223584qkb.49.2022.10.28.10.02.17
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 28 Oct 2022 10:02:22 -0700 (PDT)
Message-ID: <97b462ea-e283-60ee-e272-b136ca08a251@linaro.org>
Date:   Fri, 28 Oct 2022 13:02:13 -0400
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.4.1
Subject: Re: [PATCH v10 1/7] dt-bindings: remoteproc: qcom: Add SC7280 ADSP
 support
Content-Language: en-US
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1664368073-13659-1-git-send-email-quic_srivasam@quicinc.com>
 <1664368073-13659-2-git-send-email-quic_srivasam@quicinc.com>
 <a1a78c72-2067-1ea8-a50e-0dcf4ae4bb83@linaro.org>
In-Reply-To: <a1a78c72-2067-1ea8-a50e-0dcf4ae4bb83@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 29/09/2022 03:32, Krzysztof Kozlowski wrote:
> On 28/09/2022 14:27, Srinivasa Rao Mandadapu wrote:
>> Add ADSP PIL loading support for SC7280 SoCs.
>>
>> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
>> Reviewed-by: Rob Herring <robh@kernel.org>
>> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
>> ---
>> Changes since V9:
>> 	-- Add missing unevaluatedProperties in glink-edge.
>> Changes since V8:
>> 	-- Add glink-edge reference.
>> 	-- Remove redundant glinke-edge properties.
> 
> 
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 

Actually not... you still do not Cc all necessary maintainers. I don't
understand why.

Please use scripts/get_maintainers.pl to get a list of necessary people
and lists to CC.  It might happen, that command when run on an older
kernel, gives you outdated entries.  Therefore please be sure you base
your patches on recent Linux kernel.

Best regards,
Krzysztof

