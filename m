Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C9492C2D0F9
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 06:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id ACDF52176D
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 06:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589350807;
	bh=x7Yif46mUAdBWv0gzEJytulU8vLmM4oBkknJOLMomB8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=UfYbCXz58r6cOri7637VhACE105WOjquiq/pCoKkUNYKvmdY1m36aFuhNDYVKWkJw
	 lUEP45bxoCH8aSUCzf+lUMN+lKENPrOFIedVsWrJnVXj1bISdhAht9DQ75G7QneojL
	 D47TXOb4o9AKYHi6rD/st4GK9Ta77XVFtO9/ufMY=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729140AbgEMGUH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 May 2020 02:20:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:43888 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728498AbgEMGUH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350806;
        bh=x7Yif46mUAdBWv0gzEJytulU8vLmM4oBkknJOLMomB8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=y+3x3eIFIFE9ldVfuNWm9zf2IVyY13giGEB27c/vg4vtim0suWcH50TnEMmWg241f
         QNCyC+KkpME1SCGSKtejOLUieO38j0RW6dfIDcY0e06YL+nQuXHcJYNgLd3RAg0fVE
         iUWITBObTdRH1VUX+HxODrRyoJkZcPHUGcrN9KB8=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] hwspinlock: Simplify Kconfig
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080668.26945.16633355722695042602.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:06 +0000
References: <20200414220943.6203-1-ezequiel@collabora.com>
In-Reply-To: <20200414220943.6203-1-ezequiel@collabora.com>
To:     Ezequiel Garcia <ezequiel@collabora.com>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 14 Apr 2020 19:09:43 -0300 you wrote:
> Every hwspinlock driver is expected to depend on the
> hwspinlock core, so it's possible to simplify the
> Kconfig, factoring out the HWSPINLOCK dependency.
> 
> Signed-off-by: Ezequiel Garcia <ezequiel@collabora.com>
> ---
>  drivers/hwspinlock/Kconfig | 10 ++++------
>  1 file changed, 4 insertions(+), 6 deletions(-)


Here is a summary with links:
  - hwspinlock: Simplify Kconfig
    https://git.kernel.org/andersson/remoteproc/c/7521f04dba1b6d36e069f8ea0c08a7e89dba7b50

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
