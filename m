Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C55C7C433F5
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 May 2022 00:57:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233013AbiERA5d (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 20:57:33 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38914 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233019AbiERA5b (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 20:57:31 -0400
Received: from mail-oa1-f49.google.com (mail-oa1-f49.google.com [209.85.160.49])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2B2C53E31;
        Tue, 17 May 2022 17:57:29 -0700 (PDT)
Received: by mail-oa1-f49.google.com with SMTP id 586e51a60fabf-edf9ddb312so784395fac.8;
        Tue, 17 May 2022 17:57:29 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=2bFAZ7WeAVsV75lmzic8Z38h4I71mDdxDriCeV3TS5E=;
        b=XxHNOBggalffioiwP0fY4T123e3PjdezdwhzvuG0n0nu+Oejbw+Dhrypr5tw1SI/PN
         IFl/DU0OGaH24ezKA2YjutQCRgS+DqHpiDqlvW+YWUkGJnb9smn5w9py8ePBZJKoIRHo
         Ppx85suYKbSiSeyZ2BlQ885g+D+rKa15rHv2ErGrxOnRIqcOc4FURo/bw2MOmYDBKBTx
         mZtbHVR08O0SA3aoOhs9uiRqJd9FqK4zrEqMwcQUfnlehcOzw9QCqSH1krPzfUnovmn0
         I+Xn8OopA61AIXjiK6WAVkAKgJ9G0F97O4MPfVshfiryV4SiGTLMX3lhzVANe3AP06uO
         TOnQ==
X-Gm-Message-State: AOAM531aJYRSPdaCCS4MoDT6pHYcNjOIIjHNgzNOUQQu/tVostUB328m
        W98bKida6d34TdosIWeZaXhhZaEaLQ==
X-Google-Smtp-Source: ABdhPJyCSTDfkbJOEOVUWcbUmbMgnBbg/tOuLVgyMcTxNLKDX92F0mG2YtszHVWjVYY5TTbpHOhBDw==
X-Received: by 2002:a05:6870:73d0:b0:f1:a304:3dc7 with SMTP id a16-20020a05687073d000b000f1a3043dc7mr7026066oan.195.1652835449330;
        Tue, 17 May 2022 17:57:29 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id t15-20020a0568301e2f00b0060613c844adsm345437otr.10.2022.05.17.17.57.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 17:57:28 -0700 (PDT)
Received: (nullmailer pid 1981634 invoked by uid 1000);
        Wed, 18 May 2022 00:57:27 -0000
Date:   Tue, 17 May 2022 19:57:27 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Manivannan Sadhasivam <mani@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH v2 03/12] dt-bindings: remoteproc: qcom,adsp: add
 interconnects
Message-ID: <20220518005727.GA1981599-robh@kernel.org>
References: <20220517070113.18023-1-krzysztof.kozlowski@linaro.org>
 <20220517070113.18023-4-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220517070113.18023-4-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 17 May 2022 09:01:04 +0200, Krzysztof Kozlowski wrote:
> SM8350 ADSP Peripheral Image Loader already defines interconnects, so
> document the property:
> 
>   sm8350-hdk.dtb: remoteproc@4080000: 'interconnects' does not match any of the regexes: 'pinctrl-[0-9]+'
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 3 +++
>  1 file changed, 3 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
