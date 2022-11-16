Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 03394C4332F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 16 Nov 2022 18:10:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233941AbiKPSJ5 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 16 Nov 2022 13:09:57 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:50068 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233931AbiKPSJ4 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 16 Nov 2022 13:09:56 -0500
Received: from mail-pl1-x634.google.com (mail-pl1-x634.google.com [IPv6:2607:f8b0:4864:20::634])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 47B7C60E9B
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 10:09:53 -0800 (PST)
Received: by mail-pl1-x634.google.com with SMTP id b21so17152547plc.9
        for <linux-remoteproc@vger.kernel.org>; Wed, 16 Nov 2022 10:09:53 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=Uha19DGn1cipYAwBOyrw3AdHNrtOnbopGJxC7rXrQ/k=;
        b=ZDqc3cq8Ax6Pt6u3GCJwqCQZVVe1CuQQnKni3FkP4DUVLls/bdpD3QXrmfOOLJ/OU+
         Jfv4C5/TqWM2DDHgO720x5Xcq/Vqfv1/a4KOb90OGfQ6qrkPrsaGi1fUvHiX1KF9glmC
         8V3yRUNVIGVUj/LQvT73c5YIIXHdiXQoBUdeFQJKy7n2L+ovNz88ysop7e8LvEn3+Ec+
         +tg1la6B4pqMhnJR9x0Enmk075wDgOrbqks9VPnVj0POpmGvJTxRzOJCu4SjKweioIIE
         8iBf5mr2Vlg8QBQllPtwzgMOAOEmnyoevookW7dt2aNmmznrCk+id7Mq9hj3iZ6GWgTQ
         5UHA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=Uha19DGn1cipYAwBOyrw3AdHNrtOnbopGJxC7rXrQ/k=;
        b=dFeICqLq+uhKmBjm+H2QD5Ze4HaTaNFt1RZkxYOPEilAzGSyEqiEuK9IPEA1nZ2G7U
         Mus1YlelG0PbfbDyQqwmDFtIGO7FB1waB9GII/yZv75YCIucR9ZXCnsWZzygtUemoVO/
         k1XBin1q768LUI/pNCEcUR8tguZ9v7+McdeV+sHuvn2NSxTQUv5wWivNkbf6glWLWFB7
         0E1roAxoP84QzFEu3cnnerm2igfL1iHJmPuuimwRKhpI3kknpQgKn0Ul7F6Gav99qjYe
         o1ZDXsBGo/DUDWcKLTU3B3c6hgrBgXOQqCFFzrlJ5ylgOmhESOHkm0WkGdhVFzwJg/hZ
         VUuQ==
X-Gm-Message-State: ANoB5pmP25NS8ERu+gOqup3CO5WsjX7VR4eRxZ2Tl4C3AevSGPQNku0a
        PpKX5Zz7TAgmdgXQLX8qm2qrWA==
X-Google-Smtp-Source: AA0mqf4faQyRgiiosbyugC6bNzLWoQKMwQYCzT7xgnogs350R64d9WVcRuMgRBcxR8HLMnc+FSrCWw==
X-Received: by 2002:a17:90a:6049:b0:218:4d16:cecf with SMTP id h9-20020a17090a604900b002184d16cecfmr4799475pjm.96.1668622192609;
        Wed, 16 Nov 2022 10:09:52 -0800 (PST)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id 16-20020a17090a19d000b0020ad53b5883sm1917200pjj.14.2022.11.16.10.09.51
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 16 Nov 2022 10:09:51 -0800 (PST)
Date:   Wed, 16 Nov 2022 11:09:49 -0700
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Rob Herring <robh@kernel.org>
Cc:     MD Danish Anwar <danishanwar@ti.com>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Suman Anna <s-anna@ti.com>, Roger Quadros <rogerq@kernel.org>,
        "Andrew F . Davis" <afd@ti.com>, nm@ti.com, vigneshr@ti.com,
        srk@ti.com, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 1/6] dt-bindings: remoteproc: Add PRU consumer bindings
Message-ID: <20221116180949.GC61935@p14s>
References: <20221116121634.2901265-1-danishanwar@ti.com>
 <20221116121634.2901265-2-danishanwar@ti.com>
 <20221116160948.GA169555-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20221116160948.GA169555-robh@kernel.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, Nov 16, 2022 at 10:09:48AM -0600, Rob Herring wrote:
> On Wed, Nov 16, 2022 at 05:46:29PM +0530, MD Danish Anwar wrote:
> > From: Suman Anna <s-anna@ti.com>
> > 
> > Add DT schema binding for PRU consumers. The binding includes
> > all the common properties that can be used by different PRU consumer
> > or application nodes and supported by the PRU remoteproc driver.
> > These are used to configure the PRU hardware for specific user
> > applications.
> > 
> > The application nodes themselves should define their own bindings.
> > 
> > Co-developed-by: Tero Kristo <t-kristo@ti.com>
> > Co-developed-by: Suman Anna <s-anna@ti.com>
> > Co-developed-by: Grzegorz Jaszczyk <grzegorz.jaszczyk@linaro.org>
> > Co-developed-by: Puranjay Mohan <p-mohan@ti.com>
> > Signed-off-by: MD Danish Anwar <danishanwar@ti.com>
> 
> Run checkpatch.pl and fix the warnings with the tags.

My bad - I asked Danish to remove the SoBs to lighten the changelog
presentation.  Danish, do you absolutely need to list everyone that touched that
patchset?  If so I suppose just listing the SoBs would be a compromise.

> 
> You didn't add review/ack tags either.

Those are important.  

Please send another patchset that clears checkpatch with review/acks and I'll
look at it.

Thanks,
Mathieu

> 
> > ---
> >  .../bindings/remoteproc/ti,pru-consumer.yaml  | 60 +++++++++++++++++++
> >  1 file changed, 60 insertions(+)
> >  create mode 100644 Documentation/devicetree/bindings/remoteproc/ti,pru-consumer.yaml
