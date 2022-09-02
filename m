Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B371C6FA82
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Sep 2022 17:26:21 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236687AbiIBR0T (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Sep 2022 13:26:19 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:45370 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235127AbiIBR0S (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:26:18 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [IPv6:2604:1380:4601:e00::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 88E3159278;
        Fri,  2 Sep 2022 10:26:17 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id EC5C8B82CC9;
        Fri,  2 Sep 2022 17:26:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 20B8AC433D6;
        Fri,  2 Sep 2022 17:26:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662139574;
        bh=Se+I02gEhyXCqeTHHuUDXwx8mkIp6MEIWCCZx8JwIR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=ii05UBBr4n1t7/4wvbt0XlM54gruE9+FA008cbxOHxCdiqZh4pDz89OpV6FDNozeq
         t/+CNXMgzQIvKrOMk3deXU41T3V5OI9QAxCviRpeFooUiSdSEwNP1yo1FpqidZWAjE
         3mTQ7OHyvQ6nUz5PFmbubjj6BSyR20YgpOEUKdZ1o0NNVtBgUs0TSSQyuzXB9tZpNB
         xJysIY/f2EQAX1JScQim6Pat9/4xRnjB1YISdT+impy7zpJFPBQj7RPw3d/BvQX5DZ
         mAFa+W7bij18qSiJHpv/urUbeolkx2JAp2+yrgJeFCJiKcHOg7Fuy93rfTui6Api23
         qSRGNnt02+iIQ==
Date:   Fri, 2 Sep 2022 22:56:10 +0530
From:   Vinod Koul <vkoul@kernel.org>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Lee Jones <lee@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Yu Chen <chenyu56@huawei.com>,
        Binghui Wang <wangbinghui@hisilicon.com>,
        Kishon Vijay Abraham I <kishon@ti.com>,
        Mauro Carvalho Chehab <mchehab@kernel.org>,
        Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Carvalho Chehab <mchehab+huawei@kernel.org>,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-usb@vger.kernel.org, linux-phy@lists.infradead.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 2/4] dt-bindings: phy: hisilicon,hi3670-usb3: simplify
 example
Message-ID: <YxI8svqIvOu837g3@matsya>
References: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
 <20220817142246.828762-3-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817142246.828762-3-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 17-08-22, 17:22, Krzysztof Kozlowski wrote:
> syscon and simple-mfd cannot be used without device specific compatible,
> so simplify the example to fix this.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
