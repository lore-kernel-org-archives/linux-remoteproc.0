Return-Path: <SRS0=Z/7o=6H=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 83BD2C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 64787208E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587624004;
	bh=hno9FuYuasF96baWOAzPQ+mp9xXtel/hiXPtRkOmEa8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=pgX9dSycs9YtW7u2aHHKznl/LvjpZKWtupBMNpQNetAL3Kp4tWr4fBXkggN75CAzH
	 eHrXiC5SVfE+64vffyLnbCRQTkRMQxG68pOW8vzXOspo7dg5DpRPCJ9P+K/9Isvlo2
	 D52ChQAbcGBG4r4NyOHa/wC/3fweuSPrfmHXDOQ4=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1725562AbgDWGkE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Apr 2020 02:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44142 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726346AbgDWGkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Apr 2020 02:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587624003;
        bh=hno9FuYuasF96baWOAzPQ+mp9xXtel/hiXPtRkOmEa8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=uKLVad+eEJthEjE9osEOlva0dktlQwD34Mqsk11sffevzhC3VMDeF95x664Pl/wVT
         IXEZGxcwhs1L4lJJXEPsaAu1OrozokaBLRbNhBm0SNOzBGGld2/UXEzf35z8jR3brW
         PvYKD1x6WdzaeOknF3xtzE/87jrYYZT/+VrxNZD4=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: Add missing '\n' in log messages
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158762400335.14545.11398415899895245807.git-patchwork-notify@kernel.org>
Date:   Thu, 23 Apr 2020 06:40:03 +0000
References: <20200411160750.32573-1-christophe.jaillet@wanadoo.fr>
In-Reply-To: <20200411160750.32573-1-christophe.jaillet@wanadoo.fr>
To:     Christophe JAILLET <christophe.jaillet@wanadoo.fr>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Sat, 11 Apr 2020 18:07:50 +0200 you wrote:
> Message logged by 'dev_xxx()' or 'pr_xxx()' should end with a '\n'.
> 
> Fixes: 791c13b709dd ("remoteproc: Fix NULL pointer dereference in rproc_virtio_notify")
> Signed-off-by: Christophe JAILLET <christophe.jaillet@wanadoo.fr>
> ---
>  drivers/remoteproc/remoteproc_virtio.c | 3 +--
>  1 file changed, 1 insertion(+), 2 deletions(-)


Here is a summary with links:
  - remoteproc: Add missing '\n' in log messages
    https://git.kernel.org/andersson/remoteproc/c/2fb75ceaf71a4a198fc67b984aa95527c993fa1a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
