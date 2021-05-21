Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.7 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 97A2AC4707A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 May 2021 20:40:59 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7546661057
	for <linux-remoteproc@archiver.kernel.org>; Fri, 21 May 2021 20:40:59 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229772AbhEUUmW (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 21 May 2021 16:42:22 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:41226 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229655AbhEUUmV (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 21 May 2021 16:42:21 -0400
Received: from mail-pl1-x632.google.com (mail-pl1-x632.google.com [IPv6:2607:f8b0:4864:20::632])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 9BED1C061574
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 May 2021 13:40:57 -0700 (PDT)
Received: by mail-pl1-x632.google.com with SMTP id s4so10044562plg.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 21 May 2021 13:40:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=LifjFlNevEXf+WuKNhiQrz3mqG/Jd9zYX3dDwRq7SGk=;
        b=WCaKMjCsxiNGPZhMpMhVU+dPqE4x64hY/0Q7f9YFw6kUF+nlWrIZRB4A0iTRNNISbp
         teG/wWKXFuvqlcTXIzIseoGpjJd/fWkFMTQDHv1srK6OEtQtYOYI34Vk0HeF7llHWa0e
         d8SLV49fKteEREhUmvRzjV0I+Z8HEDPO/n6Q6nWUOpyjiX/aC5ZsdOJlrSWuQh29ms40
         HTEfArJFtY8IMdY/ooVcNzb31so73/cXORp9jXo34QFD+NuPICLBsFXNvDlQZeYlUwCC
         7XQYZbN9T4ziR1vFqKfMcjhKewTYLCVJIRQte5lCUSglut+uCKf2tSM5bzpl7fK1xgR4
         4x2w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=LifjFlNevEXf+WuKNhiQrz3mqG/Jd9zYX3dDwRq7SGk=;
        b=q4GoOj2TCjFxzuhuBU0/xZtpmncQwNsfnwLpfB5AXmGRO47lm/YcXB80zAm39Ti+xN
         T97bWK2E7rDfpJMHS1HXi4tZ3fgxwItD6OoU8UM+62sZHHRo3ERDCdBm9T7MYor59QVT
         KbOZ0tBZ7vGCxjWn+5Eo14mLSKxrDOFU0zDFpiNuTj1+gefUMQF6iv+qb8HkQKdBPfFv
         3gkMcxAdTeqG2hMwhdrn/cDJDWYV0Gnj/eQQgEln8N4HiBMB/ExrqilEEDJEWBkDZS9Q
         CfoeNMGiCcjrWOYd3oyM4R4t62OA7HBan8aF/c5tQ/oCU2jiho65LN5aeW8tqHoPC0X4
         q4aA==
X-Gm-Message-State: AOAM533U4LKz8abR8AT7KKYJb4vyuzfRV97+u8SJM9OmIOEh5+EYKILI
        HR2apsXZqDAyI20ZaGVQMYeqtg==
X-Google-Smtp-Source: ABdhPJxoCN0sZ9yBL76WTujQukSyTuxAZKG4LMMR29tS9iSt6lYMoSjrF+QXe4OKP2DdBPh2ERv24w==
X-Received: by 2002:a17:902:34f:b029:ef:3d14:1c27 with SMTP id 73-20020a170902034fb02900ef3d141c27mr14083008pld.65.1621629656594;
        Fri, 21 May 2021 13:40:56 -0700 (PDT)
Received: from xps15 (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id d10sm4878429pfo.65.2021.05.21.13.40.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 21 May 2021 13:40:55 -0700 (PDT)
Date:   Fri, 21 May 2021 14:40:53 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: k3-r5f: Update bindings
 for AM64x SoCs
Message-ID: <20210521204053.GA1011163@xps15>
References: <20210327143117.1840-1-s-anna@ti.com>
 <20210327143117.1840-2-s-anna@ti.com>
 <8948a30c-1a2f-1fb0-05bb-37be9c02c5d5@ti.com>
 <ff8edffb-d926-9641-740b-2c292139aa07@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <ff8edffb-d926-9641-740b-2c292139aa07@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi suman,

On Wed, May 12, 2021 at 09:47:44PM -0500, Suman Anna wrote:
> Hi Rob,
> 
> On 4/19/21 8:55 AM, Suman Anna wrote:
> > Hi Rob,
> > 
> > On 3/27/21 9:31 AM, Suman Anna wrote:
> >> The K3 AM64x SoCs have two dual-core Arm R5F clusters/subsystems, with
> >> 2 R5F cores each, both in the MAIN voltage domain.
> >>
> >> These clusters are a revised IP version compared to those present on
> >> J721E and J7200 SoCs, and supports a new "Single-CPU" mode instead of
> >> LockStep mode. Update the K3 R5F remoteproc bindings with the compatible
> >> info relevant to these R5F clusters/subsystems on K3 AM64x SoCs.
> >>
> >> Signed-off-by: Suman Anna <s-anna@ti.com>
> >> ---
> >> v2: No changes
> >>
> >>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 31 ++++++++++++++++---
> > 
> > Looks like this patch has fallen through the cracks, can you please review and
> > give your ack for this patch so that Bjorn can pick up the series for 5.13?
> 
> Gentle reminder, do you have any comments on this patch. Appreciate your ack so
> that we can get this in for 5.14?

If memory serves me well Rob indicated that he would not review or comment on
bindings related to multi-core remote processors.  On the flip side he also
mentioned that he would not object to their presence.  And since this is an
increment to an existing binding rather than a new one, I think it is fair for
us to pick it up.  

Rob - please intervene if my recollections are not accurate and accept my honest
apologies.  Otherwise: 

Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org>  

> 
> regards
> Suman
> 
> > 
> > regards
> > Suman
> > 
> >>  1 file changed, 26 insertions(+), 5 deletions(-)
> >>
> >> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >> index d905d614502b..130fbaacc4b1 100644
> >> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >> @@ -14,8 +14,12 @@ description: |
> >>    processor subsystems/clusters (R5FSS). The dual core cluster can be used
> >>    either in a LockStep mode providing safety/fault tolerance features or in a
> >>    Split mode providing two individual compute cores for doubling the compute
> >> -  capacity. These are used together with other processors present on the SoC
> >> -  to achieve various system level goals.
> >> +  capacity on most SoCs. These are used together with other processors present
> >> +  on the SoC to achieve various system level goals.
> >> +
> >> +  AM64x SoCs do not support LockStep mode, but rather a new non-safety mode
> >> +  called "Single-CPU" mode, where only Core0 is used, but with ability to use
> >> +  Core1's TCMs as well.
> >>  
> >>    Each Dual-Core R5F sub-system is represented as a single DTS node
> >>    representing the cluster, with a pair of child DT nodes representing
> >> @@ -33,6 +37,7 @@ properties:
> >>        - ti,am654-r5fss
> >>        - ti,j721e-r5fss
> >>        - ti,j7200-r5fss
> >> +      - ti,am64-r5fss
> >>  
> >>    power-domains:
> >>      description: |
> >> @@ -56,11 +61,12 @@ properties:
> >>  
> >>    ti,cluster-mode:
> >>      $ref: /schemas/types.yaml#/definitions/uint32
> >> -    enum: [0, 1]
> >>      description: |
> >>        Configuration Mode for the Dual R5F cores within the R5F cluster.
> >> -      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
> >> -      default is LockStep mode if omitted.
> >> +      Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
> >> +      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
> >> +      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
> >> +      on AM64x SoCs, default is Split mode if omitted.
> >>  
> >>  # R5F Processor Child Nodes:
> >>  # ==========================
> >> @@ -97,6 +103,7 @@ patternProperties:
> >>            - ti,am654-r5f
> >>            - ti,j721e-r5f
> >>            - ti,j7200-r5f
> >> +          - ti,am64-r5f
> >>  
> >>        reg:
> >>          items:
> >> @@ -198,6 +205,20 @@ patternProperties:
> >>  
> >>      unevaluatedProperties: false
> >>  
> >> +if:
> >> +  properties:
> >> +    compatible:
> >> +      enum:
> >> +        - ti,am64-r5fss
> >> +then:
> >> +  properties:
> >> +    ti,cluster-mode:
> >> +      enum: [0, 2]
> >> +else:
> >> +  properties:
> >> +    ti,cluster-mode:
> >> +      enum: [0, 1]
> >> +
> >>  required:
> >>    - compatible
> >>    - power-domains
> >>
> > 
> 
