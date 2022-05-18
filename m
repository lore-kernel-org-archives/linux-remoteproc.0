Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8BCACC433EF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 May 2022 00:50:08 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232473AbiERAuH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 17 May 2022 20:50:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:46382 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230250AbiERAuH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 17 May 2022 20:50:07 -0400
Received: from mail-oi1-f179.google.com (mail-oi1-f179.google.com [209.85.167.179])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 626D44F456;
        Tue, 17 May 2022 17:50:06 -0700 (PDT)
Received: by mail-oi1-f179.google.com with SMTP id m25so944116oih.2;
        Tue, 17 May 2022 17:50:06 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=aA6CkZSyiriRJ9oI3qLF1KjC1clMuC9PSkXcV802jfA=;
        b=RQemPyxWFtpqUOtUKPg3VYARaOfAGbmL0ZPsPL4X3lJ/BhYzSJMX9nGCZV2d9Qe5cI
         KIyMkQs506mpHPo+RpubChg6s4wiS13hkb6IRYNAHPNTYOQyEU5kIwR67XIPwwo2nFYo
         6qbgvycqsCXhzGjlrSOuCJnGv/WwY/vhwTqzUGrQjWGLf1Yo4rjKwz3qwT5ofd5v4dya
         w/EJ1ryu1dcG14RKJJG7imDvjNpbpsIBqHlS+DjgKoQp1Pml5PHw1FN0ZxAoCZgOgZCE
         vOOqDDn0NLvzY3s+b3TXHoFLFzXb4RCt5QarWq2dJnRnnVgJKChb3dVrfMW0tKAafelg
         saGg==
X-Gm-Message-State: AOAM531ICf8rSlCMLyfQLC6BJJfzZbFjrFwPYXf07qYpbTPU0tTX+jkv
        4H0rPCZFLO11Z0kWkDrxxw==
X-Google-Smtp-Source: ABdhPJxCd9vvtzh/Rbc34Pr9lXceRfxgcba8nKq1efMAgAO3tcpIerTZLnLoIgVWg/3OueeJmCs4xQ==
X-Received: by 2002:a05:6808:56b:b0:325:9f5e:3fd4 with SMTP id j11-20020a056808056b00b003259f5e3fd4mr17977143oig.199.1652835005663;
        Tue, 17 May 2022 17:50:05 -0700 (PDT)
Received: from robh.at.kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id k24-20020a9d7618000000b0060603221274sm313160otl.68.2022.05.17.17.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 17 May 2022 17:50:04 -0700 (PDT)
Received: (nullmailer pid 1970381 invoked by uid 1000);
        Wed, 18 May 2022 00:50:02 -0000
Date:   Tue, 17 May 2022 19:50:02 -0500
From:   Rob Herring <robh@kernel.org>
To:     Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Cc:     Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-arm-msm@vger.kernel.org,
        Krzysztof Kozlowski <krzk+dt@kernel.org>,
        Rob Herring <robh+dt@kernel.org>
Subject: Re: [PATCH 1/4] dt-bindings: remoteproc: qcom: Add SDM660 modem PAS
 compatible
Message-ID: <20220518005002.GA1970329-robh@kernel.org>
References: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
 <20220514000108.3070363-2-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220514000108.3070363-2-dmitry.baryshkov@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Sat, 14 May 2022 03:01:05 +0300, Dmitry Baryshkov wrote:
> Describe required properties of the SDM660 MSS PIL device.
> 
> Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,q6v5.txt | 4 ++++
>  1 file changed, 4 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
