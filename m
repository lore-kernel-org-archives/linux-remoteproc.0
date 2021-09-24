Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F248AC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 16:11:02 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D69336124B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 24 Sep 2021 16:11:02 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236860AbhIXQMe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 24 Sep 2021 12:12:34 -0400
Received: from fllv0015.ext.ti.com ([198.47.19.141]:54652 "EHLO
        fllv0015.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233752AbhIXQM0 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 24 Sep 2021 12:12:26 -0400
Received: from fllv0035.itg.ti.com ([10.64.41.0])
        by fllv0015.ext.ti.com (8.15.2/8.15.2) with ESMTP id 18OGAhPV102811;
        Fri, 24 Sep 2021 11:10:43 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1632499843;
        bh=9Pop6oXiHVPFX2sciva/YG9DSuUyCmsf/YRPoCW7xjw=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=YtkIYS+011vlOBa52SP5+7lT3ZV6uxBHBh5TXBo5GPudnXjq/+jPcqyl4vJg79BQr
         CtTOA1OwZ/WEZt13z3y5+eAUC8Q4qOnQzRHBdyZ2Vt6DtYCbcBeQr/DxXpPSa2g0CE
         CTEj+m9arI82s79NY60Yjt1Oc3mKDOFCxwPO87nw=
Received: from DFLE106.ent.ti.com (dfle106.ent.ti.com [10.64.6.27])
        by fllv0035.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 18OGAhNF116842
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 24 Sep 2021 11:10:43 -0500
Received: from DFLE106.ent.ti.com (10.64.6.27) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14; Fri, 24
 Sep 2021 11:10:42 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DFLE106.ent.ti.com
 (10.64.6.27) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2308.14 via
 Frontend Transport; Fri, 24 Sep 2021 11:10:42 -0500
Received: from [10.250.37.219] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 18OGAglw000461;
        Fri, 24 Sep 2021 11:10:42 -0500
Subject: Re: [PATCH V3 2/2] dt-bindings: remoteproc: k3-dsp: Remove
 board-specific compatible from DT example
To:     Sinthu Raja <sinthu.raja@mistralsolutions.com>,
        Rob Herring <robh+dt@kernel.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>
CC:     <linux-kernel@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-remoteproc@vger.kernel.org>, Nishanth Menon <nm@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>,
        "Nagalla, Hari" <hnagalla@ti.com>
References: <20210917095426.19277-1-sinthu.raja@ti.com>
 <20210917095426.19277-3-sinthu.raja@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <4d43e927-3998-e9a9-87a6-6036b769a975@ti.com>
Date:   Fri, 24 Sep 2021 11:10:42 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:78.0) Gecko/20100101
 Thunderbird/78.13.0
MIME-Version: 1.0
In-Reply-To: <20210917095426.19277-3-sinthu.raja@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hi Sinthu,

On 9/17/21 4:54 AM, Sinthu Raja wrote:
> From: Sinthu Raja <sinthu.raja@ti.com>
> 
> The example includes a board-specific compatible property, this is
> wrong as the example should be board agnostic and gets in the way of
> additions for newer platforms. Replace the same with a generic soc
> node.

What board specific property? This description looks wrong.

> 
> Fixes: 2a2180206ab6 ("dt-bindings: remoteproc: Add bindings for C66x DSPs on TI K3 SoCs")

What error are you trying to fix exactly? The example used below is actually how
it exactly appears in the J721E dts files, and there are no errors with
dt_binding_check.

This is more a cleanup than a fix.  You can look through the original binding
submission patches to see why it is done like this.

If this is triggered by the changes you are making to k3.yaml file as part of
the J721E EAIK changes, then you probably may want to look at how you are doing
that again. Looks like the k3.yaml file is being modified now to enforce
"board-compatible", "soc-compatible" which may have triggered an error in this file.

Please evaluate if you need to modify it to support just the "soc-compatible" as
one of the items.


> Signed-off-by: Sinthu Raja <sinthu.raja@ti.com>
> ---
> 
> Changes since V2:
> * review comment updates, including simplifying the changes, commit
>   message and $subject updates.
> 
> V2: https://lore.kernel.org/all/20210818074030.1877-1-sinthu.raja@ti.com/
> V1: https://lore.kernel.org/all/20210817152005.21575-1-sinthu.raja@ti.com/
> 
>  .../devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml       | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> index 6070456a7b67..5ec6505ac408 100644
> --- a/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml
> @@ -133,9 +133,7 @@ unevaluatedProperties: false
>  
>  examples:
>    - |
> -    / {
> -        model = "Texas Instruments K3 J721E SoC";
> -        compatible = "ti,j721e";
> +    soc {

While this may be resolving the dt_bindings_check you might be seeing with the
modified k3.yaml, note that "soc" property is not used on K3 dts files, you
might be creating confusion for people who look at this example and the actual
usage.

regards
Suman

>          #address-cells = <2>;
>          #size-cells = <2>;
>  
> 

