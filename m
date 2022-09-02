Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5E980C6FA81
	for <linux-remoteproc@archiver.kernel.org>; Fri,  2 Sep 2022 17:26:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236587AbiIBR0G (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 2 Sep 2022 13:26:06 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:44946 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234495AbiIBR0F (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 2 Sep 2022 13:26:05 -0400
Received: from ams.source.kernel.org (ams.source.kernel.org [145.40.68.75])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6FCC258B44;
        Fri,  2 Sep 2022 10:26:04 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ams.source.kernel.org (Postfix) with ESMTPS id 22980B82CBE;
        Fri,  2 Sep 2022 17:26:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82C9C43142;
        Fri,  2 Sep 2022 17:26:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1662139561;
        bh=Se+I02gEhyXCqeTHHuUDXwx8mkIp6MEIWCCZx8JwIR0=;
        h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
        b=Z3lH6cGF2yz9uDF+qMhwjTZI1SdoQz3Zrqzie/wY9vkYSDuQNIukJ3mUgXYHyB2Vs
         HY5HTxvXP8dqrO4d8U9fLyN3Xav5UNQj/3Q8UMDhjFWnNWyA92Dvy28d6QTHXrwbmT
         YxTWiT6sHSsb7mmgD94UZ9hUkruM5jctWNcqcbOUXmn7ztzAp+lh8mas39mIfkog5M
         6uPhDiWi36JPnjbuxmOHP89aovkSc2bKa9J20wzt4ZD6ZcUUPICTs2b+n7rTyCC3Bj
         S46qf4yXwLDPpFLheZ+rf6XuvzyHdI74hHEX5+8tcp5jBYMYEBvUiKTSPWQ5BE9O5+
         1q6bB9zcC48HQ==
Date:   Fri, 2 Sep 2022 22:55:56 +0530
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
Subject: Re: [PATCH 1/4] dt-bindings: phy: hisilicon,hi3660-usb3: simplify
 example
Message-ID: <YxI8pHOjxhgNHNh7@matsya>
References: <20220817142246.828762-1-krzysztof.kozlowski@linaro.org>
 <20220817142246.828762-2-krzysztof.kozlowski@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220817142246.828762-2-krzysztof.kozlowski@linaro.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 17-08-22, 17:22, Krzysztof Kozlowski wrote:
> syscon and simple-mfd cannot be used without device specific compatible,
> so simplify the example to fix this.

Acked-By: Vinod Koul <vkoul@kernel.org>

-- 
~Vinod
