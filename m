Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.5 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_PATCH,MAILING_LIST_MULTI,NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 38ACAC433E0
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 22:08:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 0563F64F53
	for <linux-remoteproc@archiver.kernel.org>; Thu, 18 Mar 2021 22:08:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231327AbhCRWHi (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 18 Mar 2021 18:07:38 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:53404 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230333AbhCRWHY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 18 Mar 2021 18:07:24 -0400
Received: from fllv0034.itg.ti.com ([10.64.40.246])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 12IM7IiH106961;
        Thu, 18 Mar 2021 17:07:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1616105238;
        bh=ztNCF+OMohd2TNZKxQVD0EjhzEjZAk4hF1EvS6YyM/w=;
        h=Subject:To:CC:References:From:Date:In-Reply-To;
        b=Zh5qoXFtE+PmokW9Xhu/zv2/Oik3hw5JmawrQek32xc5CSWsZb48rq5Zn7cetF/G7
         0NtiuyBQToAYu0jl07M2ef/9cGjtbo9sIRwxbSa16O1rZASTdFDxu7q9EZ3lGniLuA
         P5GqqDWUkENoIM7ECNSsuZAe+TlTgHFr4XVExcLQ=
Received: from DLEE105.ent.ti.com (dlee105.ent.ti.com [157.170.170.35])
        by fllv0034.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 12IM7IUA059592
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Thu, 18 Mar 2021 17:07:18 -0500
Received: from DLEE106.ent.ti.com (157.170.170.36) by DLEE105.ent.ti.com
 (157.170.170.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Thu, 18
 Mar 2021 17:07:18 -0500
Received: from lelv0327.itg.ti.com (10.180.67.183) by DLEE106.ent.ti.com
 (157.170.170.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Thu, 18 Mar 2021 17:07:18 -0500
Received: from [10.250.32.139] (ileax41-snat.itg.ti.com [10.172.224.153])
        by lelv0327.itg.ti.com (8.15.2/8.15.2) with ESMTP id 12IM7HPQ106345;
        Thu, 18 Mar 2021 17:07:17 -0500
Subject: Re: [PATCH 0/2] TI K3 R5F remoteproc support on AM46x SoCs
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>
CC:     Lokesh Vutla <lokeshvutla@ti.com>,
        <linux-remoteproc@vger.kernel.org>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>,
        <linux-kernel@vger.kernel.org>
References: <20210318215842.8196-1-s-anna@ti.com>
From:   Suman Anna <s-anna@ti.com>
Message-ID: <1759c728-6d13-ce5b-e052-681d437b55ad@ti.com>
Date:   Thu, 18 Mar 2021 17:07:12 -0500
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.10.0
MIME-Version: 1.0
In-Reply-To: <20210318215842.8196-1-s-anna@ti.com>
Content-Type: text/plain; charset="utf-8"
Content-Language: en-US
Content-Transfer-Encoding: 7bit
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 3/18/21 4:58 PM, Suman Anna wrote:
> Hi All,
> 
> The following series enhances the K3 R5F remoteproc driver to add support
> for the R5F clusters on the newer TI K3 AM64x SoC family. The AM64x SoCs
> have 2 R5FSS clusters and no DSPs. Both clusters are capable of supporting
> either the conventional Split-mode or a brand new "Single-CPU" mode.
> 
> The revised R5FSS IP has the following unique features:
>  1. The new Single-CPU mode allows the Core1 TCMs to be combined with
>     the Core0 TCMs effectively doubling the amount of TCMs available.
>     This is same behavior as LockStep-mode on J7200 SoCs, but all other
>     previous SoCs could only use the Core0 TCMs. This combined TCMs appear
>     contiguous at the respective Core0 TCM addresses.
>  2. TCMs are auto-initialized during module power-up, and the behavior
>     is programmable through a SEC_MMR register bit. This is same as on
>     J7200 SoCs, and is not present on earlier AM65x and J721E SoCs.
> 
> The series is based on 5.12-rc2, and can apply on top of the current
> rproc-next branch as well.

I had a small typo in the cover-letter subject line, should read "AM64x" instead
of "AM46x". Patches themselves use the correct term.

regards
Suman

> 
> regards
> Suman
> 
> Suman Anna (2):
>   dt-bindings: remoteproc: k3-r5f: Update bindings for AM64x SoCs
>   remoteproc: k3-r5: Extend support to R5F clusters on AM64x SoCs
> 
>  .../bindings/remoteproc/ti,k3-r5f-rproc.yaml  |  31 +++-
>  drivers/remoteproc/ti_k3_r5_remoteproc.c      | 155 ++++++++++++++----
>  2 files changed, 152 insertions(+), 34 deletions(-)
> 

