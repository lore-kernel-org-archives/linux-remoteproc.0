Return-Path: <SRS0=BznH=7C=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 7D9CEC433E2
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 20:00:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5B10120823
	for <linux-remoteproc@archiver.kernel.org>; Wed, 20 May 2020 20:00:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1590004806;
	bh=Q8wWuJKzXyKAR+W12JNisHLVE0Tvd8zbOkSaNvz/TBw=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=mnfP8YLZoKECEnfIXHxorDGzsbFEFLLpAG6lFMp9V/wmA3rFqkolGYkOB4G3rBcOd
	 ZKhw/GCRgK9rlFkGcijIppsEiIS4x4HjRUMuetR+A3gJFwa8N+ScfZ7Y79wMOoaDJ2
	 ryyU7a1l3zVsk4/dH99OVs7d+Uq/Uhoj9l0n/rzA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727075AbgETUAF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 20 May 2020 16:00:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:55750 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727853AbgETUAD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 20 May 2020 16:00:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1590004802;
        bh=Q8wWuJKzXyKAR+W12JNisHLVE0Tvd8zbOkSaNvz/TBw=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=nJ92LsHnXYtmI8RQNRuGUcW9vnJCLsA6z/BQ6k/WqFOGsGvtvOde2O7nrw208YPRv
         wnGQ1mp+IEPnlATwKZCPP23W3iRXfWToFyQz13afxxxn/EOYaXi8xNb5x+/4y3s87J
         SlaNvWYZi6gCOaWSuFB98Zwbgo7ArHAxHWzDXfMM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: Fix an error code in devm_rproc_alloc()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159000480293.7822.6168842816579552600.git-patchwork-notify@kernel.org>
Date:   Wed, 20 May 2020 20:00:02 +0000
References: <20200520120705.GH172354@mwanda>
In-Reply-To: <20200520120705.GH172354@mwanda>
To:     Dan Carpenter <dan.carpenter@oracle.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 20 May 2020 15:07:05 +0300 you wrote:
> The comments say that this function should return NULL on error and the
> caller expects NULL returns as well so I have modified the code to match.
> Returning an ERR_PTR(-ENOMEM) would lead to an OOps.
> 
> Fixes: 305ac5a766b1 ("remoteproc: Add device-managed variants of rproc_alloc/rproc_add")
> Signed-off-by: Dan Carpenter <dan.carpenter@oracle.com>
> 
> [...]


Here is a summary with links:
  - remoteproc: Fix an error code in devm_rproc_alloc()
    https://git.kernel.org/andersson/remoteproc/c/7dcef3988eedbfb40e7e95a821966a029a5a465b

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
