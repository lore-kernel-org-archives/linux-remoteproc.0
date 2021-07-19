Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B19CFC07E9D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Jul 2021 23:19:39 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 997A2610F7
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Jul 2021 23:19:39 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234816AbhGSWi6 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Jul 2021 18:38:58 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44120 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1385716AbhGSTHx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Jul 2021 15:07:53 -0400
Received: from mail-oo1-xc2e.google.com (mail-oo1-xc2e.google.com [IPv6:2607:f8b0:4864:20::c2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 23D16C0613F0
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Jul 2021 12:37:41 -0700 (PDT)
Received: by mail-oo1-xc2e.google.com with SMTP id 128-20020a4a11860000b029024b19a4d98eso4753295ooc.5
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Jul 2021 12:45:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=mQSEq7q+wxePH17WHb+2Y12YcuWTNetJZSsUU2m7H7E=;
        b=N2B5cVOSFDnDhk7ZJikp57cYFtbff3OoOQABXLEuxfHd9w5r4YaazAcc8eRncMl+i9
         CdTXPuNSjfJ+fAwAqjqmLVQTUKmjxMrLtxadKzernVCPQvvZtMHw+PfN2YcVoFRpOJVn
         DO7kJXAMKW3uaCY8zg26hm+6/JN4SP0jKVMmYMwDnfqyuQw5+bpDBrJjC73C4be2Mazz
         ZrwERWVVJ3yvNk51DT0mBrWPRKdhmtqxpBsxxlEcsISSz7PLLV4MeZgq2wir9Dcz6etg
         xwTHQtPTxQMtjxgV1F5iZMxsUfm1ZThAV94QSeui+YSjZ+jd1hHx9N5U8/JBdGTb6QBW
         jvRw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=mQSEq7q+wxePH17WHb+2Y12YcuWTNetJZSsUU2m7H7E=;
        b=kVDnlEduOVVQtkBo8/Ad8ui5LOKiDM5nxcE4WaabXmPjTreOhfUP/5OsDBeHuKzE06
         LRJCD6W2NKqPnjq+H3SYI+UI5rrsiy4KCOUk5XMo+HdlvzXgVJqQsyIfWb6CRNkWZKL3
         PoYhDcbVh40aqNB0meIBV6C3VtY4He8IXz0vPihB4ks45Iiid0KdpENKfnG8HejSKcm/
         Zer/e2l5Utvp4Qe2MfJJSK/dHtp3JAVzOFfqog+h3KiALUjTxaYOhmyCppt+JC/XA6hs
         yx6D83ysUb2w6vX1GOeYiAqtdYyvLMG+Q/FUN/Xz6DmROUD5hERQW/iBtq4DTpndEK/H
         dczA==
X-Gm-Message-State: AOAM5331PucmImjSbPNlE2GYE0oVLLOlvesX7u8QM4jioj5rmn+O4Ria
        q67UUj0vKawZbiOELi3BUKndnw==
X-Google-Smtp-Source: ABdhPJyEgmEJXTA8pZhCE4A7kaDgxCC+tSYYlL5iU+L2BArlNQdV1CQLgfGgR5PaI1xtBZvOvuEvbQ==
X-Received: by 2002:a4a:e14f:: with SMTP id p15mr1215289oot.42.1626723899832;
        Mon, 19 Jul 2021 12:44:59 -0700 (PDT)
Received: from yoga (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id v5sm1855606oor.33.2021.07.19.12.44.58
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Jul 2021 12:44:59 -0700 (PDT)
Date:   Mon, 19 Jul 2021 14:44:57 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     robh+dt@kernel.org, swboyd@chromium.org, ulf.hansson@linaro.org,
        rjw@rjwysocki.net, agross@kernel.org, ohad@wizery.com,
        mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH v3 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 bindings
Message-ID: <YPXWOeq++TdwH1r4@yoga>
References: <1624560727-6870-1-git-send-email-sibis@codeaurora.org>
 <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1624560727-6870-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu 24 Jun 13:51 CDT 2021, Sibi Sankar wrote:

> Add Qualcomm Mailbox Protocol (QMP) binding to replace the power domains
> exposed by the AOSS QMP node.
> 

I think this would be a good opportunity to describe why you need to
make this change to the binding.

Regards,
Bjorn

> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v3:
>  * Misc. documentation fixes:
>   - Reduce power-domain maxItems due to load_state pd removal
>   - Combine compatibles where possible with the load_state pd removal
>   - Fixup the qcom,qmp ref to phandle type
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 62 +++++++++++-----------
>  1 file changed, 30 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index 9ea05e608bc1..ad85617b43fa 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -75,11 +75,11 @@ properties:
>  
>    power-domains:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 2
>  
>    power-domain-names:
>      minItems: 1
> -    maxItems: 3
> +    maxItems: 2
>  
>    firmware-name:
>      $ref: /schemas/types.yaml#/definitions/string
> @@ -89,6 +89,10 @@ properties:
>      maxItems: 1
>      description: Reference to the reserved-memory for the Hexagon core
>  
> +  qcom,qmp:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Reference to the AOSS side-channel message RAM.
> +
>    qcom,smem-states:
>      $ref: /schemas/types.yaml#/definitions/phandle-array
>      description: States used by the AP to signal the Hexagon core
> @@ -359,13 +363,11 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
>              - description: MX power domain
>              - description: MSS power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: cx
>              - const: mx
>              - const: mss
> @@ -381,43 +383,20 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
> -        power-domain-names:
> -          items:
> -            - const: load_state
> -            - const: cx
>  
>    - if:
>        properties:
>          compatible:
>            contains:
>              enum:
> +              - qcom,sdx55-mpss-pas
>                - qcom,sm8150-mpss-pas
>                - qcom,sm8350-mpss-pas
>      then:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
> -            - description: CX power domain
> -            - description: MSS power domain
> -        power-domain-names:
> -          items:
> -            - const: load_state
> -            - const: cx
> -            - const: mss
> -
> -  - if:
> -      properties:
> -        compatible:
> -          contains:
> -            enum:
> -              - qcom,sdx55-mpss-pas
> -    then:
> -      properties:
> -        power-domains:
> -          items:
>              - description: CX power domain
>              - description: MSS power domain
>          power-domain-names:
> @@ -439,12 +418,10 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: LCX power domain
>              - description: LMX power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: lcx
>              - const: lmx
>  
> @@ -458,12 +435,10 @@ allOf:
>        properties:
>          power-domains:
>            items:
> -            - description: Load State power domain
>              - description: CX power domain
>              - description: MXC power domain
>          power-domain-names:
>            items:
> -            - const: load_state
>              - const: cx
>              - const: mxc
>  
> @@ -499,6 +474,29 @@ allOf:
>              - const: mss_restart
>              - const: pdc_reset
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - qcom,sc7180-mpss-pas
> +              - qcom,sm8150-adsp-pas
> +              - qcom,sm8150-cdsp-pas
> +              - qcom,sm8150-mpss-pas
> +              - qcom,sm8150-slpi-pas
> +              - qcom,sm8250-adsp-pas
> +              - qcom,sm8250-cdsp-pas
> +              - qcom,sm8250-slpi-pas
> +              - qcom,sm8350-adsp-pas
> +              - qcom,sm8350-cdsp-pas
> +              - qcom,sm8350-mpss-pas
> +              - qcom,sm8350-slpi-pas
> +    then:
> +      properties:
> +        qcom,qmp:
> +          items:
> +            - description: Reference to the AOSS side-channel message RAM.
> +
>  examples:
>    - |
>      #include <dt-bindings/clock/qcom,rpmcc.h>
> -- 
> The Qualcomm Innovation Center, Inc. is a member of the Code Aurora Forum,
> a Linux Foundation Collaborative Project
> 
