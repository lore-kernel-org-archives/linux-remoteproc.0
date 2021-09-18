Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-17.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AB2DC433F5
	for <linux-remoteproc@archiver.kernel.org>; Sat, 18 Sep 2021 18:53:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 7513561050
	for <linux-remoteproc@archiver.kernel.org>; Sat, 18 Sep 2021 18:53:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235290AbhIRSyd (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 18 Sep 2021 14:54:33 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:35770 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233394AbhIRSyd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 18 Sep 2021 14:54:33 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18IIqukW055099;
        Sat, 18 Sep 2021 13:52:56 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1631991176;
        bh=7M/aVuYrnKzWKsk0oq0vlafzkgNIfFCqLDA4zjJubyU=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=KV7tpQDhC9PWW0mksniuacZPwEbB4vqJAkRqj6wAXsbtIGIi6j2Sl1uSYrjNUXOqO
         qtr/bKE4+vp0W/5u6eerAlD3f1170qgA/XM9IFrF1qFpN6+o0aza/8ExHEbKpdTA8/
         VMOnlPEvKneY7alTiOXBvk3rJ/MprZYa1Sneo8S4=
Received: from DFLE109.ent.ti.com (dfle109.ent.ti.com [10.64.6.30])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18IIqu9O086066
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Sat, 18 Sep 2021 13:52:56 -0500
Received: from DFLE115.ent.ti.com (10.64.6.36) by DFLE109.ent.ti.com
 (10.64.6.30) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Sat, 18
 Sep 2021 13:52:56 -0500
Received: from fllv0039.itg.ti.com (10.64.41.19) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Sat, 18 Sep 2021 13:52:56 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0039.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18IIquu7092846;
        Sat, 18 Sep 2021 13:52:56 -0500
Date:   Sat, 18 Sep 2021 13:52:56 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>
CC:     Suman Anna <s-anna@ti.com>, Rob Herring <robh+dt@kernel.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-remoteproc@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V2] dt-bindings: hwlock: omap: Remove redundant binding
 example
Message-ID: <20210918185256.jcjvlmgftycwf7lo@repeal>
References: <20210917170805.5079-1-sinthu.raja@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <20210917170805.5079-1-sinthu.raja@ti.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 22:38-20210917, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The example includes a board-specific compatible property, this is wrong
> as the example should be board agnostic and should represent the particular
> binding. Also, the file includes two similar examples, but with a different
> compatible. So, drop the entire second example
> 
> Fixes: d8db9dc34871 ("dt-bindings: hwlock: omap: Convert binding to YAML")

Since we are cleaning up, You should probably drop the fixes. Esp when
adding fixes, checkout the specific commit and attempt to git am this
patch.. you would notice it wont apply.. and per stable rules, it is
probably too trivial to backport to so many stable kernels.

The later commit 891adc1303fe ("dt-bindings: hwlock: omap:
Fix warnings with k3.yaml") attempted to fixup by making it
board-specific, which was'nt solving the underlying problem either as
this patch is doing..


Also it would be nice if you could attribute this to Bjorn by adding:
Suggested-by: Bjorn Andersson <bjorn.andersson@linaro.org>

> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>

> ---
> 
> Changes in V2:
> Addressed review comments, that includes dropping the redundant example,
> updates to commit message and $subject.


I like this version much better. Thanks Bjorn for pointing the same out,
the yaml is much cleaner now and easier to maintain.

> 
> V1: https://lore.kernel.org/all/20210917094740.18891-1-sinthu.raja@ti.com/
> 
>  .../bindings/hwlock/ti,omap-hwspinlock.yaml   | 32 +------------------
>  1 file changed, 1 insertion(+), 31 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> index ae1b37dbee75..4feebd90bff1 100644
> --- a/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> +++ b/Documentation/devicetree/bindings/hwlock/ti,omap-hwspinlock.yaml
> @@ -40,38 +40,8 @@ examples:
>  
>    - |
>      /* OMAP4 SoCs */

^^ Drop this?
> -    hwspinlock: spinlock@4a0f6000 {
> +    spinlock@4a0f6000 {
>          compatible = "ti,omap4-hwspinlock";
>          reg = <0x4a0f6000 0x1000>;
>          #hwlock-cells = <1>;
>      };
> -
> -  - |
> -    / {
> -        /* K3 AM65x SoCs */
> -        model = "Texas Instruments K3 AM654 SoC";
> -        compatible = "ti,am654-evm", "ti,am654";
> -        #address-cells = <2>;
> -        #size-cells = <2>;
> -
> -        bus@100000 {
> -            compatible = "simple-bus";
> -            #address-cells = <2>;
> -            #size-cells = <2>;
> -            ranges = <0x00 0x00100000 0x00 0x00100000 0x00 0x00020000>, /* ctrl mmr */
> -                     <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>; /* Main NavSS */
> -
> -            bus@30800000 {
> -                compatible = "simple-mfd";
> -                #address-cells = <2>;
> -                #size-cells = <2>;
> -                ranges = <0x00 0x30800000 0x00 0x30800000 0x00 0x0bc00000>;
> -
> -                spinlock@30e00000 {
> -                    compatible = "ti,am654-hwspinlock";
> -                    reg = <0x00 0x30e00000 0x00 0x1000>;
> -                    #hwlock-cells = <1>;
> -                };
> -            };
> -        };
> -    };
> -- 
> 2.31.1
> 


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D)/Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
