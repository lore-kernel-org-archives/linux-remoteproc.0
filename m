Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B72C4C04FDF
	for <linux-remoteproc@archiver.kernel.org>; Sat, 15 Jul 2023 22:10:28 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230229AbjGOWK1 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 15 Jul 2023 18:10:27 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55972 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230190AbjGOWKY (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jul 2023 18:10:24 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 87C7F2733;
        Sat, 15 Jul 2023 15:10:22 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 0D88160C52;
        Sat, 15 Jul 2023 22:10:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99F87C433C7;
        Sat, 15 Jul 2023 22:10:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689459021;
        bh=7eCargfUvIrN4nLaCEXO3KoyF6n6It+cusxqjuCXXWg=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=nrUjU2JkXF41YbfJ5GuqPb0Zp8Zgh2kXvWCa+aiT6V5h98ICXdeBIpkzy4plhY5BR
         4W97SLouAo1Fz11KvnSpxtmWSGhplplx0kEBF9a5kwGglIQLDCbUBVqlCfMj1ckrMX
         KWzKkUu1fR0qrtWa7FzphjOtkm7No8Oe+57jzFbC9g30rM7eZpUMusIEK9kiNc7psu
         /GOzRLCWngRuN7+Wdckb3B6UGNO4v+M8QB4VLcSEK9ikvTqpdA5NW+NOzPtlGcklQH
         nGbT6eHg6IZgOuqLR3qldjSdrv2HMfN256iT7ZWB9fPDlEO8wcu8ZsA3gnrTFS+sIU
         ztVNOIJGlG7WA==
From:   Bjorn Andersson <andersson@kernel.org>
To:     lkp@intel.com, Kang Chen <void0red@gmail.com>
Cc:     agross@kernel.org, baolin.wang@linux.alibaba.com,
        konrad.dybcio@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
        ohad@wizery.com
Subject: Re: [PATCH v2] hwspinlock: add a check of devm_regmap_field_alloc in qcom_hwspinlock_probe
Date:   Sat, 15 Jul 2023 15:13:36 -0700
Message-ID: <168945921468.1805013.6112623773454199482.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230227004116.1273988-1-void0red@gmail.com>
References: <202302270034.DqtDwv49-lkp@intel.com> <20230227004116.1273988-1-void0red@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Mon, 27 Feb 2023 08:41:16 +0800, Kang Chen wrote:
> devm_regmap_field_alloc may fails, priv field might be error pointer and
> cause illegal address access later.
> 
> 

Applied, thanks!

[1/1] hwspinlock: add a check of devm_regmap_field_alloc in qcom_hwspinlock_probe
      commit: 3c81195a04e13833196462ab398d8bcf282701f7

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
