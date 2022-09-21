Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id E8FC4ECAAD8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 21 Sep 2022 19:17:36 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229929AbiIUTRf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 21 Sep 2022 15:17:35 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:57628 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229522AbiIUTRe (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 21 Sep 2022 15:17:34 -0400
Received: from mail-lj1-x230.google.com (mail-lj1-x230.google.com [IPv6:2a00:1450:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 38E6F8A1E7
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:17:33 -0700 (PDT)
Received: by mail-lj1-x230.google.com with SMTP id a14so8214459ljj.8
        for <linux-remoteproc@vger.kernel.org>; Wed, 21 Sep 2022 12:17:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=FFWYf30fxjjXlIOxVdGNR+WbXDYJYmOBDe6NwowrDcw=;
        b=nggP6OM3QKE6RW+j+AFHq3/wAShbkUl0R9xn+imGaZzFd7yKoMYAIqvC0gr6vCDY/m
         PoYI5CY4V4PpLDLBD7PlUdr1HlQ/mxJwPRtSdB2BtBCVgeaL+enLaFBFf43w8XhZIWvh
         iESv1WEvk4cMdyp/q1Oi35yB90zYiqvIWt4eFYGQ8nJ+vEM/K4zoJo+zGoeQ//eo5J6C
         ULC0aLKmorK8ArIYG71AI8SXT+C7ZFI0hCSSOi7NzVK+A/PfkCbfT1P1EciLvUnPhGv+
         +6ocLClqNKXmGocImDYJq1XK/SRHqlDIhQRLBRrlc4YZ+NNdg9pAgiU3NxPT8NO2iTAK
         OJfg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=FFWYf30fxjjXlIOxVdGNR+WbXDYJYmOBDe6NwowrDcw=;
        b=v78ncW5/uywBac8EkfVDQjhF0KdVj4unUAXCJ8oMMhnad/t+LwQE1SurDTU965nBfr
         APBzchEqILxN4wVid4dgo8rQE3mIk//8ie37cQMU7hNUrOMGF7kr6vFr1ksgXH6DrT5R
         PF+LkPrCWKSY1yeq8vUhwmpgwOhwxyB8EPtXWEVZRSWx+HfD+c9S4d1uI3r3O51fezM5
         6+lbuVOEoaJuh12pExxIw/NPAquy3JAyfLnzlXVPh9h5wbUzlIxlDjblt3u3CSFQryqP
         /9w8pSWwRjGYvYrL3SDDtUbX7JtX8X9ok1QftWwyakKqUPRucRmGKA/hlJ/SMXNz6kOl
         fYeg==
X-Gm-Message-State: ACrzQf3dItmj0yZx9ECf+OXSrdIrx9+iBa7+qawbBMonh+PlCin45dHF
        J/EBf+CoPRSbmSyUiYvHbgSLDw==
X-Google-Smtp-Source: AMsMyM5IvOZj2smJRYesMDeMVzK6M8cYzNjZL/HD4dd4Um+JJBWr7edNvCVbQncMORTAMITwyrLtXA==
X-Received: by 2002:a2e:9606:0:b0:26c:442a:40c2 with SMTP id v6-20020a2e9606000000b0026c442a40c2mr7470688ljh.458.1663787851473;
        Wed, 21 Sep 2022 12:17:31 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id r8-20020a2e8e28000000b0026c36023a9asm342207ljk.131.2022.09.21.12.17.30
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 21 Sep 2022 12:17:30 -0700 (PDT)
Message-ID: <223e2055-bc5a-a1ca-46e7-a3f6cbdaa761@linaro.org>
Date:   Wed, 21 Sep 2022 21:17:30 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.2.2
Subject: Re: [PATCH v4 3/4] dt-bindings: remoteproc: qcom: wcnss: Add
 qcom,pronto compatible
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org,
        ~postmarketos/upstreaming@lists.sr.ht, linux-kernel@vger.kernel.org
Cc:     andersson@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
References: <20220921043648.2152725-1-sireeshkodali1@gmail.com>
 <20220921043648.2152725-4-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220921043648.2152725-4-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/09/2022 06:36, Sireesh Kodali wrote:
> This is not a fallback compatible, it must be present in addition to
> "qcom,pronto-v*". It is also not documented in qcom,wcnss-pil.txt.  This
> is the reason for documenting it in a separate commit.
> 
> This compatible is used in the wcn36xx driver to determine which
> register must be accessed. However it isn't immediately clear why the
> wcn36xx driver relies on this extra compatible string rather than just
> looking for "qcom,pronto-v*".


Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>

Best regards,
Krzysztof

