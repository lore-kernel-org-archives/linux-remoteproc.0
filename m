Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25A10C433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 25 Sep 2021 14:52:49 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0538B610CB
	for <linux-remoteproc@archiver.kernel.org>; Sat, 25 Sep 2021 14:52:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1343783AbhIYOyU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 25 Sep 2021 10:54:20 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:49924 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234173AbhIYOyT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 25 Sep 2021 10:54:19 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18PEqYs2015433;
        Sat, 25 Sep 2021 09:52:34 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632581554;
        bh=uJ7DvnEmGCuz4FVCDrHQuDOi+qqLDfXdcIzC2WTH42o=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=PA7N5/5P964G7xnovC9ZGpoJD4Oe9P2C7PzJX9CEjGrbL8gKUVyUSiUBRbOD97HG2
         JKtyR1TaSasVgKyp4HmJa1z1qm+YPofgZkZ1lxo0IPD2WRhZbhjcEXcNFH8m0mgf3x
         fBZAzdb8qGG2xx6U1WdoND00Xj+bRBVTRjT5i0IM=
Received: from DLEE115.ent.ti.com (dlee115.ent.ti.com [157.170.170.26])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18PEqYSR101790
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 25 Sep 2021 09:52:34 -0500
Received: from DLEE100.ent.ti.com (157.170.170.30) by DLEE115.ent.ti.com
 (157.170.170.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 25
 Sep 2021 09:52:33 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE100.ent.ti.com
 (157.170.170.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 25 Sep 2021 09:52:33 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18PEqXfY085824;
        Sat, 25 Sep 2021 09:52:33 -0500
Date:   Sat, 25 Sep 2021 09:52:33 -0500
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
Message-ID: <20210925145233.vczhgui6cchkih5m@oxidize>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-3-sinthu.raja@ti.com>
 <4d43e927-3998-e9a9-87a6-6036b769a975@ti.com>
 <20210924162920.mvnzcibfm7s265us@boxing>
 <dcb0b95f-92a9-a5f5-ee91-1b1d7123bd8d@ti.com>
 <6a6a0d3a-522c-d01c-d3b8-a13488d0c736@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <6a6a0d3a-522c-d01c-d3b8-a13488d0c736@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 12:54-20210924, Suman Anna wrote:
> Hi Sinthu,
> 
> On 9/24/21 12:25 PM, Suman Anna wrote:
> > On 9/24/21 11:29 AM, Nishanth Menon wrote:
> >> On 11:10-20210924, Suman Anna wrote:
> >>> Hi Sinthu,
> >>>
> >>> On 9/17/21 4:54 AM, Sinthu Raja wrote:
> >>>> From: Sinthu Raja <sinthu.raja@ti.com>
> >>>>
> >>>> The example includes a board-specific compatible property, this is
> >>>> wrong as the example should be board agnostic and gets in the way of
> >>>> additions for newer platforms. Replace the same with a generic soc
> >>>> node.
> >>>
> >>> What board specific property? This description looks wrong.
> 
> Can you please repost dropping the Fixes line, and modifying the patch
> description as follows:
> 
> dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT example
> 
> The K3 DSP binding example used the root-node with a SoC compatible
> property originally to address the dt_binding_check warnings resulting
> from using a value of 2 for #address-cells and #size-cells as per most
> common usage on K3 SoCs. Clean this up and replace it with a generic soc
> node to keep it agnostic of the SoC or board compatibles that are outside
> the scope of this binding.


This looks good to me as well. Thanks.

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
