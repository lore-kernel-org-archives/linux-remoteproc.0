Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9DB63C4332F
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 May 2022 14:34:44 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1355252AbiEUOen (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 21 May 2022 10:34:43 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:60482 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1352122AbiEUOel (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 21 May 2022 10:34:41 -0400
Received: from mail-lj1-x236.google.com (mail-lj1-x236.google.com [IPv6:2a00:1450:4864:20::236])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id DB37D5FF1D
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 May 2022 07:34:38 -0700 (PDT)
Received: by mail-lj1-x236.google.com with SMTP id s5so12414700ljd.10
        for <linux-remoteproc@vger.kernel.org>; Sat, 21 May 2022 07:34:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=f7yVVGhzAgX1cWIFxsEPVC/NZ8WTsH47DeAlTWO+NH8=;
        b=pJnyO8fTiM1uh0/+6gzuwB8Lm+k+0s1DoxJ6NEYcYRMFeboq5U/TWwx9VqivjeU93w
         /49LkANyMd25AZmGp/ZFp7GRJSWFHU1ybhUwEKC/+AlLRH9ltufi3Glt6G/N6qGpn6eG
         sEE+2uLsmuqsRq6RiNqG84mNDg1flMoCXA77FeO9Hsj1M+/X1FuKKQwu3QP/Y3VHsH+M
         0zsd5/QGQcXVDkobMRuizgY4+9tjiorHmXXNZU4ASS1/dH4gk2IkxtjlbjSWY0S56ylc
         dcNPyHOfHMXIXkY2qyNPTRIVbF8RQtKgok9DctF+IPmMIytqHc/xvg/voXj31KTU3qcR
         9UMg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=f7yVVGhzAgX1cWIFxsEPVC/NZ8WTsH47DeAlTWO+NH8=;
        b=pRJVrZ1n0Ti7itUxzlHKbJ2SKiXkHIXgoDNkjzF/wKS5O7Lim8Xo53Dcev/1TBwmf2
         RxMjnQkMoLDQDcUHA+PK7yKg/9HuIcO4eSKw6nm0IYW2Tyjn/dpP8FiRHpb7cSinUGce
         HPh+nKRWmE3iHvspayx20voJUqyKMru2CxjoThM2C2V19bkDBmvLeTJ0Hn9riQ5iYbdT
         4bY+ol1uw/8tRc8F9dlfUsGyrZ6HP3QUMjJ2RbQwyYKnnX6Ab7YkKXl9qldtbkM25Nfw
         DmQjyRFzO9bnwVx8dYXcUMp74hc6r8l2QqG7urBEVbVGnJdYNIts4yCodj89Oy5TbuTh
         G0zQ==
X-Gm-Message-State: AOAM530ilA/1JTzxSRmRoYD9UU+ZkjB3VNHiwPG/MgFxBfCEzNl4l7Ha
        zU4xbbqyjrBKniQjqxtZNTC8RA==
X-Google-Smtp-Source: ABdhPJzOQn60TUnZO4u+U3g2asg2RR3pDQG64PXg2esjG8zR00whkH3p3r3N0KD3a24ADNBiu+O2Jg==
X-Received: by 2002:a2e:8049:0:b0:253:e065:3720 with SMTP id p9-20020a2e8049000000b00253e0653720mr3148047ljg.123.1653143677270;
        Sat, 21 May 2022 07:34:37 -0700 (PDT)
Received: from [192.168.0.17] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id z14-20020ac24f8e000000b0044a1527df04sm1081289lfs.3.2022.05.21.07.34.36
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sat, 21 May 2022 07:34:36 -0700 (PDT)
Message-ID: <371ce290-1deb-bff2-112b-71be8c005b37@linaro.org>
Date:   Sat, 21 May 2022 16:34:35 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [PATCH v4 3/3] dt-bindings: remoteproc: qcom: Convert SC7180 MSS
 bindings to YAML
Content-Language: en-US
To:     Rob Herring <robh@kernel.org>, Sibi Sankar <quic_sibis@quicinc.com>
Cc:     bjorn.andersson@linaro.org, krzysztof.kozlowski+dt@linaro.org,
        ohad@wizery.com, agross@kernel.org, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        swboyd@chromium.org, mka@chromium.org
References: <1652978825-5304-1-git-send-email-quic_sibis@quicinc.com>
 <1652978825-5304-4-git-send-email-quic_sibis@quicinc.com>
 <20220520224011.GA374485-robh@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220520224011.GA374485-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 21/05/2022 00:40, Rob Herring wrote:
> On Thu, May 19, 2022 at 10:17:05PM +0530, Sibi Sankar wrote:
>> Convert SC7180 MSS PIL loading bindings to YAML.
> 
> I suppose there is a reason the sc7180 is being split out and the only 
> one converted, but this doesn't tell me.

I am also confused, especially that last time I pointed out that there
is work already:
https://lore.kernel.org/all/20220511161602.117772-7-sireeshkodali1@gmail.com/


Best regards,
Krzysztof
