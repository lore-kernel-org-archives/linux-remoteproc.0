Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7AB90C4167B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 28 Dec 2022 18:18:56 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232778AbiL1SSy (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 28 Dec 2022 13:18:54 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55258 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233363AbiL1SSi (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 28 Dec 2022 13:18:38 -0500
Received: from dfw.source.kernel.org (dfw.source.kernel.org [IPv6:2604:1380:4641:c500::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B21C175B4;
        Wed, 28 Dec 2022 10:18:38 -0800 (PST)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id DDF4261582;
        Wed, 28 Dec 2022 18:18:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 96FA2C433EF;
        Wed, 28 Dec 2022 18:18:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1672251517;
        bh=uUVGWuZiaQOKU09yyOgoE6OKa2WCSHqNWbzCAny96FU=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=p86R2ZSD8gJHyYiWUkR96BFMTCWeYAL7LgstvOr1L8f40CZx+RrFt5buA9gtUs+NH
         +iXsFYz+pJ2EOR73lj3wUX+y5FVal7ILJpYcboLDc+tdfIoVWT4A3u2a7dKH48WP4O
         FQlxFi2noCMZQsotrOi6BNQUGFevhaGDxgiqWreHMbeLJ6m7K9U2i8dnuePfl+7uP9
         WM2ybNEdVIvFxgTxXLfRzuj9CRGV0/oPk76LThe0SFwkmpJOD4gi2Kel89oIgAlibj
         mn3d3RKulM4AXIW4wT8KhXkzQV5R37NG1RZ+ZgXe97mXjnfTwOWKrlRjYsyLOO78SE
         aEtnlfgJe6Xug==
From:   Bjorn Andersson <andersson@kernel.org>
To:     mathieu.poirier@linaro.org, abel.vesa@linaro.org,
        Bjorn Andersson <andersson@kernel.org>,
        konrad.dybcio@somainline.org, agross@kernel.org
Cc:     linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH v2] remoteproc: qcom: q6v5: Use _clk_get_optional for aggre2_clk
Date:   Wed, 28 Dec 2022 12:18:26 -0600
Message-Id: <167225151223.950465.14429804095591076576.b4-ty@kernel.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220718121514.2451590-1-abel.vesa@linaro.org>
References: <20220718121514.2451590-1-abel.vesa@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 18 Jul 2022 15:15:14 +0300, Abel Vesa wrote:
> Only msm8996 and msm8998 SLPIs need the RPM_SMD_AGGR2_NOC_CLK
> (as aggre2 clock). None of the other platforms do. Back when the support
> for the mentioned platforms was added to the q6v5 pass driver, the
> devm_clk_get_optional was not available, so the has_aggre2_clk was
> necessary in order to differentiate between plaforms that need this
> clock and those which do not. Now that devm_clk_get_optional is available,
> we can drop the has_aggre2_clk. This makes the adsp_data more cleaner
> and removes the check within adsp_init_clocks.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: q6v5: Use _clk_get_optional for aggre2_clk
      commit: 6d967a5a49e8d08d8e4430aadba8d3c903b794a5

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
