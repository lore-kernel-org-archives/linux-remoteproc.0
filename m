Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C7B48C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:16 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A9638604D1
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 15:08:16 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234961AbhI0PJx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 11:09:53 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:54422 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234976AbhI0PJx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 11:09:53 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18RF89R3042957;
        Mon, 27 Sep 2021 10:08:09 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632755289;
        bh=bEegF4afA1bvapjzNS3QbQh/0LbycubKms/39orBhoc=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=VdCMKDgdhO+efvFQQHTh2wMcArbIjohHOrZVYhbATB1QKxell4V6Ces/gnDNEAadf
         khlMsNZJB7rEsBo0ivYM6YJrqSlqIi2H0zzcCKTzKnT7dIlu5WpEyY8m9cBFGVwYJe
         EjkrKsJRWj8GonBDg7WWWm0uSKQE1SHR1fEOmZcc=
Received: from DFLE112.ent.ti.com (dfle112.ent.ti.com [10.64.6.33])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18RF89b8098136
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Mon, 27 Sep 2021 10:08:09 -0500
Received: from DFLE102.ent.ti.com (10.64.6.23) by DFLE112.ent.ti.com
 (10.64.6.33) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Mon, 27
 Sep 2021 10:08:08 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Mon, 27 Sep 2021 10:08:08 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18RF88Lw002298;
        Mon, 27 Sep 2021 10:08:08 -0500
Date:   Mon, 27 Sep 2021 10:08:08 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
CC:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V4 0/2] dt-bindings: remoteproc: k3-r5f|dsp: Remove
Message-ID: <20210927150808.rnkmeww5uciuafmc@underpay>
References: <20210927103811.11222-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210927103811.11222-1-sinthu.raja@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 16:08-20210927, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Hi All,
> The series of patches are meant to help make the rproc bindings for K3
> r5f and dsp support independent of board/platform involved.
> 
> Changes in V4:
> Addressed review comments:
> - Removed Fixes tags from the commit descriptions.
> - Updated subject and commit description to emphasis on cleaning up of the 
>   example to address the dt_binding_check warnings.
> 
> 
> V3: https://lore.kernel.org/all/20210917095426.19277-1-sinthu.raja@ti.com/
> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> 
> Sinthu Raja (2):
>   dt-bindings: remoteproc: k3-r5f: Cleanup SoC compatible from DT
>     example
>   dt-bindings: remoteproc: k3-dsp: Cleanup SoC compatible from DT
>     example
> 


Reviewed-by: Nishanth Menon <nm@ti.com>

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
