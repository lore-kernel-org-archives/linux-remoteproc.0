Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F31C3C001DC
	for <linux-remoteproc@archiver.kernel.org>; Sat, 15 Jul 2023 19:42:19 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S230027AbjGOTmS (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 15 Jul 2023 15:42:18 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36532 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229919AbjGOTmP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 15 Jul 2023 15:42:15 -0400
Received: from dfw.source.kernel.org (dfw.source.kernel.org [139.178.84.217])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 07556E6;
        Sat, 15 Jul 2023 12:42:15 -0700 (PDT)
Received: from smtp.kernel.org (relay.kernel.org [52.25.139.140])
        (using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
         key-exchange X25519 server-signature RSA-PSS (2048 bits))
        (No client certificate requested)
        by dfw.source.kernel.org (Postfix) with ESMTPS id 972D960C38;
        Sat, 15 Jul 2023 19:42:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BB4A0C433C9;
        Sat, 15 Jul 2023 19:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1689450134;
        bh=IF+T/s5UAKjpXNvKGf6rl0oLoeiOXXICDNa+0DHTd7Y=;
        h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
        b=edFc2azpmIiwIOubs0XWeGPfp5Mfs7+xV6k1LA5Ij4Dm1TVcE+Z2hfp4Vzn/fDCpL
         qMlQItqeQCGPaQ9ZHr8xfdndSXOGjQVcfXyyxAzN20SODjC1xFlf2VQOT66bjkDs3n
         FRRNHhvglKf/8AF4pLj24+jvjNM/KGA+gRtu8I3C/6mvAjxtWT07YDyskMxPe4wzFL
         Riy/eV5v9DpRtzmfzXZzNUPqWGzuBX/xmNBNMzdRFUohuB4qMDsnF3DXw+SpGrmT2v
         1NnEdiiiZx/ofU6/Aztd9fZm3uQxGoVAAwo1jzkhmpGijV7n8DKYcciJjpIr7FZhOi
         TjjliWBm+ilMQ==
From:   Bjorn Andersson <andersson@kernel.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Shawn Guo <shawnguo@kernel.org>,
        Sascha Hauer <s.hauer@pengutronix.de>,
        Pengutronix Kernel Team <kernel@pengutronix.de>,
        Fabio Estevam <festevam@gmail.com>,
        NXP Linux Team <linux-imx@nxp.com>,
        Andy Gross <agross@kernel.org>,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Patrice Chotard <patrice.chotard@foss.st.com>,
        Maxime Coquelin <mcoquelin.stm32@gmail.com>,
        Alexandre Torgue <alexandre.torgue@foss.st.com>,
        Rob Herring <robh@kernel.org>
Cc:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-stm32@st-md-mailman.stormreply.com
Subject: Re: [PATCH] remoteproc: Explicitly include correct DT includes
Date:   Sat, 15 Jul 2023 12:45:36 -0700
Message-ID: <168945033418.1736171.1897129444572615793.b4-ty@kernel.org>
X-Mailer: git-send-email 2.41.0
In-Reply-To: <20230714174935.4063513-1-robh@kernel.org>
References: <20230714174935.4063513-1-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


On Fri, 14 Jul 2023 11:49:33 -0600, Rob Herring wrote:
> The DT of_device.h and of_platform.h date back to the separate
> of_platform_bus_type before it as merged into the regular platform bus.
> As part of that merge prepping Arm DT support 13 years ago, they
> "temporarily" include each other. They also include platform_device.h
> and of.h. As a result, there's a pretty much random mix of those include
> files used throughout the tree. In order to detangle these headers and
> replace the implicit includes with struct declarations, users need to
> explicitly include the correct includes.
> 
> [...]

Applied, thanks!

[1/1] remoteproc: Explicitly include correct DT includes
      commit: 3440d8da79ba983330457b2400b15e7b1b002ac3

Best regards,
-- 
Bjorn Andersson <andersson@kernel.org>
