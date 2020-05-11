Return-Path: <SRS0=6wT4=6Z=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4DEB7C54E8D
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 May 2020 19:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 262F420720
	for <linux-remoteproc@archiver.kernel.org>; Mon, 11 May 2020 19:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589226004;
	bh=9FTehsZOfM6FNy04ijrYcFDZ0vJ9yYc487/MjviCXy4=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=V/bLqYRCiaQkpY2OGUaj5lV7iG8vxDl7+To0l0SjjAP/PPR43GELtl2SRafQBYrWS
	 qTqkl83Axi4sRCXNWSAnqKS/YArQBJvvVxFJkn/RkhSwXqXLsABWKEgBS6lpjRVtZi
	 C/gohpD0QJAILvInv9IhM1k/YqdksQ+HVOw/CqTQ=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1731337AbgEKTkE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 11 May 2020 15:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:58256 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1729453AbgEKTkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 11 May 2020 15:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589226003;
        bh=9FTehsZOfM6FNy04ijrYcFDZ0vJ9yYc487/MjviCXy4=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=s4WvALhZEFUxR2joCqmVKNHDQgaqmIVh6eR9+Uu8BJiLClMsDIurqe7NhZXUzuPLC
         lHIJzIGFVJPXfOhLiMvmL9GIdV8zGaE+e5wx6CIyAKgE2sWWAOr5dJcdoILkC9wiFr
         4TLOPgtjxbueATBV5nTAU3n8OrEVJ8rNUu2omXSM=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH -next] remoteproc/mediatek: fix invalid use of sizeof in
 scp_ipi_init()
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158922600353.30120.14049841001389518562.git-patchwork-notify@kernel.org>
Date:   Mon, 11 May 2020 19:40:03 +0000
References: <20200509084237.36293-1-weiyongjun1@huawei.com>
In-Reply-To: <20200509084237.36293-1-weiyongjun1@huawei.com>
To:     Wei Yongjun <weiyongjun1@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Sat, 9 May 2020 08:42:37 +0000 you wrote:
> sizeof() when applied to a pointer typed expression gives the
> size of the pointer, not that of the pointed data.
> 
> Fixes: 63c13d61eafe ("remoteproc/mediatek: add SCP support for mt8183")
> Reported-by: Hulk Robot <hulkci@huawei.com>
> Signed-off-by: Wei Yongjun <weiyongjun1@huawei.com>
> 
> [...]


Here is a summary with links:
  - [-next] remoteproc/mediatek: fix invalid use of sizeof in scp_ipi_init()
    https://git.kernel.org/andersson/remoteproc/c/8096f80a5c09b716be207eb042c4e40d6cdefbd2

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
