Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51195EB8FB6
	for <linux-remoteproc@archiver.kernel.org>; Wed,  6 Sep 2023 11:59:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S240365AbjIFL7T (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 6 Sep 2023 07:59:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48992 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233389AbjIFL7K (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 6 Sep 2023 07:59:10 -0400
Received: from mail-ed1-x535.google.com (mail-ed1-x535.google.com [IPv6:2a00:1450:4864:20::535])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 84262CFD
        for <linux-remoteproc@vger.kernel.org>; Wed,  6 Sep 2023 04:59:06 -0700 (PDT)
Received: by mail-ed1-x535.google.com with SMTP id 4fb4d7f45d1cf-522dd6b6438so4808492a12.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 06 Sep 2023 04:59:06 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1694001545; x=1694606345; darn=vger.kernel.org;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=0eY60L1vqLhFNroIzfX3ZIdyRPyMgbcLJxNulph+C5w=;
        b=fKGWI9W7wR8TmAcC645SaibNfSyqdUgmlqU4euQ81IsKDcrWCDl2qjx1XsRxDHRZl0
         ZAUiUb6jxFuZCjBKCqM//9iBMqfEWifFG4X+hCHouAYpJaMuiNQ9Q8lNl4Os9xZc5wov
         axw5qbpfV/cBJaTASEqeZS0o1cUMqa2Nsmu3FuVmXX7rKV872JqkmbLGf75XfOi5Jk0Q
         2dI9G04cha8bcREqaD8HX8k8l8u9rK+0lTfSbr+YlzdZroc3Zgt460aD+KAk67krOpXV
         XdbQqQWfxBve+quffrB8AOqjS1Q0jHgyqh84oTomHeWXdTrj7sZ/64OVl2yBoTR66HgE
         jmOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1694001545; x=1694606345;
        h=content-transfer-encoding:in-reply-to:autocrypt:from:references:cc
         :to:content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=0eY60L1vqLhFNroIzfX3ZIdyRPyMgbcLJxNulph+C5w=;
        b=AZ0X/ECADtnz+06TmCIHy6h/HiUAMVskzdRydD/i55FbrbcaZr2I/HFQQyYEwP2jb4
         S3hv9/phb0HYwJ518UQDzxNol8MMrv+CQHqrw6OKt3xV+yZxIqGaWG0KPIJvm7pIQQJe
         Pmd0MFJvJ0axmfmhbtpP3Dh8Wd147uwkn+7lLFAYWquzoJdYlr2oHHr8RZMjdjky+EWp
         KXmO0UMGJHjVfCScpCEaKz+xGKesQWuydDouRuOlkLXpDbcebA9jq+miuf8Vprq2vxXs
         lCXZ1Lg5Ce/iFF1d77FhY5oGobGKKtMiacqLMU8UydSDaNGkEuZ/JVlMGUAiLiAo4dbW
         fd7w==
X-Gm-Message-State: AOJu0Yz0SUzuqTUNYNinev7LOY749HWYctT/Sa1rb7PtQsweqwPD1Lev
        yDw15sFBsU27dY04mhjjlV8ALg==
X-Google-Smtp-Source: AGHT+IF9sAT+cjxkgPNsf+QIwIxOAoiZdeDBevNhm3tks4xh9tnp+4JXd0PrPwEP3hqmdZltjlbETg==
X-Received: by 2002:aa7:dace:0:b0:523:40d0:34d1 with SMTP id x14-20020aa7dace000000b0052340d034d1mr2179204eds.4.1694001545044;
        Wed, 06 Sep 2023 04:59:05 -0700 (PDT)
Received: from [192.168.37.154] (178235177204.dynamic-4-waw-k-1-1-0.vectranet.pl. [178.235.177.204])
        by smtp.gmail.com with ESMTPSA id a9-20020aa7d749000000b005257da6be23sm8448955eds.75.2023.09.06.04.59.03
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 06 Sep 2023 04:59:04 -0700 (PDT)
Message-ID: <168d4136-7382-481a-9c4d-f43b1f95f987@linaro.org>
Date:   Wed, 6 Sep 2023 13:59:02 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/4] arm64: dts: qcom: sc7180: Add ADSP
Content-Language: en-US
To:     Nikita Travkin <nikita@trvn.ru>, Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        cros-qcom-dts-watchers@chromium.org
Cc:     David Wronek <davidwronek@gmail.com>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht
References: <20230905-sc7180-adsp-rproc-v2-0-8ab7f299600a@trvn.ru>
 <20230905-sc7180-adsp-rproc-v2-4-8ab7f299600a@trvn.ru>
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
Autocrypt: addr=konrad.dybcio@linaro.org; keydata=
 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
 izWDgYvmBE8=
In-Reply-To: <20230905-sc7180-adsp-rproc-v2-4-8ab7f299600a@trvn.ru>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 5.09.2023 12:41, Nikita Travkin wrote:
> sc7180 has an ADSP remoteproc that exclusively controls the audio
> hardware on devices that use Qualcomm firmware.
> 
> Add it along with the relevant audio services.
> 
> Signed-off-by: Nikita Travkin <nikita@trvn.ru>
> ---
> v2: rename service nodes according to the schema, reorder properties
> ---
remoteproc@62400000: glink-edge:apr: 'qcom,domain' is a required property
remoteproc@62400000: glink-edge: Unevaluated properties are not allowed
('apr' was unexpected)
remoteproc@62400000: Unevaluated properties are not allowed ('glink-edge',
'qcom,smem-state-names', 'qcom,smem-states' were unexpected)
apr: 'qcom,domain' is a required property
service@4: Unevaluated properties are not allowed ('cc' was unexpected)

you need to enable the node to get all the warnings

Konrad
