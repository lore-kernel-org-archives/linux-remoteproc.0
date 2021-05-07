Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-14.0 required=3.0 tests=BAYES_00,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6588CC433B4
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 22:19:22 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 43E1A613E3
	for <linux-remoteproc@archiver.kernel.org>; Fri,  7 May 2021 22:19:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229869AbhEGWUV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 7 May 2021 18:20:21 -0400
Received: from mail-oo1-f48.google.com ([209.85.161.48]:41896 "EHLO
        mail-oo1-f48.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229470AbhEGWUV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 7 May 2021 18:20:21 -0400
Received: by mail-oo1-f48.google.com with SMTP id u48-20020a4a97330000b02901fa060b8066so2276731ooi.8;
        Fri, 07 May 2021 15:19:20 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=m+Fa80kPuv08thHywW5q/sPvIDsbmQsI+c8g68W0K4w=;
        b=DrkWbXNsjB1Y4tEonBudKZEhZHmn0uAsxjP/gkWWKW561oinurFGiT4dLLm/hfXqnI
         i6wZt7gMljcXYJgH8wf/DYTF4WsUdIRCLAgfH8leVf9O1JhermXQolurdbFwKEAgOCXX
         5lQFoxgY0AjyAWGyHoCCCVqO3vC2uxKIHfo/OlUk0BbG0GdO7i8nxpXFqh/919nME738
         YP8HsaXWdTIw+J/OLLV0S5mikocEKaOJ02LsVrxrHvuNitXr6Hw5/F+1GOwGlB2udX4k
         lHnB5p6ak3Pfq6I1GVfkM4Y7IuIKaIne81M18Vadr/rY9e8AAbApN1q0jYISEZxOuYIb
         Hzag==
X-Gm-Message-State: AOAM530FrchQ4hoTfKoCsJIGqwoeLsYspFxd7KvEsnXB+CgCjQumsH0G
        TGpT5Fjk0uSUdqgOYuEqzsRmfOxWxQ==
X-Google-Smtp-Source: ABdhPJyAjjAvm3vQ7DRCv2WJcUPznBLSvIKljuefgTKHxfMlOw5LENbClezJhS9JkdtNgwXLZoippg==
X-Received: by 2002:a4a:55c9:: with SMTP id e192mr1475395oob.37.1620425960580;
        Fri, 07 May 2021 15:19:20 -0700 (PDT)
Received: from robh.at.kernel.org (24-155-109-49.dyn.grandenetworks.net. [24.155.109.49])
        by smtp.gmail.com with ESMTPSA id g16sm1317938oof.43.2021.05.07.15.19.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 07 May 2021 15:19:19 -0700 (PDT)
Received: (nullmailer pid 2999929 invoked by uid 1000);
        Fri, 07 May 2021 22:19:18 -0000
Date:   Fri, 7 May 2021 17:19:18 -0500
From:   Rob Herring <robh@kernel.org>
To:     Yassine Oudjana <y.oudjana@protonmail.com>
Cc:     devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org, Rob Herring <robh+dt@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        ~postmarketos/upstreaming@lists.sr.ht,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
        linux-remoteproc@vger.kernel.org, Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>
Subject: Re: [PATCH 2/3] dt-bindings: remoteproc: qcom: pas: Add power
 domains for MSM8996
Message-ID: <20210507221918.GA2999879@robh.at.kernel.org>
References: <lRf8M7F6Qo9s7tlx6vuAWHThg26ls3u6SvQn1PLrAdI@cp4-web-038.plabs.ch>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <lRf8M7F6Qo9s7tlx6vuAWHThg26ls3u6SvQn1PLrAdI@cp4-web-038.plabs.ch>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 06 May 2021 21:18:31 +0000, Yassine Oudjana wrote:
> Add MSM8996 compatible strings to CX and SSC-CX power domains.
> 
> This depends on: "dt-bindings: remoteproc: qcom: pas: Convert binding to YAML"
> https://lore.kernel.org/linux-arm-msm/20210505082200.32635-1-manivannan.sadhasivam@linaro.org/T/#u
> 
> Signed-off-by: Yassine Oudjana <y.oudjana@protonmail.com>
> ---
>  Documentation/devicetree/bindings/remoteproc/qcom,adsp.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 

Acked-by: Rob Herring <robh@kernel.org>
