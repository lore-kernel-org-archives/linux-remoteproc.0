Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-20.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7F50DC47089
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:17:27 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3D7DB6128D
	for <linux-remoteproc@archiver.kernel.org>; Fri, 28 May 2021 03:17:27 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236320AbhE1DTA (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 27 May 2021 23:19:00 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:52152 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbhE1DS7 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 27 May 2021 23:18:59 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F2FCBC061760
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:17:25 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id w127so2905266oig.12
        for <linux-remoteproc@vger.kernel.org>; Thu, 27 May 2021 20:17:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=Fj6yd4g3TXDmWwf/fK4MDrrZ2Jmwp4JZlzW8aDmDn3Y=;
        b=zsMQpJ5RdRYryTFtLjl5EbEWvN/bwGgRWNHBN7gYmTygCYZ5R9g/TJlWSVUpADeOaf
         hezuDxTM8XY0AKG0emXIMEv2rHeP6Xn2qVmHL/Wy+uWstqNX00TG/lXuhXSecLa0CwXU
         RdVdPKsyqoUBvqNj6pKsM9B/oQnkVu9lw/bALcKx6Ii1AUiJpkX8XGjnF9cukwmudse4
         BxJTVZ2nhsGHYWcMNsaZCv1cZZXjWIl/7/k50kz74KFOwKBv7c1qGivzhLYYUW47NFRV
         sCOgHk/YiFCoSMW0b/kWaMFoV9sDiEL4frFnl7SP09ujaH6WyQqG3GF8UGnSnXQs+a6F
         fUbg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=Fj6yd4g3TXDmWwf/fK4MDrrZ2Jmwp4JZlzW8aDmDn3Y=;
        b=AW1n560oPzTi7UyxUz3I69uHe2xpcmSk4mRzfgtotQgbQYiPU2Lu/9F/EorgTqC07o
         14ui0HEJftUGpd6zg94wOTN7CK5y3agoRlYzxMZ9thz/AkeYR+TZO4mLKhy2O93ZEyq+
         Zr6J2uBCRtWICxdkvoglAt0y7vYMcpChHpaJ+D+m+j6Jt4xBd8eSKV9DDH9tsc74Ys4P
         XiyKsiv7PYMTIu2BPLNwyUPRQsmExbXsu2gUKs5GcohoHEe9lM67rCxxTpdTSfYSanaU
         m70E7GqdKFex7k+83Dn5iKKUk3Mh0GvuFJrqQuvt0FqnM/MWidIC087OD+qxRkiyd3L4
         bUAQ==
X-Gm-Message-State: AOAM53098Eeb1ddR9HN1OzNPpXBQOIqO+rKoaqRIjaLobZxLFWLwxs+Z
        52H1S1Vc+F/PtC6ySgKVT2MKM/yf3o/c2Q==
X-Google-Smtp-Source: ABdhPJxqRihBpgL6lj+evaoTo7huY41OzFJ14nffnsAKGVI8c/xGw0DoIXBOhbBGoZeejZoxUvA7WA==
X-Received: by 2002:aca:af8f:: with SMTP id y137mr7422874oie.159.1622171845173;
        Thu, 27 May 2021 20:17:25 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id h4sm857667ooq.6.2021.05.27.20.17.24
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 27 May 2021 20:17:24 -0700 (PDT)
Date:   Thu, 27 May 2021 22:17:22 -0500
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Suman Anna <s-anna@ti.com>
Cc:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Lokesh Vutla <lokeshvutla@ti.com>,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] dt-bindings: remoteproc: k3-r5f: Update bindings
 for AM64x SoCs
Message-ID: <YLBgwkiT9PE3Cu82@builder.lan>
References: <20210327143117.1840-1-s-anna@ti.com>
 <20210327143117.1840-2-s-anna@ti.com>
 <8948a30c-1a2f-1fb0-05bb-37be9c02c5d5@ti.com>
 <ff8edffb-d926-9641-740b-2c292139aa07@ti.com>
 <20210521204053.GA1011163@xps15>
 <911bfb1d-8e66-298a-83ba-998040f5596d@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <911bfb1d-8e66-298a-83ba-998040f5596d@ti.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon 24 May 10:47 CDT 2021, Suman Anna wrote:

> On 5/21/21 3:40 PM, Mathieu Poirier wrote:
> > Hi suman,
> > 
> > On Wed, May 12, 2021 at 09:47:44PM -0500, Suman Anna wrote:
> >> Hi Rob,
> >>
> >> On 4/19/21 8:55 AM, Suman Anna wrote:
> >>> Hi Rob,
> >>>
> >>> On 3/27/21 9:31 AM, Suman Anna wrote:
> >>>> The K3 AM64x SoCs have two dual-core Arm R5F clusters/subsystems, with
> >>>> 2 R5F cores each, both in the MAIN voltage domain.
> >>>>
> >>>> These clusters are a revised IP version compared to those present on
> >>>> J721E and J7200 SoCs, and supports a new "Single-CPU" mode instead of
> >>>> LockStep mode. Update the K3 R5F remoteproc bindings with the compatible
> >>>> info relevant to these R5F clusters/subsystems on K3 AM64x SoCs.
> >>>>
> >>>> Signed-off-by: Suman Anna <s-anna@ti.com>
> >>>> ---
> >>>> v2: No changes
> >>>>
> >>>>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  | 31 ++++++++++++++++---
> >>>
> >>> Looks like this patch has fallen through the cracks, can you please review and
> >>> give your ack for this patch so that Bjorn can pick up the series for 5.13?
> >>
> >> Gentle reminder, do you have any comments on this patch. Appreciate your ack so
> >> that we can get this in for 5.14?
> > 
> > If memory serves me well Rob indicated that he would not review or comment on
> > bindings related to multi-core remote processors.  On the flip side he also
> > mentioned that he would not object to their presence.  And since this is an
> > increment to an existing binding rather than a new one, I think it is fair for
> > us to pick it up.  
> > 
> > Rob - please intervene if my recollections are not accurate and accept my honest
> > apologies.  Otherwise: 
> > 
> > Reviewed-by: Mathieu Poirier <mathieu.poirier@linaro.org> 
> > 
> 
> Thank you Mathieu.
> 
> Bjorn,
> Is it possible for you to give an immutable branch with just this bindings so we
> can add the R5F nodes as well and avoid any checkpatch warnings on Nishanth's
> tree with our K3 dts patches?
> 

Hi Suman,

That sounds rather ambitious, but you can now find this at:
https://git.kernel.org/pub/scm/linux/kernel/git/andersson/remoteproc.git/tag/?h=20210327143117.1840-2-s-anna@ti.com

Regards,
Bjorn

> regards
> Suman
> 
> >>
> >> regards
> >> Suman
> >>
> >>>
> >>> regards
> >>> Suman
> >>>
> >>>>  1 file changed, 26 insertions(+), 5 deletions(-)
> >>>>
> >>>> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >>>> index d905d614502b..130fbaacc4b1 100644
> >>>> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >>>> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
> >>>> @@ -14,8 +14,12 @@ description: |
> >>>>    processor subsystems/clusters (R5FSS). The dual core cluster can be used
> >>>>    either in a LockStep mode providing safety/fault tolerance features or in a
> >>>>    Split mode providing two individual compute cores for doubling the compute
> >>>> -  capacity. These are used together with other processors present on the SoC
> >>>> -  to achieve various system level goals.
> >>>> +  capacity on most SoCs. These are used together with other processors present
> >>>> +  on the SoC to achieve various system level goals.
> >>>> +
> >>>> +  AM64x SoCs do not support LockStep mode, but rather a new non-safety mode
> >>>> +  called "Single-CPU" mode, where only Core0 is used, but with ability to use
> >>>> +  Core1's TCMs as well.
> >>>>  
> >>>>    Each Dual-Core R5F sub-system is represented as a single DTS node
> >>>>    representing the cluster, with a pair of child DT nodes representing
> >>>> @@ -33,6 +37,7 @@ properties:
> >>>>        - ti,am654-r5fss
> >>>>        - ti,j721e-r5fss
> >>>>        - ti,j7200-r5fss
> >>>> +      - ti,am64-r5fss
> >>>>  
> >>>>    power-domains:
> >>>>      description: |
> >>>> @@ -56,11 +61,12 @@ properties:
> >>>>  
> >>>>    ti,cluster-mode:
> >>>>      $ref: /schemas/types.yaml#/definitions/uint32
> >>>> -    enum: [0, 1]
> >>>>      description: |
> >>>>        Configuration Mode for the Dual R5F cores within the R5F cluster.
> >>>> -      Should be either a value of 1 (LockStep mode) or 0 (Split mode),
> >>>> -      default is LockStep mode if omitted.
> >>>> +      Should be either a value of 1 (LockStep mode) or 0 (Split mode) on
> >>>> +      most SoCs (AM65x, J721E, J7200), default is LockStep mode if omitted;
> >>>> +      and should be either a value of 0 (Split mode) or 2 (Single-CPU mode)
> >>>> +      on AM64x SoCs, default is Split mode if omitted.
> >>>>  
> >>>>  # R5F Processor Child Nodes:
> >>>>  # ==========================
> >>>> @@ -97,6 +103,7 @@ patternProperties:
> >>>>            - ti,am654-r5f
> >>>>            - ti,j721e-r5f
> >>>>            - ti,j7200-r5f
> >>>> +          - ti,am64-r5f
> >>>>  
> >>>>        reg:
> >>>>          items:
> >>>> @@ -198,6 +205,20 @@ patternProperties:
> >>>>  
> >>>>      unevaluatedProperties: false
> >>>>  
> >>>> +if:
> >>>> +  properties:
> >>>> +    compatible:
> >>>> +      enum:
> >>>> +        - ti,am64-r5fss
> >>>> +then:
> >>>> +  properties:
> >>>> +    ti,cluster-mode:
> >>>> +      enum: [0, 2]
> >>>> +else:
> >>>> +  properties:
> >>>> +    ti,cluster-mode:
> >>>> +      enum: [0, 1]
> >>>> +
> >>>>  required:
> >>>>    - compatible
> >>>>    - power-domains
> >>>>
> >>>
> >>
> 
