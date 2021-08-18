Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 25E85C4320E
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 13:05:43 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 059FE61053
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Aug 2021 13:05:43 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236615AbhHRNGQ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Aug 2021 09:06:16 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:42900 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236614AbhHRNGQ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Aug 2021 09:06:16 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17ID5aW4086265;
        Wed, 18 Aug 2021 08:05:36 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629291936;
        bh=CSvpw5yzpEsObQQ/2pV3/bp6WVTuspaj32I/WVC7q78=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=Az5UT/meW9RrAGO+K23lnCg0om2iELjvPMYR7YXkLQhogNLhWcuO68acXKsPYBQ1s
         x2IT4S96+M5DM0j5S6mLthx6ewiTmi06tOjpnx6WSUKOE6z760jMV6uRBiREzRNpSZ
         BrvjnGbSnlaWAjz1WKY7LVRvs3sP2kkuPGz8tUqs=
Received: from DLEE113.ent.ti.com (dlee113.ent.ti.com [157.170.170.24])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17ID5ae6030705
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Wed, 18 Aug 2021 08:05:36 -0500
Received: from DLEE110.ent.ti.com (157.170.170.21) by DLEE113.ent.ti.com
 (157.170.170.24) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Wed, 18
 Aug 2021 08:05:35 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE110.ent.ti.com
 (157.170.170.21) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Wed, 18 Aug 2021 08:05:36 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17ID5ZQm071711;
        Wed, 18 Aug 2021 08:05:35 -0500
Date:   Wed, 18 Aug 2021 08:05:35 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
CC:     Ohad Ben-Cohen <ohad@wizery.com>, Rob Herring <robh+dt@kernel.org>,
        Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V1] dt-bindings: remoteproc: k3-dsp: Update example to
 remove board specific
Message-ID: <20210818130535.siv7jpjjzfwonwdt@unsteady>
References: <20210818074030.1877-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210818074030.1877-1-sinthu.raja@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 13:10-20210818, Sinthu Raja wrote:
> The example includes a board-specific compatible property, but developers
> need to add the board name each time when a new board is added to the K3
> J721E SoC list. This grows the compatible string-list. So, drop the
> board-specific compatible string and add cbass_main as a parent node to

What is cbass_main node?

> avoid parent node and child node address-cells mismatch error.
> 

I think you mean that since the existing example uses address cells and
size for 64bit addresses and sizes, you are introducing a bus segment
indicative of the same capability to reduce the churn in the binding.
Correct? if so, rephrase accordingly.

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

Your From: and Signed-off-by email IDs do not match. You might want to
re-read the contribution guidelines documentation in linux kernel.

This should be also tagged with Fixes: since it is fixing a pre-existing
binding that slipped through our review.

NOTE: at least my test.. (I think rob's system will still complain)
base: next-20210818
b4 am -o  ~/tmp -3 -g -t -l -c -s --no-cover 20210818074030.1877-1-sinthu.raja@ti.com
	https://pastebin.ubuntu.com/p/VxzzvzpY9N/

I mean, both these can be caught with checkpatch and standard checks, so
did you see that in your basic vett prior to posting?

> ---
> Changes in V1:
> Fixed alignment issue which caused the yaml parse error.

Some 101 comments:

A) when you post a new revision, post a url like previous versions in
   diffstat - :
   https://lore.kernel.org/linux-devicetree/20210817152005.21575-1-sinthu.raja@ti.com/
B) When you are sending the very first patch, it is already V1 and
   does'nt need to be explicitly stated. this update to your original
   post is a V2, so, when you update this patch to address the review
   comments, the next revision will be V3.

> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml     | 6 ++----
>  1 file changed, 2 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index 6070456a7b67..e44a9397b8db 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -132,10 +132,8 @@ required:
>  unevaluatedProperties: false
>  
>  examples:
> -  - |
> -    / {
> -        model = "Texas Instruments K3 J721E SoC";
> -        compatible = "ti,j721e";
> +  - |+

minor detail: you are also doing one additional change -> you are now using
the standard example template and adding the example node instead of a
complete example node as well here. Personally, I do prefer this
approach rather than the previous example.

> +    cbass_main {
>          #address-cells = <2>;
>          #size-cells = <2>;



Usually, when one sees problems like these, they tend to be
symptomatic, and we need to look if there is a similar pattern of
error else where in the codebase.

Sigh, in this case, I see the same problem in:
a) Documentation/devicetree/bindings/remoteproc/ti,k3-r5f-rproc.yaml
b) Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml

Hari, Sinthu,
Can we fix these in a series that belongs to each maintainer?

>  
> -- 
> 2.31.1
> 

-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
