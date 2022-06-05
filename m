Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2401AC43334
	for <linux-remoteproc@archiver.kernel.org>; Sun,  5 Jun 2022 22:49:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1348374AbiFEWtE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 5 Jun 2022 18:49:04 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39050 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S240474AbiFEWtD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sun, 5 Jun 2022 18:49:03 -0400
Received: from mail-qk1-f182.google.com (mail-qk1-f182.google.com [209.85.222.182])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 1FC422FFCE;
        Sun,  5 Jun 2022 15:49:03 -0700 (PDT)
Received: by mail-qk1-f182.google.com with SMTP id n197so2752053qke.1;
        Sun, 05 Jun 2022 15:49:03 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=cFQv2TrAmUdwhDKidl65ILu68jId00HPH3oLSQ72B5o=;
        b=2H1hgGqearhmwqlyKzscm/iTpnjGO9ixXdXzknomE0VpGF9nY3AGhc4Ci7/C6ZQCV9
         KjLB2B0FVx2cmIoTXv2SLYbWax97uo9hgwlSRbZ8zoEaeTF4GUOIWZT+Y0S1+sP2vUkv
         A8yaUWqbRO3JP4rBeD1VPx2Ej8O0mwhaK1X7FZLfl69oKZ/q+0cbGbyc+z2eyxK6S3o5
         RheYqtdyjiR4EGQVXRA7VHRkZ93tE/Qo5HhO93C3iPGdplD80OkYuESR95IytwnGRknD
         O/vlnRtrt894X7c8jvJEEMQakJozOJ4OSQNU7cx8UcN1zWjWDIO7OS2gW1oXVP7RW5Bj
         CFwg==
X-Gm-Message-State: AOAM5320gCSSMXPHYel8WEe/0nB5Q9JI3tW63sm+ITiIHu0A6hrJDUIL
        xb7HfsnReGHseZV2ycWv5A==
X-Google-Smtp-Source: ABdhPJxJPLZPo26sTSCa9JYf+TTBlOyo7cPD042GPk7h8wYbwewlEFr2v0vnS1Xb/N/q+TJ0KnMy4w==
X-Received: by 2002:a05:620a:404d:b0:6a4:f5b0:d8ca with SMTP id i13-20020a05620a404d00b006a4f5b0d8camr13825512qko.506.1654469342227;
        Sun, 05 Jun 2022 15:49:02 -0700 (PDT)
Received: from robh.at.kernel.org ([2607:fb90:1bdb:2e61:f12:452:5315:9c7e])
        by smtp.gmail.com with ESMTPSA id x23-20020ac86b57000000b002f93760e4cfsm8714685qts.26.2022.06.05.15.48.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jun 2022 15:49:01 -0700 (PDT)
Received: (nullmailer pid 3673195 invoked by uid 1000);
        Sun, 05 Jun 2022 22:48:58 -0000
Date:   Sun, 5 Jun 2022 17:48:58 -0500
From:   Rob Herring <robh@kernel.org>
To:     Puranjay Mohan <p-mohan@ti.com>
Cc:     rogerq@kernel.org, krzysztof.kozlowski+dt@linaro.org,
        s-anna@ti.com, kishon@ti.com, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
        nm@ti.com, ssantosh@kernel.org, linux-kernel@vger.kernel.org,
        vigneshr@ti.com, grygorii.strashko@ti.com
Subject: Re: [PATCH v4 1/6] dt-bindings: remoteproc: Add PRU consumer bindings
Message-ID: <20220605224858.GA3673137-robh@kernel.org>
References: <20220603121520.13730-1-p-mohan@ti.com>
 <20220603121520.13730-2-p-mohan@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220603121520.13730-2-p-mohan@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 03 Jun 2022 17:45:15 +0530, Puranjay Mohan wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add a YAML binding document for PRU consumers. The binding includes
> all the common properties that can be used by different PRU consumer
> or application nodes and supported by the PRU remoteproc driver.
> These are used to configure the PRU hardware for specific user
> applications.
> 
> The application nodes themselves should define their own bindings.
> 
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Tero Kristo <t-kristo@ti.com>
> Signed-off-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Signed-off-by: Puranjay Mohan <p-mohan@ti.com>
> ---
> V3->V4:
> * Addressed Rob's comments regarding max and min Items.
> * removed the dependencies tag as it was redundant.
> ---
> .../bindings/remoteproc/ti,pru-consumer.yaml  | 69 +++++++++++++++++++
>  1 file changed, 69 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
> 

Reviewed-by: Rob Herring <robh@kernel.org>
