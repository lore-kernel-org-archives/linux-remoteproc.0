Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 02D00C6FA8A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 13 Sep 2022 12:50:57 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232172AbiIMMu4 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Sep 2022 08:50:56 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:37302 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232091AbiIMMuy (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Sep 2022 08:50:54 -0400
Received: from mail-ot1-f48.google.com (mail-ot1-f48.google.com [209.85.210.48])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id AF9053340E;
        Tue, 13 Sep 2022 05:50:49 -0700 (PDT)
Received: by mail-ot1-f48.google.com with SMTP id q39-20020a056830442700b0063889adc0ddso8016137otv.1;
        Tue, 13 Sep 2022 05:50:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=TDGyBDyfPixIxYDzqewpX7frNfmhICDZr1OjYSFlvRw=;
        b=kadXAPz2cvlNXOSvLjlQAryUQyJo9toO7JU68s+k4NdN7+ckh0Y8lUtBRx1DGQvte7
         SJ/P4dyp9aZC8bCVsvtsJtAkKInq+94jdAlE6usFJUiu4HyglECjiA4FJLPAJ0uM1+8X
         59GAghD17vtxfVa+1T7G+KeDZ8TpHMJlvGWqyn9sh0JkmThT9cNcn1AupVlj0XZd75RY
         3Kpq5jw+79KeVAlFwcC9b37zrdkba2hZj0ZJA5WlaFe3x6y5RCXC+z0a4t+k/E25mId0
         nIo+SlcauNxmZK0RWV0LiNaOTinvebnBgAUADuovHOvtVoH7psl5o4WjV3Ej42JHioO9
         sWSQ==
X-Gm-Message-State: ACgBeo2WDb3pZvlQbRgvLIt2OzEHpnnkdzMHS9SdtgIIgnKxL/9PNQNf
        5YY2AMTCvv/kJ0apX0NS+AkuB/4ayg==
X-Google-Smtp-Source: AA6agR4tpDBuRtktxo52HcX0/YbGz9RPUouON9adgaM+A9gqO1/4lf7jy8u0QSurJrsG5OVjKB/tuQ==
X-Received: by 2002:a9d:189:0:b0:655:d9e9:cd38 with SMTP id e9-20020a9d0189000000b00655d9e9cd38mr4432623ote.258.1663073448637;
        Tue, 13 Sep 2022 05:50:48 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id f5-20020a9d5e85000000b00636fd78dd57sm6008685otl.41.2022.09.13.05.50.47
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 13 Sep 2022 05:50:48 -0700 (PDT)
Received: (nullmailer pid 3471465 invoked by uid 1000);
        Tue, 13 Sep 2022 12:50:47 -0000
Date:   Tue, 13 Sep 2022 07:50:47 -0500
From:   Rob Herring <robh@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Baolin Wang <baolin.wang@linux.alibaba.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Vinod Koul <vkoul@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v3 01/15] dt-bindings: hwlock: qcom-hwspinlock: add
 support for MMIO on older SoCs
Message-ID: <20220913125047.GA3471414-robh@kernel.org>
References: <20220909092035.223915-1-krzysztof.kozlowski@linaro.org>
 <20220909092035.223915-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220909092035.223915-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 09 Sep 2022 11:20:21 +0200, Krzysztof Kozlowski wrote:
> Older Qualcomm SoCs have TCSR mutex registers with 0x80 stride, instead
> of 0x1000.  Add dedicated compatibles for such case.  Unfortunately the
> binding started using a generic "qcom,tcsr-mutex" compatible without
> specifying the SoC part, thus it looks now quite inconsistent.
> 
> Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> 
> ---
> 
> If anyone ever says "I want a generic compatible because I am sure all
> devices are compatible", that's one more argument they are wrong. :)
> ---
>  .../bindings/hwlock/qcom-hwspinlock.yaml          | 15 ++++++++++++---
>  1 file changed, 12 insertions(+), 3 deletions(-)
> 

Acked-by: Rob Herring <robh@kernel.org>
