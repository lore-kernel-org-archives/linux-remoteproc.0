Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8B46BC83F2C
	for <linux-remoteproc@archiver.kernel.org>; Mon,  4 Sep 2023 16:01:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1352625AbjIDQBa (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 4 Sep 2023 12:01:30 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56878 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1351608AbjIDQB3 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 4 Sep 2023 12:01:29 -0400
Received: from mail-lj1-x22d.google.com (mail-lj1-x22d.google.com [IPv6:2a00:1450:4864:20::22d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0BE8610E4
        for <linux-remoteproc@vger.kernel.org>; Mon,  4 Sep 2023 09:01:24 -0700 (PDT)
Received: by mail-lj1-x22d.google.com with SMTP id 38308e7fff4ca-2bcb0b973a5so24601931fa.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 04 Sep 2023 09:01:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1693843282; x=1694448082; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=BE7ruEbQisbVIpZ3Tjrstbas7Vlwz14k4cqvzo4QtPo=;
        b=k/JvPSxQ/wz1o7MHdfF0pYP71IhpTG1daFSaYtl9B8RsYZpzQeNV+aOjVpx1lFVpUU
         Z2W8qqWSV6ifdY1wYG5knllCW/nyz9+D0XwBv4/DFpzCsYd1wtj9PLr52c/aQjKj8JJY
         +YHu9ybbsZMQCIbn40e9YbFrI+sTecsszQ3mWusjPlPhhzw2Yrn9/dXDZso1XkPoEBki
         LJfWeQ+N4eDApzFyuhQQVnvAXR0CTEskOh6EzE0KWHxFUIKDKBszk0araxrYLMObBWJ0
         FFkCFffduVfWcRTtOGRMKm0D6lU7ov/PaWgupBBgc1H8xwTMHgF5G0HR5+aMEKIj1z3/
         f72Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1693843282; x=1694448082;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=BE7ruEbQisbVIpZ3Tjrstbas7Vlwz14k4cqvzo4QtPo=;
        b=eCURBdnIxABoMANe+3p4pfzoWCVcFJmH2g0xsEcvkTog0KsNsAEn5k3LNlOBRVNPyW
         TMXDxuHzYlYnM6Yzj5dOxo05HDuE7xC++gUVrleAcJxo5KY3s9No9V6R15/N+G6PqEJM
         cj5oUaPgiK171cccZYfZFWw2DVWm8hCXiAPLChPP/mi30Hwqv1xWgDN2ORQ/6hLR0bK4
         Mi5p96wQXqBmJ2K/NrNrL4wdBmpVUiqrV4fJJC1mC4ezN/TnZibEx6xyQRXNlF3nXRgQ
         WY7EpujgYpnzHLXsY8n8yjEwYOnE2bd/aTtf/eUWllre0DQeVwKPjzg6veeNb6KW24cL
         sYRg==
X-Gm-Message-State: AOJu0YwghypBUdAkWfboCkPJdqQSdyD8jdYKi85Q8aDtZ8cLhClZspIC
        zzGLmLZetfRxIKGqwHdGSlukcQ==
X-Google-Smtp-Source: AGHT+IE24mDuaUVdNX2Ky8oOulCwlOFs17sQ6fGoQEqHUjkDw5SUsY8367+xnMfKhrfSc9aRznQoeA==
X-Received: by 2002:a2e:9c4a:0:b0:2bd:1d02:5026 with SMTP id t10-20020a2e9c4a000000b002bd1d025026mr6667009ljj.15.1693843282236;
        Mon, 04 Sep 2023 09:01:22 -0700 (PDT)
Received: from [192.168.1.101] (abxj43.neoplus.adsl.tpnet.pl. [83.9.3.43])
        by smtp.gmail.com with ESMTPSA id a16-20020a2e9810000000b002bb99f6f2c7sm2223735ljj.90.2023.09.04.09.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 04 Sep 2023 09:01:21 -0700 (PDT)
Message-ID: <880706cd-0987-47c7-8785-f8e4cb1c1907@linaro.org>
Date:   Mon, 4 Sep 2023 18:01:20 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] hwspinlock: qcom: Drop unused qcom,ipq6018-tcsr-mutex
Content-Language: en-US
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Vignesh Viswanathan <quic_viswanat@quicinc.com>,
        agross@kernel.org, andersson@kernel.org, robh+dt@kernel.org,
        krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, ohad@wizery.com,
        baolin.wang@linux.alibaba.com, linux-remoteproc@vger.kernel.org
Cc:     quic_kathirav@quicinc.com, quic_anusha@quicinc.com,
        quic_sjaganat@quicinc.com, quic_srichara@quicinc.com,
        quic_varada@quicinc.com
References: <20230904055010.4118982-1-quic_viswanat@quicinc.com>
 <20230904055010.4118982-3-quic_viswanat@quicinc.com>
 <17c8ba39-2bcf-5799-13ff-bb96249dbf61@linaro.org>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <17c8ba39-2bcf-5799-13ff-bb96249dbf61@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 4.09.2023 08:42, Krzysztof Kozlowski wrote:
> On 04/09/2023 07:50, Vignesh Viswanathan wrote:
>> qcom,ipq6018-tcsr-mutex maps to incorrect config of IPQ6018 and is
>> dropped from the devictree. 
> 
> No, it is not dropped.
> 
> 
>> IPQ6018 will use qcom,tcsr-mutex compatible
>> string.
> 
> No, it will not.
> 
>>
>> Drop qcom,ipq6018-tcsr-mutex compatible string from
>> qcom_hwspinlock_of_match table.
> 
> Why? Do not write what you are doing here, but why you are doing it.
More importantly, looks like the ipq6018 compatible was added after
support for this SoC was introduced (see f5e303aefc06 and 5bf635621245a),
so if it's going to use of_tcsr_mutex data with the fallback compat, the
SoC-specific compatible can be removed from the driver.

Konrad
