Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 47714C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 14:48:00 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2923A60F9C
	for <linux-remoteproc@archiver.kernel.org>; Fri, 17 Sep 2021 14:48:00 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230494AbhIQOtV (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 17 Sep 2021 10:49:21 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:35350 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231994AbhIQOtU (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 17 Sep 2021 10:49:20 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18HElrDN012905;
        Fri, 17 Sep 2021 09:47:53 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631890073;
        bh=RhzXgTYEm3jS3Kl013Abzub/Q/o3jW8UqXva0CEru/Q=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=w2VMIh47KNZt3o+m/0dNbdd6G6atQj9reSDS9/D4PhA0YZMN9PkbpBaSfBIcybM+T
         YS4GPyGartJx7EpWgKwBU6MnyM1/8+6anm9RbL0SbEU26ICdxv8yacXYK4fzIXqAxW
         HubJEsAtiA2wJkYScZdUGPgrdOuxPHfUVXWH6Qbk=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18HElqDf130182
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 17 Sep 2021 09:47:53 -0500
Received: from DLEE102.ent.ti.com (157.170.170.32) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 17
 Sep 2021 09:47:52 -0500
Received: from lelv0326.itg.ti.com (10.180.67.84) by DLEE102.ent.ti.com
 (157.170.170.32) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 17 Sep 2021 09:47:52 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0326.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18HElqLg014651;
        Fri, 17 Sep 2021 09:47:52 -0500
Date:   Fri, 17 Sep 2021 09:47:52 -0500
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
Subject: Re: [PATCH V3 0/2] dt-bindings: remoteproc: k3-r5f|dsp: Remove
Message-ID: <20210917144752.5iafhxacxrv5cyur@elixir>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210917095426.19277-1-sinthu.raja@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

oops.. cover-letter $subject is probably improved with "board-specific
compatible"?, but anyways, does'nt matter for the rest f the actual
patches..

On 15:24-20210917, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> Bjorn,
> 
> The series of patches are meant to help make the rproc bindings for K3
> r5f and dsp support independent of board/platform involved. The current
> examples get in the way of the device tree cleanups and new platform
> introductions [1].
> 
> When applying this series, it would greatly help us if you could provide
> us with a immutable tag for Nishanth to merge in and help introduce the
> newer platforms that are blocked by this cleanup. See [2] for further
> context of why we are requesting for immutable tag.

Yes again please. once Rob reviews the binding patches, This series is
blocking me and thanks for respinning them.

For the series:

Reviewed-by: Nishanth Menon <nm@ti.com>

> 
> Changes in V3:
> - Added r5f cleanup as well
> - Commit message, $subject and simplification of the fixup.
> 
> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> 
> 
> Sinthu Raja (2):
>   dt-bindings: remoteproc: k3-r5f: Remove board-specific compatible from
>     DT example
>   dt-bindings: remoteproc: k3-dsp: Remove board-specific compatible from
>     DT example
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
>  .../devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml       | 4 +---
>  2 files changed, 2 insertions(+), 6 deletions(-)
> 
> [1] https://lore.kernel.org/all/1631794913.472895.1119414.nullmailer@robh.at.kernel.org/ 
> [2] https://lore.kernel.org/linux-arm-kernel/20210125141642.4yybjnklk3qsqjdy@steersman/
> -- 
> 2.32.0
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
