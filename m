Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9E2EEC32771
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Sep 2022 06:59:23 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232443AbiI1G7W (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Sep 2022 02:59:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46238 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233349AbiI1G7D (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Sep 2022 02:59:03 -0400
Received: from mail-lf1-x12a.google.com (mail-lf1-x12a.google.com [IPv6:2a00:1450:4864:20::12a])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1C7899E125
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Sep 2022 23:58:55 -0700 (PDT)
Received: by mail-lf1-x12a.google.com with SMTP id i26so18957673lfp.11
        for <linux-remoteproc@vger.kernel.org>; Tue, 27 Sep 2022 23:58:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date;
        bh=Qh1HEBzOLKDQSq0ZCiaGc/8pGpWdAfOlGQkcVarHmY8=;
        b=kW9bbA11CiWU1L2dWJmMwja44loWoFbidpsQJ5KAS+WpEfkOZXCxUMegXZsEYoFj9q
         4VBXxNL2nRP46fTS5BDRiLvegZxm7ZZVg6kFZbHGhsQQ/D+Uuc7nCggqJAw7rNV/AMoz
         TSePwOkEupsjhipwKygDqUr7Jar1FE7Wkn5/pf+NL0dxAGr3jNHO5hMspe9+YFJVO5Rt
         LcJXxMsepP7F50m3f2t9NvT+mtiCANcL9D93dYPVcwxZsfFyiKRaKJRe+Yzp8cY0l97R
         Lrx2jCclRRzR5eu00Y0bqg45MkIYrt4wxh8HzbmJXl2ZoCXgfdiDjZszSRqe7yAxgwQr
         loQA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:in-reply-to:from:references:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date;
        bh=Qh1HEBzOLKDQSq0ZCiaGc/8pGpWdAfOlGQkcVarHmY8=;
        b=ZDvEx0z31hg9wIuGgEDRZwgPI3ulA1we9dkBI2XkHOtF4LVAWOMsnyUfyzNQDt3oEw
         JyUNq45qpVsE79cZj3CyxH/Up3HQODlMuzkez+HhbGjI4mvoca44oDja7Cem2jMVg0m/
         6yvpT/VuqftUqJbMwZ3Qu2lW85vpp2bL6F+0MhTIAdSzb3b6UKyDj3tC5/7Za/J42qi4
         LRXgnf1Cwz1R2pio9/jq+6T9K7ESJ/DJHk9/Gt/Urk4/KrehvumcP1qM9aS7LcLBdGyu
         VZOXHPLzrGdGH43ST01cVscQolaREphFubLbdczlhu46tdw4CPgkD/fvkfBFZm0EJLUC
         /F6A==
X-Gm-Message-State: ACrzQf1EW4PHni/gAmzlqlNaAl0PbnH6ufvpl/OhNnnVtapyFcKq+6DW
        SwcVG65zJ8eukH6S01cmc6QY2w==
X-Google-Smtp-Source: AMsMyM6ZOnG6OM/VwMga05nNjO5UO83JomTav5VouqvC5bQK33X7nG932sZ9IrZriMo0gRh2lG+S5w==
X-Received: by 2002:a05:6512:3b91:b0:49f:d530:97 with SMTP id g17-20020a0565123b9100b0049fd5300097mr12283022lfv.172.1664348333477;
        Tue, 27 Sep 2022 23:58:53 -0700 (PDT)
Received: from [192.168.0.21] (78-11-189-27.static.ip.netia.com.pl. [78.11.189.27])
        by smtp.gmail.com with ESMTPSA id h4-20020a056512220400b0048b969ac5cdsm389758lfu.5.2022.09.27.23.58.50
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 27 Sep 2022 23:58:52 -0700 (PDT)
Message-ID: <3e9ca09c-4134-e05c-3a48-3f0467ba7e8a@linaro.org>
Date:   Wed, 28 Sep 2022 08:58:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.3.0
Subject: Re: [PATCH v9 1/7] dt-bindings: remoteproc: qcom: Add SC7280 ADSP
 support
Content-Language: en-US
To:     Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>,
        linux-remoteproc@vger.kernel.org, agross@kernel.org,
        andersson@kernel.org, lgirdwood@gmail.com, broonie@kernel.org,
        robh+dt@kernel.org, quic_plai@quicinc.com, bgoswami@quicinc.com,
        perex@perex.cz, tiwai@suse.com, srinivas.kandagatla@linaro.org,
        quic_rohkumar@quicinc.com, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, swboyd@chromium.org,
        judyhsiao@chromium.org, devicetree@vger.kernel.org
References: <1664287003-31450-1-git-send-email-quic_srivasam@quicinc.com>
 <1664287003-31450-2-git-send-email-quic_srivasam@quicinc.com>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <1664287003-31450-2-git-send-email-quic_srivasam@quicinc.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 27/09/2022 15:56, Srinivasa Rao Mandadapu wrote:
> Add ADSP PIL loading support for SC7280 SoCs.
> 
> Signed-off-by: Srinivasa Rao Mandadapu <quic_srivasam@quicinc.com>
> Reviewed-by: Rob Herring <robh@kernel.org>
> Reviewed-by: Stephen Boyd <swboyd@chromium.org>
> ---

Thank you for your patch. There is something to discuss/improve.

> +  qcom,smem-state-names:
> +    description: The names of the state bits used for SMP2P output
> +    const: stop
> +
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
> +  glink-edge:
> +    $ref: qcom,glink-edge.yaml#
> +    type: object

You still miss here unevaluatedProperties: false on this level of
indentation.

> +    description: |
> +      Qualcomm G-Link subnode which represents communication edge, channels
> +      and devices related to the ADSP.
> +
Best regards,
Krzysztof

