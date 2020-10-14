Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6B89FC433E7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 00:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1C46320776
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602634206;
	bh=DKoAPElv8St0YxRdtTo8ELLcCe58ZsHKJCuDwRPxgOY=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=OCAu/jw+ZjlqFCbkCjxRAioLawNzp7oSHVFacKlDs8KiolBqIJX6SZidMJbTOkm46
	 OKfJIvPNCQH2komUUKb/t1rMwOK62e70rVV++QcUph+WrK+NYqtmKx5aHFkCp+Uu5K
	 F+sMhrzDXqEpmGIsumI4KHGe9Zx1lyu9KoJLnc1Y=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726825AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47330 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727439AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=DKoAPElv8St0YxRdtTo8ELLcCe58ZsHKJCuDwRPxgOY=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=r+/l2BmHERvSIYhXN09hXb/PV0eHus19OHpWnESahmOQVikxlNu82lNBcyYyxDyGB
         pBaFmyEqYRlf/s1SZgORD7mSDI5VWBj+NvqdZJkACfPJYjXaWxYYRvceKlallowb3g
         LHjcjwmK++JH/XeDq+HtGO6LgLjYeK7gzRnYpy+E=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc/mediatek: fix null pointer dereference on null scp
 pointer
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420472.29882.481014245330242078.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20200918152428.27258-1-colin.king@canonical.com>
In-Reply-To: <20200918152428.27258-1-colin.king@canonical.com>
To:     Colin Ian King <colin.king@canonical.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 18 Sep 2020 16:24:28 +0100 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> Currently when pointer scp is null a dev_err is being called that
> references the pointer which is the very thing we are trying to
> avoid doing. Remove the extraneous error message to avoid this
> issue.
> 
> [...]

Here is the summary with links:
  - remoteproc/mediatek: fix null pointer dereference on null scp pointer
    https://git.kernel.org/andersson/remoteproc/c/434ac4d51407

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


