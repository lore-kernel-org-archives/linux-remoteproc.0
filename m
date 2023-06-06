Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ABA17C77B73
	for <linux-remoteproc@archiver.kernel.org>; Tue,  6 Jun 2023 06:37:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234900AbjFFGh2 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 6 Jun 2023 02:37:28 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44150 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235189AbjFFGhK (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 6 Jun 2023 02:37:10 -0400
Received: from mail-ed1-x530.google.com (mail-ed1-x530.google.com [IPv6:2a00:1450:4864:20::530])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 7D945197
        for <linux-remoteproc@vger.kernel.org>; Mon,  5 Jun 2023 23:37:08 -0700 (PDT)
Received: by mail-ed1-x530.google.com with SMTP id 4fb4d7f45d1cf-5151934a4e3so8260665a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 05 Jun 2023 23:37:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1686033427; x=1688625427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=XYmvqZmczDMcqohyIROSR+qXz+fAe5DrWByhFDu6zgY=;
        b=gGPkenfHeXPnex7XvGJd4CaDJ7VBqTkM0GwgIWaX/mI/U/mFlMZJmesXG98BDU25Rk
         N4kbpG7JNT7JCRZ9X43odDtPRJUlAXK1z3pWZqDOAJUaBJQoZm9tt6NUtoKF1mu3mQri
         s4bYrwraU7cRCyk0QTyv1s0xBlEkjb4v3tKGHkyNG/mP7e/ynKsf38nsb1cMYuAG9dg8
         cz+CvtXSCYZNpAHjK/kpiDYyvBdjL5EsXviNv4r0uYL3Z2ggFCTonwOXWlEUMWuJ31Qt
         FgmI/CfZXDNuUEfvqxd5wwBi+m1ZFDzcW+hd9TSzy6Hb9L8BRMmXZM7OTyxP1qOSY01K
         zbdA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1686033427; x=1688625427;
        h=content-transfer-encoding:in-reply-to:from:references:cc:to
         :content-language:subject:user-agent:mime-version:date:message-id
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=XYmvqZmczDMcqohyIROSR+qXz+fAe5DrWByhFDu6zgY=;
        b=a/IMpzr0JbjaetxG9Ndr9sY7ihrVJd722WIL1bnvFL4cXHRxZsyzhTa8lDpFcrt/Ai
         WYIPsbx38JDwqtqfSVL46HkcFoW8IRdUDxfdGkgdKKm5WHpYvR7LmmKoZGC2gsp6cpV/
         xRHFDQW6bNu0PN1drIm4s0Y+qSMW0uPtZbKe8GcMZRcLXA2dI8vf4XGr3sYILkGPHKT1
         BYmxxh56afM39NV8WCLu8nE4gdXDLh4VzRd1xCk1/+ujLv1amsNlH4yvN3kIgJBWug3o
         bbeaOrW5lwu+FM33CHvDOK0AvcVXFLBUtNS0/jO0Z9j2QI9PButf7+BLGTKXqancnZHh
         NWIw==
X-Gm-Message-State: AC+VfDwYB0yodO+keDeZjuUs3aji8tIrL4a+mol9cnjk+Uo7voHp7O0d
        ayBPLYbDXHTkv13iUC6Kb3QGpw==
X-Google-Smtp-Source: ACHHUZ6V6Bp4WlfRuuGw6YN4xWGpuvxvL6WrZOlb6SjmOwptQP+pyURfL/RuTbj207t56g8ZyGiJEg==
X-Received: by 2002:a17:906:730b:b0:974:6026:a316 with SMTP id di11-20020a170906730b00b009746026a316mr1680755ejc.19.1686033426893;
        Mon, 05 Jun 2023 23:37:06 -0700 (PDT)
Received: from [192.168.1.20] ([178.197.219.26])
        by smtp.gmail.com with ESMTPSA id b25-20020a1709064d5900b009745c628bcdsm5156819ejv.93.2023.06.05.23.37.05
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 05 Jun 2023 23:37:06 -0700 (PDT)
Message-ID: <d0fa3b01-edab-fe8e-c309-036cbbcec7ab@linaro.org>
Date:   Tue, 6 Jun 2023 08:37:04 +0200
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:102.0) Gecko/20100101
 Thunderbird/102.11.2
Subject: Re: [PATCH 06/14] dt-bindings: soc: qcom: smd-rpm: Use qcom,rpm-proc
 in example
Content-Language: en-US
To:     Stephan Gerhold <stephan@gerhold.net>,
        Bjorn Andersson <andersson@kernel.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Conor Dooley <conor+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
References: <20230531-rpm-rproc-v1-0-e0a3b6de1f14@gerhold.net>
 <20230531-rpm-rproc-v1-6-e0a3b6de1f14@gerhold.net>
From:   Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
In-Reply-To: <20230531-rpm-rproc-v1-6-e0a3b6de1f14@gerhold.net>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 05/06/2023 09:08, Stephan Gerhold wrote:
> Use the new top-level rpm-proc node instead of having a dummy top-level
> /smd node that only contains the RPM but not other remote processors.
> 
> Signed-off-by: Stephan Gerhold <stephan@gerhold.net>
> ---
>  Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml | 6 +++---
>  1 file changed, 3 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> index c6930706bfa9..06e574239bd4 100644
> --- a/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> +++ b/Documentation/devicetree/bindings/soc/qcom/qcom,smd-rpm.yaml
> @@ -120,10 +120,10 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>      #include <dt-bindings/interrupt-controller/irq.h>
>  
> -    smd {
> -        compatible = "qcom,smd";
> +    remoteproc-rpm {

remoteproc

> +        compatible = "qcom,msm8916-rpm-proc", "qcom,rpm-proc";
>  
> -        rpm {
> +        smd-edge {

What about binding updates?

Anyway, this should be squashed with previous one.

>              interrupts = <GIC_SPI 168 IRQ_TYPE_EDGE_RISING>;
>              qcom,ipc = <&apcs 8 0>;
>              qcom,smd-edge = <15>;
> 

Best regards,
Krzysztof

