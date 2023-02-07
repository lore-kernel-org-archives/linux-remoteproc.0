Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3F057C636CC
	for <linux-remoteproc@archiver.kernel.org>; Tue,  7 Feb 2023 10:28:33 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231341AbjBGK2c (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 7 Feb 2023 05:28:32 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53038 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231152AbjBGK2b (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 7 Feb 2023 05:28:31 -0500
Received: from mail-ej1-x62d.google.com (mail-ej1-x62d.google.com [IPv6:2a00:1450:4864:20::62d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07AB424CB8
        for <linux-remoteproc@vger.kernel.org>; Tue,  7 Feb 2023 02:28:29 -0800 (PST)
Received: by mail-ej1-x62d.google.com with SMTP id sa10so11524384ejc.9
        for <linux-remoteproc@vger.kernel.org>; Tue, 07 Feb 2023 02:28:29 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=Ts0acRxUBjbRENNqOH3ml+/mZlOaH3hAaRGG4xxO/dA=;
        b=LUHCt0+T2Hf0ZKwD43H5lkjLO6ulP5eagMt47wgdb69tnWD89AQ/JExXLTGnhvzQ2t
         ue9Jzr2h+XtHybrUklYYZXOZ53YxaIvgACuEvFuXIQZ1GlRIITUK5Sn1+8d/6AyTkz1d
         pW7c2KM1Dvcfx6R443sEW5NP6+7q/1hFp02tRVTTIKWFZSk+0nkGQaaUpiJVuEq2ufxG
         8EvMaE1bvTC0jMA8qSgzFEMgyQH4/1iTMkT7ndg6MDsVs/PY2vjegnUBMXTRk6GeiVvv
         GK8a5m/kYH9ngXdCB5HqR3WvjbGJ9hLfKBhpiOAIxNkbBbqLmmwheUPI+6JePtroVSa3
         B9FQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=Ts0acRxUBjbRENNqOH3ml+/mZlOaH3hAaRGG4xxO/dA=;
        b=rEVCg7KXY9pe80+ZmxrjqGlfXEOq3KX8+lOEVEgyMoqMOYk5M9s/5PBLfCsQxThNHy
         oSDlJ0MyCY2qpRXajBBCRmL1BCZIAf4v8hRR5VUX1pPHSKBhVDWY8EoeEPgHYmIDF2kO
         tVsyk5lBpkSGNoLOtbVtBilyPQj7HTt9MxhOfl296tMTJwq0bXXIX/AGR6e0HB1mpBUL
         Bnlek+dBWufMLvGnTxJ9SiHdIlEDACh7Xwxi5w+130Y6UuaDv2uQpg67uHsLkw8DZo/c
         76+56Elc9lmnH207WCqQB/iZiUDW10eBHjvEWnTOR0J/YQqIqN3G52zIOvXODGzKO1hG
         sx4Q==
X-Gm-Message-State: AO0yUKXOpPVIQra4qnGYfE2ZIlBd8C5Srtm6qjjCVy5ebInCKEOOBAMn
        635TDGAjAEu4XW76w1HGzBYt9Q==
X-Google-Smtp-Source: AK7set9/juo6jZwynfeVJKi6dbEl+eEIfDse1Ww3gi5cTUFdnPobV93AbPuSQ2zBPXVlSBoFdRmWtA==
X-Received: by 2002:a17:906:1d44:b0:889:b6ae:75ff with SMTP id o4-20020a1709061d4400b00889b6ae75ffmr2792898ejh.53.1675765708568;
        Tue, 07 Feb 2023 02:28:28 -0800 (PST)
Received: from ?IPV6:2001:14ba:a085:4d00::8a5? (dzccz6yyyyyyyyyyybcwt-3.rev.dnainternet.fi. [2001:14ba:a085:4d00::8a5])
        by smtp.gmail.com with ESMTPSA id y19-20020a17090668d300b00880d9530761sm6652434ejr.209.2023.02.07.02.28.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 07 Feb 2023 02:28:28 -0800 (PST)
Message-ID: <2649a9f2-236b-7108-8f68-7eeaf7f1a0fa@linaro.org>
Date:   Tue, 7 Feb 2023 12:28:26 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.7.1
Subject: Re: [PATCH 1/5] arm64: dts: qcom: ipq6018: align RPM G-Link node with
 bindings
Content-Language: en-GB
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <andersson@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
In-Reply-To: <20230207090852.28421-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 07/02/2023 11:08, Krzysztof Kozlowski wrote:
> Bindings expect (and most of DTS use) the RPM G-Link node name to be
> "rpm-requests".
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>   arch/arm64/boot/dts/qcom/ipq6018.dtsi | 2 +-
>   1 file changed, 1 insertion(+), 1 deletion(-)

Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>

-- 
With best wishes
Dmitry

