Return-Path: <SRS0=FKc4=CU=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id CE330C433E2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Sep 2020 22:51:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 82FC9221EB
	for <linux-remoteproc@archiver.kernel.org>; Fri, 11 Sep 2020 22:51:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1599864688;
	bh=Cxyu0WhDHn99wkC5XEdGFHZx5KysGFOVjomTENz2bk4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:List-ID:From;
	b=Xtf/lnHLpt9uwSCxljQFlfo+f8c1zQbRFkxD6j490paRZz8KSxkSVAfBfpZoaWXaw
	 A2rF18nEajjIvXtRlFlYTwZDTN0Nyx9EBk1rPcS66tNfrEXgv9wVi/jwEzRWDHGx/X
	 JE8RiXXuTPGT0uclrgYZLTU2OApjp0AYcOgfvlrk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725864AbgIKWv1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 11 Sep 2020 18:51:27 -0400
Received: from mail-io1-f68.google.com ([209.85.166.68]:44612 "EHLO
        mail-io1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725856AbgIKWv0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 11 Sep 2020 18:51:26 -0400
Received: by mail-io1-f68.google.com with SMTP id g128so12717728iof.11;
        Fri, 11 Sep 2020 15:51:25 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=9Ng98r0s3IYBx30DbWemt+5szNOjQi0PNbtlqmUkOt4=;
        b=eIAAnJUDQ6byUTjzgBxAFBszIlj/PD3I71X+ful+c+YxYYqSUdKKAB7BZF/5M+PYma
         2J9rSn7dUlt9wdsp8mM4uylW4kQ5RWJzkYcDPVmBfM/2uhgBa9dSXm0o+lEXyIWnuLI+
         O1rA5qJ5itrNJ04k1I68FObnAl946TfHU1KB3ouvHzEEPHzjXlI1KYAXALQbHMyOwpqw
         Q9n3g2KmIcFJl9vkbNU7dbkkcASCFhFfim3REwqUGWXR4T7aWrhu0FUw2DjO++6tuPoP
         oxQclLaNcZVm6gzGgYaATvhT6w0N1KcFPhCDit+CnFnHj+3nB+HDQ/9RoYp1+JvDvWZM
         BJ6w==
X-Gm-Message-State: AOAM530r8MppNjTUZf2sKVBHaVxEQGQTBxgJf30qO3hBonX92DIhYB5C
        JL3pyEGEenAHd1s9NH6C1w==
X-Google-Smtp-Source: ABdhPJw43vAdQMw25cb0xfy5r2u6fEhFJWSnw9/2LWINeJsHOzMJS4pUAJ3cfIPeKCFu06Urykv/nQ==
X-Received: by 2002:a05:6602:2d55:: with SMTP id d21mr3515735iow.134.1599864684937;
        Fri, 11 Sep 2020 15:51:24 -0700 (PDT)
Received: from xps15 ([64.188.179.251])
        by smtp.gmail.com with ESMTPSA id r11sm1989416ilt.76.2020.09.11.15.51.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Sep 2020 15:51:24 -0700 (PDT)
Received: (nullmailer pid 2967511 invoked by uid 1000);
        Fri, 11 Sep 2020 22:51:23 -0000
Date:   Fri, 11 Sep 2020 16:51:23 -0600
From:   Rob Herring <robh@kernel.org>
To:     Alexandre Bailon <abailon@baylibre.com>
Cc:     mathieu.poirier@linaro.org, matthias.bgg@gmail.com,
        linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
        robh+dt@kernel.org, linux-arm-kernel@lists.infradead.org,
        ohad@wizery.com, linux-remoteproc@vger.kernel.org,
        gpain@baylibre.com, devicetree@vger.kernel.org,
        bjorn.andersson@linaro.org, stephane.leprovost@mediatek.com
Subject: Re: [PATCH v2 1/4] dt bindings: remoteproc: Add bindings for MT8183
 APU
Message-ID: <20200911225123.GA2966686@bogus>
References: <20200910130148.8734-1-abailon@baylibre.com>
 <20200910130148.8734-2-abailon@baylibre.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20200910130148.8734-2-abailon@baylibre.com>
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 10 Sep 2020 15:01:45 +0200, Alexandre Bailon wrote:
> This adds dt bindings for the APU present in the MT8183.
> 
> Signed-off-by: Alexandre Bailon <abailon@baylibre.com>
> ---
>  .../bindings/remoteproc/mtk,apu.yaml          | 107 ++++++++++++++++++
>  1 file changed, 107 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/remoteproc/mtk,apu.yaml
> 


My bot found errors running 'make dt_binding_check' on your patch:

Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dts:22:18: fatal error: dt-bindings/power/mt8183-power.h: No such file or directory
   22 |         #include <dt-bindings/power/mt8183-power.h>
      |                  ^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
compilation terminated.
make[1]: *** [scripts/Makefile.lib:342: Documentation/devicetree/bindings/remoteproc/mtk,apu.example.dt.yaml] Error 1
make[1]: *** Waiting for unfinished jobs....
make: *** [Makefile:1366: dt_binding_check] Error 2


See https://patchwork.ozlabs.org/patch/1362090

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure dt-schema is up to date:

pip3 install git+https://github.com/devicetree-org/dt-schema.git@master --upgrade

Please check and re-submit.

