Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CD899C433FE
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 16:10:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233487AbiKPQKD (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 11:10:03 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:48508 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234075AbiKPQJs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 11:09:48 -0500
Received: from mail-ot1-f42.google.com (mail-ot1-f42.google.com [209.85.210.42])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 54E7A56EC7;
        Wed, 16 Nov 2022 08:09:47 -0800 (PST)
Received: by mail-ot1-f42.google.com with SMTP id m7-20020a9d6447000000b0066da0504b5eso4353899otl.13;
        Wed, 16 Nov 2022 08:09:47 -0800 (PST)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/+pQLTJDyany4akW+PaBhrVtLiRkHQTFMc51rgLCGdE=;
        b=NBIMCMOgv9SZu6Ma78SOb4s5P1ECYc3UTIk7gfUiK/oHCbPzaP04cA1eqbd6ExE7Es
         HKgQRDgSPi/3w940lhuzvr6Db/Ni4RioSsCVnAr7o+JXwfRv/ZW7HYcuBmBLm728UgI1
         Hu+Q9lR4S/qW9BcS8PBsDZVE/cbIpFrxB2T0wzZKRH5jh4PnawYfKxwe9NLpAv8x+O81
         OssljI1dIXXLKkYhkZ5hD5Ysrc8M/yv69pr/IWW9kVxcWUFGDFudCbHcF4GIfXerz6eC
         WnpwME7xHIeqIuvsv5d1dadTN+4o573PkNooP/kdBEUJh63TcG7Vzc0iKHzzLSIT+iUL
         Wn+w==
X-Gm-Message-State: ANoB5pk2FllhqsQrWPXEQI2okYEU5WiOc+HvOHHTrgYlD5t4WkDrVCo5
        ugOOZMKzWpWIdfERf8w4zw==
X-Google-Smtp-Source: AA0mqf4OznSLbOeIc6lNTE63nxdYlw3lA+2jVJt8wh+vbSgDsrvWW02+YGXOmIbRh6PjRFSHOst4Bw==
X-Received: by 2002:a9d:480f:0:b0:66c:6cf1:7967 with SMTP id c15-20020a9d480f000000b0066c6cf17967mr11384658otf.139.1668614986560;
        Wed, 16 Nov 2022 08:09:46 -0800 (PST)
Received: from robh_at_kernel.org (66-90-144-107.dyn.grandenetworks.net. [66.90.144.107])
        by smtp.gmail.com with ESMTPSA id v4-20020acade04000000b00359ba124b07sm6165743oig.36.2022.11.16.08.09.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 08:09:46 -0800 (PST)
Received: (nullmailer pid 170698 invoked by uid 1000);
        Wed, 16 Nov 2022 16:09:48 -0000
Date:   Wed, 16 Nov 2022 10:09:48 -0600
From:   Rob Herring <robh@kernel.org>
To:     MD Danish Anwar <danishanwar@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/6] dt-bindings: remoteproc: Add PRU consumer bindings
Message-ID: <20221116160948.GA169555-robh@kernel.org>
References: <20221116121634.2901265-1-danishanwar@ti.com>
 <20221116121634.2901265-2-danishanwar@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116121634.2901265-2-danishanwar@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 16, 2022 at 05:46:29PM +0530, MD Danish Anwar wrote:
> From: Suman Anna <s-anna@ti.com>
> 
> Add DT schema binding for PRU consumers. The binding includes
> all the common properties that can be used by different PRU consumer
> or application nodes and supported by the PRU remoteproc driver.
> These are used to configure the PRU hardware for specific user
> applications.
> 
> The application nodes themselves should define their own bindings.
> 
> Co-developed-by: Tero Kristo <t-kristo@ti.com>
> Co-developed-by: Suman Anna <s-anna@ti.com>
> Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> Co-developed-by: Puranjay Mohan <p-mohan@ti.com>
> Signed-off-by: MD Danish Anwar <danishanwar@ti.com>

Run checkpatch.pl and fix the warnings with the tags.

You didn't add review/ack tags either.

> ---
>  .../bindings/remoteproc/ti,pru-consumer.yaml  | 60 +++++++++++++++++++
>  1 file changed, 60 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
