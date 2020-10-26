Return-Path: <SRS0=//YT=EB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id AAF7AC388F9
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 21:02:46 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 71AB820829
	for <linux-remoteproc@archiver.kernel.org>; Mon, 26 Oct 2020 21:02:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1603746166;
	bh=88ybdMt1/s1+R3SdP1GbHYAURRGIuKt3ilw6+ZjXYL0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=ml8njPToTvok1S7sk4CysKaex0YvnfAoBCmxMr/HVeVcQkkb/OrbnAt1Io51lvKuQ
	 g0lczMW1EI2ZZBH0NhBKKd1TMLGAOCPKlFz2ert2720rQe5bjQh3tjvmY7tZeCJbrQ
	 W8MzP4probpspZKdq7GE7a1FDmjZNbcCG5V5yVMk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729404AbgJZVCq (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 26 Oct 2020 17:02:46 -0400
Received: from mail.kernel.org ([198.145.29.99]:57004 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729417AbgJZVCp (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 26 Oct 2020 17:02:45 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1603746165;
        bh=88ybdMt1/s1+R3SdP1GbHYAURRGIuKt3ilw6+ZjXYL0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=XYeI0LyAwaT6X9TL0Jhhatmuw2vTrBCaDUBxgdTULyBB4URZ7+mgomapYHV+2cgUV
         nJWBoYuf+Rvi1dJuBKSAIFPvMkYdknRpRG0SIXgIIKvSv4pQEs2xZlcAV6eQ4O3K3c
         VEe2L029d1cPjo4DfJLYgfFTVKI+1czD0CiwY8T0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] dt-bindings: hwlock: omap: Fix warnings with k3.yaml
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160374616554.2093.16987400669461810285.git-patchwork-notify@kernel.org>
Date:   Mon, 26 Oct 2020 21:02:45 +0000
References: <20200928225155.12432-1-s-anna@ti.com>
In-Reply-To: <20200928225155.12432-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 28 Sep 2020 17:51:55 -0500 you wrote:
> Update the AM65x HwSpinlock example to fix couple of warnings
> that started showing up after the conversion of K3 bindings to
> YAML format in commit 66e06509aa37 ("dt-bindings: arm: ti:
> Convert K3 board/soc bindings to DT schema").
> 
>  compatible: ['ti,am654'] is not valid under any of the given schemas (Possible causes of the failure):
>  compatible: ['ti,am654'] is too short
>  compatible:0: 'ti,am654' is not one of ['ti,am654-evm']
> 
> [...]

Here is the summary with links:
  - [-next] dt-bindings: hwlock: omap: Fix warnings with k3.yaml
    https://git.kernel.org/andersson/remoteproc/c/891adc1303fe

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


