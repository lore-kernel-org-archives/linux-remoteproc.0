Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8600FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Thu, 26 May 2022 19:40:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348796AbiEZTkp (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 26 May 2022 15:40:45 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36706 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1348787AbiEZTko (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 26 May 2022 15:40:44 -0400
Received: from mail-ej1-x62c.google.com (mail-ej1-x62c.google.com [IPv6:2a00:1450:4864:20::62c])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D6E0F5C856
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 12:40:42 -0700 (PDT)
Received: by mail-ej1-x62c.google.com with SMTP id f21so4787437ejh.11
        for <linux-remoteproc@vger.kernel.org>; Thu, 26 May 2022 12:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=message-id:date:mime-version:user-agent:subject:content-language:to
         :cc:references:from:in-reply-to:content-transfer-encoding;
        bh=7ygqT9lGigZJ/CYDT7+D7nz3BZboq9zllaPVSGj/rjk=;
        b=kr28vZGN05blbS66YlpNx2nb3IVkqa31qxAEgv0noWSbShQdN5UUR0xe+oDYnEfX6b
         0z3vZLZXg2bg/sWgVE2Av9TV7LT7w/8P4OMs2fEI9eiTvGBy9MJ9+amKUGFrLvzWv0hT
         YhlXtusfcb+U+TPQ1SvifFdL4o31sCt1Tsj8+86hoSdSUoFBZof0KkbmSqyVTIOMbPKu
         C0rzU7nqA4dyfgZ8UTYRdpXN/FphI+tBRvw/DCSQp2daBE65+eCy9fegsttEK79X7Df7
         jCENFKDrhpY7vZ7c9J46vp/I23uWnrSHGevknJ3glPEMzNtAEWe5xM+FaViy6wUXwl96
         X3Tg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:message-id:date:mime-version:user-agent:subject
         :content-language:to:cc:references:from:in-reply-to
         :content-transfer-encoding;
        bh=7ygqT9lGigZJ/CYDT7+D7nz3BZboq9zllaPVSGj/rjk=;
        b=JANQ9qnxFVO7kWDTCVmPu2rtUNPip/Boj75SFP//AN6Cw6WvxhOfh/ze+aZ0ymTH3O
         AZ+Irkzam17vVDR/MbstgqnJa2lpbo/2uOMan+MR8/2IQYwVkxwkgp/QZ9O1YqIu64xd
         wM/0/0JvfPTlGoVdD5AW8xxYkVoKZkDm8g9U6TbmVL8rYkJ2gr/V05fV5IrFuKCN8X8E
         zhkOKiFFGcK5wFZGijq8ArRsGB/0Awf8mn1CCVQUGKWTTbPIXHmQUnHptkRTwe60ckuD
         6mc0IOIWnEPlgxs5eRCIn9B2pjnSLBeSqEdy6AVOCXwpMzFEpTOEVjzF5egOnhOAR8pS
         ucZA==
X-Gm-Message-State: AOAM533LHZCDlPVhdLAPZJGEfzsoSBVX40vQXGe4lDl4wez8mDDxBwAi
        Ru+cr9PvJMS7bius/JHd5492QUgVq8DBo4mx
X-Google-Smtp-Source: ABdhPJzpn7MDzb5XTatBFzqgrCKJrOtisDCPplYuF02V+m3GksAs5ItkZu1/nhHfsTh6eV4c6Vue2g==
X-Received: by 2002:a17:907:8a25:b0:6fe:ff5b:81f8 with SMTP id sc37-20020a1709078a2500b006feff5b81f8mr14939322ejc.184.1653594041435;
        Thu, 26 May 2022 12:40:41 -0700 (PDT)
Received: from [192.168.0.177] (xdsl-188-155-176-92.adslplus.ch. [188.155.176.92])
        by smtp.gmail.com with ESMTPSA id s20-20020a508d14000000b0042aba7ed532sm1160010eds.41.2022.05.26.12.40.40
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Thu, 26 May 2022 12:40:40 -0700 (PDT)
Message-ID: <66eb1ab4-efa6-8c3f-84c1-ed8bca0a8432@linaro.org>
Date:   Thu, 26 May 2022 21:40:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:91.0) Gecko/20100101
 Thunderbird/91.9.1
Subject: Re: [PATCH v2 2/2] arm64: dts: qcom: msm8916: Fix typo in pronto
 remoteproc node
Content-Language: en-US
To:     Sireesh Kodali <sireeshkodali1@gmail.com>,
        devicetree@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Cc:     bjorn.andersson@linaro.org, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
References: <20220526141740.15834-1-sireeshkodali1@gmail.com>
 <20220526141740.15834-3-sireeshkodali1@gmail.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20220526141740.15834-3-sireeshkodali1@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 26/05/2022 16:17, Sireesh Kodali wrote:
> The smem-state properties for the pronto node were incorrectly labelled,
> reading `qcom,state*` rather than `qcom,smem-state*`. Fix that, allowing
> the stop state to be used.
> 
> Fixes: 88106096cbf8 ("ARM: dts: msm8916: Add and enable wcnss node")
> Signed-off-by: Sireesh Kodali <sireeshkodali1@gmail.com>

Include please acquired tags when sending a new version.
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>


Best regards,
Krzysztof
