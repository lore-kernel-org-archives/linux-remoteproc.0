Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6F49CC07E9B
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 23:10:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 518F561106
	for <linux-remoteproc@archiver.kernel.org>; Tue, 20 Jul 2021 23:10:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231960AbhGTW3e (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 20 Jul 2021 18:29:34 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231678AbhGTW3c (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 20 Jul 2021 18:29:32 -0400
Received: from mail-pf1-x433.google.com (mail-pf1-x433.google.com [IPv6:2607:f8b0:4864:20::433])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B968CC061766
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 16:10:09 -0700 (PDT)
Received: by mail-pf1-x433.google.com with SMTP id a127so775790pfa.10
        for <linux-remoteproc@vger.kernel.org>; Tue, 20 Jul 2021 16:10:09 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=HmZtI1xpEI+ek1YEEmTrQH173EtPkZuQKAG16jfYelI=;
        b=WWsHNFpumMchKKqPUZYeL3Q0MRwuhZGf1N5qizIbIoaqwSqsI0GRnaLgjtlY1VxNid
         JskTU9X0Ts4uhfdYP1vrKcn9yRMbvUZXKCpzJ9wL+wUzJntjupv2qYxPwjCUS1MD9U5o
         XjkDCRYBRTor9KRM7GkV/2bKjF3vPkwL8/YnI=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=HmZtI1xpEI+ek1YEEmTrQH173EtPkZuQKAG16jfYelI=;
        b=qaRe3FyxKZy6/03IyZUIMco6SdcgT8HoWeQQaxHFIkQ5Ay/f/45KTe71ibCjoymqQa
         q7jG2iSLsmRzYAEQNPk49A5Z9UnOaEI/yexP5YuLZq0cNCTv3HnINuVMwsn3MbxJJ8UG
         ElXkrz/s8rWTJrBgoHIgvkIncISR6Ejnwqws4kyvom1eV5+sWrmiQkSYOEBtCfCaFroD
         HEztqHPoZD66yT1lDb2/AeSetJ1BGANLCjv39pz5pTEKEDtX3hIi80S2MtiHZoAX8xwC
         qzofiA0kJX0LjHTQIe3bMWWATAB34VqnLcQ+Pii8f199UrHfdd9Kc5Tbl/Z21SiNwDVE
         zsJA==
X-Gm-Message-State: AOAM531Z6QNTSHKwDvwApYJyE7Y4kVr5NwCcygWJlw9gaY5hb/HimLbO
        8pcnfALGAXgzGNwcPsS1xCWx0w==
X-Google-Smtp-Source: ABdhPJxXibVoBqbItv1ED8m4kpKScTx/Sran0ivRFpDT+e0xLPrsaQZe1F9x4oWRAU2XI0LZzmyyUg==
X-Received: by 2002:a63:1f0e:: with SMTP id f14mr28618978pgf.65.1626822609238;
        Tue, 20 Jul 2021 16:10:09 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:c9c3:db46:7281:8e32])
        by smtp.gmail.com with UTF8SMTPSA id u24sm26397365pfm.141.2021.07.20.16.10.08
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Tue, 20 Jul 2021 16:10:08 -0700 (PDT)
Date:   Tue, 20 Jul 2021 16:10:07 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     swboyd@chromium.org, bjorn.andersson@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, mathieu.poirier@linaro.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        dianders@chromium.org, rishabhb@codeaurora.org,
        sidgup@codeaurora.org
Subject: Re: [PATCH v4 02/13] dt-bindings: remoteproc: qcom: pas: Add QMP
 property
Message-ID: <YPdXz1T89GcIYmJO@google.com>
References: <1626755807-11865-1-git-send-email-sibis@codeaurora.org>
 <1626755807-11865-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1626755807-11865-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, Jul 20, 2021 at 10:06:36AM +0530, Sibi Sankar wrote:
> The load state power-domain, used by the co-processors to notify the
> Always on Subsystem (AOSS) that a particular co-processor is up/down,
> suffers from the side-effect of changing states during suspend/resume.
> However the co-processors enter low-power modes independent to that of
> the application processor and their states are expected to remain
> unaltered across system suspend/resume cycles. To achieve this behavior
> let's drop the load state power-domain and replace them with the qmp
> property for all SoCs supporting low power mode signalling.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> v4:
>  * Commit message change and sc8180x co-processor addition. [Rob/Bjorn]
> 
>  .../devicetree/bindings/remoteproc/qcom,adsp.yaml  | 65 +++++++++++-----------
>  1 file changed, 33 insertions(+), 32 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> index c597ccced623..1182afb5f593 100644
> --- a/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml
> @@ -78,11 +78,11 @@ properties:
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

It seems maxItems should have been 4 in the first place and should remain
unchanged after removing the load state power domain. With this patch:

  - if:
      properties:
        compatible:
          contains:
            enum:
              - qcom,sc7180-mpss-pas
    then:
      properties:
        power-domains:
          items:
            - description: CX power domain
            - description: MX power domain
            - description: MSS power domain
        power-domain-names:
          items:
            - const: cx
            - const: mx
            - const: mss

