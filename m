Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3479FC4338F
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:34 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1F43161157
	for <linux-remoteproc@archiver.kernel.org>; Fri, 20 Aug 2021 17:34:34 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234121AbhHTRfL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 20 Aug 2021 13:35:11 -0400
Received: from fllv0016.ext.ti.com ([198.47.19.142]:52150 "EHLO
        fllv0016.ext.ti.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230214AbhHTRfH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 20 Aug 2021 13:35:07 -0400
Received: from lelv0266.itg.ti.com ([10.180.67.225])
        by fllv0016.ext.ti.com (8.15.2/8.15.2) with ESMTP id 17KHYPNJ049520;
        Fri, 20 Aug 2021 12:34:25 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
        s=ti-com-17Q1; t=1629480865;
        bh=+XbcJSuY0Df5YiHO6GVZDgpFmgmiCulw8J/47/Y/D+c=;
        h=Date:From:To:CC:Subject:References:In-Reply-To;
        b=shzTvBNbFRg50mSuYv5C0Owp7va8nD3UGAwRerkH23vXN/YRUDdDf2vdQgHPDGO6I
         1MDX1AqJAL3s+QK6pdTMrrk0z1Z1xWvrXpfahSrPYSVqvrw/o2ffJQRlKJg9kWrDSL
         CCECW7EFErPGnMDesLS1dUQro1Yo0T2M4/N2pQWs=
Received: from DFLE102.ent.ti.com (dfle102.ent.ti.com [10.64.6.23])
        by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 17KHYPT8089880
        (version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
        Fri, 20 Aug 2021 12:34:25 -0500
Received: from DFLE105.ent.ti.com (10.64.6.26) by DFLE102.ent.ti.com
 (10.64.6.23) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2; Fri, 20
 Aug 2021 12:34:24 -0500
Received: from fllv0040.itg.ti.com (10.64.41.20) by DFLE105.ent.ti.com
 (10.64.6.26) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2176.2 via
 Frontend Transport; Fri, 20 Aug 2021 12:34:24 -0500
Received: from localhost (ileax41-snat.itg.ti.com [10.172.224.153])
        by fllv0040.itg.ti.com (8.15.2/8.15.2) with ESMTP id 17KHYOBc093956;
        Fri, 20 Aug 2021 12:34:24 -0500
Date:   Fri, 20 Aug 2021 12:34:24 -0500
From:   Nishanth Menon <nm@ti.com>
To:     Sinthu Raja M <sinthu.raja@mistralsolutions.com>
CC:     "Nagalla, Hari" <hnagalla@ti.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Rob Herring <robh+dt@kernel.org>, Suman Anna <s-anna@ti.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        <linux-remoteproc@vger.kernel.org>,
        Device Tree Mailing List <devicetree@vger.kernel.org>,
        <linux-kernel@vger.kernel.org>, Lokesh Vutla <lokeshvutla@ti.com>,
        Sinthu Raja <sinthu.raja@ti.com>
Subject: Re: [PATCH V1] dt-bindings: remoteproc: k3-dsp: Update example to
 remove board specific
Message-ID: <20210820173424.3cqqbhbw5cdmrbum@disrupt>
References: <20210818074030.1877-1-sinthu.raja@ti.com>
 <20210818130535.siv7jpjjzfwonwdt@unsteady>
 <CAEd-yTQgWLZUKPJQvByWfo3w=gNFLz=F6q6_oF_0WC7cRpZ6dw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="us-ascii"
Content-Disposition: inline
In-Reply-To: <CAEd-yTQgWLZUKPJQvByWfo3w=gNFLz=F6q6_oF_0WC7cRpZ6dw@mail.gmail.com>
User-Agent: NeoMutt/20171215
X-EXCLAIMER-MD-CONFIG: e1e8a2fd-e40a-4ac6-ac9b-f7e9cc9ee180
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 11:56-20210820, Sinthu Raja M wrote:
[...]

> May I know to which commit I have to tag the Fixes. If you are

git blame Documentation/devicetree/bindings/remoteproc/ti,k3-dsp-rproc.yaml ?

Look at the commit that introduced the original code that you are
fixing. In this case, 2a2180206ab62 perhaps?

[...]
> It didn't catch in my basic patch verification. But the generated
> patch does have the From header, but sometimes the From header is
> getting truncated when submitting for review. Still working on that to
> fix it. (using Gmail client to submitting the patch)


https://www.kernel.org/doc/html/v4.11/process/email-clients.html

"Gmail (Web GUI)

Does not work for sending patches.
"


-- 
Regards,
Nishanth Menon
Key (0xDDB5849D1736249D) / Fingerprint: F8A2 8693 54EB 8232 17A3  1A34 DDB5 849D 1736 249D
