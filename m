Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A4AE6C76196
	for <linux-remoteproc@archiver.kernel.org>; Fri, 31 Mar 2023 09:00:38 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231644AbjCaJAe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 31 Mar 2023 05:00:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:43436 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231637AbjCaJAb (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 31 Mar 2023 05:00:31 -0400
Received: from mail-lj1-x22a.google.com (mail-lj1-x22a.google.com [IPv6:2a00:1450:4864:20::22a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id D4A4F1D85E
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Mar 2023 02:00:18 -0700 (PDT)
Received: by mail-lj1-x22a.google.com with SMTP id a44so3656419ljr.10
        for <linux-remoteproc@vger.kernel.org>; Fri, 31 Mar 2023 02:00:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1680253217;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=eM6csNn+4JOHsP4YYv2qF+dsETNKVFGCmM2q/ZRmyE8=;
        b=C3nK8UHipkgFd6cN4iw3Adr6+in4OJyWiwVYcM5OmHoy35FX0c+yjyLwFROZ4LJLqK
         PsAlyyeq+21X7kbs9BKCaAC8/5aZ3Zzuikot12eiS5BZssRZtJHSQW9KrLfpOtSRiH4r
         fdqzJanXNUG11BM76eWlxmptG8iT+JGnfT/SjyDgSVNDh4nrvZbilHS0ZFA3P5ECoeVx
         eJM2ZpLXRBWpaLm/fzI/5VrkcvS+eKDIZ/hga6VJzz0HmF8Ax+J8XyaWeUQLYeO0eJ2L
         8wKYHJGHsYdO0A8Y9xexjgFA/3VPxSDV7mwireKhDQk7obLLT1QoOGO086eNJaKQ+ETN
         t9gg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680253217;
        h=content-transfer-encoding:in-reply-to:from:cc:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=eM6csNn+4JOHsP4YYv2qF+dsETNKVFGCmM2q/ZRmyE8=;
        b=XGNr+sdus7U+3Tkhi3qEBRAzWUnJrcGiwfvC9csuvLXBwYgHSnMURxUXASAQGDHmFh
         exrfbm42m+n9H8zZVybg9vcd1cNY1hhm11yEL7r4HOmPHTa1FAGJRJ/qNmCtHR48Qbdq
         /XppP08L1jXsV42cBElK2aqpC5XqWgFPRcAoFmO+H4FB2q+ai9N6jpBCscAhLfcgm5EY
         73NBnSSFqOCR5sqOgTQxw1VLF4yB58oJQTKUi3Rl3DxuDOKiw+R391YQ9YFI/QoeJS3s
         mRfgpJrPuL1Ahlrvn3k9/RB3yyFQxDS2sU920cQ7Xptlfih5LucO4J7fFfSdY0bisY1I
         ClXg==
X-Gm-Message-State: AAQBX9c0fTutUdJznBtPl65vHz+ILYYoXzGN3kdAw6Jbmp6w6GRIB6R4
        iGYwYtMRV7wnE262tDTbyaoC+g==
X-Google-Smtp-Source: AKy350aE3G12yhJEpeKJTizurZwrwvApD6Ps5meqk91wErA1CUnL129bfxUReiy4J4F/PrI84LhtUg==
X-Received: by 2002:a2e:a3d0:0:b0:2a0:7a74:b0d3 with SMTP id w16-20020a2ea3d0000000b002a07a74b0d3mr7715914lje.19.1680253217125;
        Fri, 31 Mar 2023 02:00:17 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id x10-20020a2e7c0a000000b0029ee7bc0114sm264500ljc.64.2023.03.31.02.00.16
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 31 Mar 2023 02:00:16 -0700 (PDT)
Message-ID: <5fa6d988-b51a-7c18-b605-ab99ecec8bea@linaro.org>
Date:   Fri, 31 Mar 2023 11:00:15 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.9.0
Subject: Re: [PATCH v2] dt-bindings: remoteproc: qcom,adsp: bring back
 firmware-name
Content-Language: en-US
To:     Bjorn Andersson <andersson@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
References: <20230309083548.47205-1-krzysztof.kozlowski@linaro.org>
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Neil Armstrong <neil.armstrong@linaro.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230309083548.47205-1-krzysztof.kozlowski@linaro.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 09/03/2023 09:35, Krzysztof Kozlowski wrote:
> The firmware-name property was moved from common qcom,pas-common.yaml
> binding to each device-specific schema, but the qcom,adsp.yaml was not
> updated.
> 
> Fixes: cee616c68846 ("dt-bindings: remoteproc: qcom: adsp: move memory-region and firmware-name out of pas-common")
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> Changes since v1:
> 1. Use maxItems:1 (Rob)

Bjorn,

Can you pick it up?

Best regards,
Krzysztof

