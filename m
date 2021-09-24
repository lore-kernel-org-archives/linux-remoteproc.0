Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1D936C433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 16:29:30 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F372F60232
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 16:29:29 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343498AbhIXQbC (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Sep 2021 12:31:02 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:57642 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S244892AbhIXQbC (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Sep 2021 12:31:02 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18OGTL2r108832;
        Fri, 24 Sep 2021 11:29:21 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632500961;
        bh=VTW26QISeUHwM/qRyY199/5lvvf3mRE4t9mjRGV1MHs=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=o+eNGW8g4FUnvb6hMc8Zs/kpXpFjrkftMyW5K+eopGXa0rKDBcfT08U4nx41nMBQo
         YpY+DXGXWjsughe0ZuISMbLTjCW1LKwOoeO46q8VanpwahavGN+Y3QdhHoDh8nDU5W
         XfKvb/F7lnhIl/CJiwDtDmKm68w1XQApyWMqwXus=
Received: from DFLE104.ent.ti.com (dfle104.ent.ti.com [10.64.6.25])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18OGTL7W040181
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Sep 2021 11:29:21 -0500
Received: from DFLE108.ent.ti.com (10.64.6.29) by DFLE104.ent.ti.com
 (10.64.6.25) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 24
 Sep 2021 11:29:20 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DFLE108.ent.ti.com
 (10.64.6.29) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 24 Sep 2021 11:29:20 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18OGTKZA086642;
        Fri, 24 Sep 2021 11:29:20 -0500
Date:   Fri, 24 Sep 2021 11:29:20 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Suman Anna <s-anna@ti.com>
CC:     Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>,
        Sinthu Raja <sinthu.raja@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
Subject: Re: [PATCH V3 2/2] dt-bindings: remoteproc: k3-dsp: Remove
 board-specific compatible from DT example
Message-ID: <20210924162920.mvnzcibfm7s265us@boxing>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-3-sinthu.raja@ti.com>
 <4d43e927-3998-e9a9-87a6-6036b769a975@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <4d43e927-3998-e9a9-87a6-6036b769a975@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11:10-20210924, Suman Anna wrote:
> Hi Sinthu,
> 
> On 9/17/21 4:54 AM, Sinthu Raja wrote:
> > From: Sinthu Raja <sinthu.raja@ti.com>
> > 
> > The example includes a board-specific compatible property, this is
> > wrong as the example should be board agnostic and gets in the way of
> > additions for newer platforms. Replace the same with a generic soc
> > node.
> 
> What board specific property? This description looks wrong.

See https://lore.kernel.org/all/1631794913.472895.1119414.nullmailer@robh.at.kernel.org/

> 
> > 
> > Fixes: 2a2180206ab6 ("dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs")
> 
> What error are you trying to fix exactly? The example used below is actually how
> it exactly appears in the J721E dts files, and there are no errors with
> dt_binding_check.

The rproc binding should have nothing to do with j721e SoC node
description. it should describe the rproc node that is described in
binding.

> 
> This is more a cleanup than a fix.  You can look through the original binding
> submission patches to see why it is done like this.

This is blocking any updates we would want to do in k3.yaml.
> 
> If this is triggered by the changes you are making to k3.yaml file as part of
> the J721E EAIK changes, then you probably may want to look at how you are doing

> that again. Looks like the k3.yaml file is being modified now to enforce
> "board-compatible", "soc-compatible" which may have triggered an error in this file.
> 
> Please evaluate if you need to modify it to support just the "soc-compatible" as
> one of the items.

See above link. This is not to do with eaik / sk. I am trying to
standardize the board definitions in yaml for k3 and this binding
specifically is getting in the way.


I still don't understand what your contention is here. Are you arguing
that the binding example is correct and should be tied to a platform?


Yes, I know I can introduce oneOf and a little more intricate solution,
	but besides that, i disagree that a rproc binding should even
	have SoC specific top level node description in it.
a) rproc.yaml does'nt even describe the SoC. soc.yaml does.
b) The node property examples are supposed to be examples not tied to a
   specific SoC.

> > Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> > ---
> > 
> > Changes since V2:
> > * review comment updates, including simplifying the changes, commit
> >   message and $subject updates.
> > 
> > V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> > V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> > 
> >  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
> >  1 file changed, 1 insertion(+), 3 deletions(-)
> > 
> > diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > index 6070456a7b67..5ec6505ac408 100644
> > --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> > @@ -133,9 +133,7 @@ unevaluatedProperties: false
> >  
> >  examples:
> >    - |
> > -    / {
> > -        model = "Texas Instruments K3 J721E SoC";
> > -        compatible = "ti,j721e";
> > +    soc {
> 
> While this may be resolving the dt_bindings_check you might be seeing with the
> modified k3.yaml, note that "soc" property is not used on K3 dts files, you
> might be creating confusion for people who look at this example and the actual
> usage.


It is a common usage model. NOTE: these are example nodes and NOT meant
as SoC representation. I dont see the confusion.
-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
