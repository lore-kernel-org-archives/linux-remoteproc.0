Return-Path: <SRS0=Z/7o=6H=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 4E7A4C2BA19
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2D74F208E4
	for <linux-remoteproc@archiver.kernel.org>; Thu, 23 Apr 2020 06:40:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1587624004;
	bh=o7lVMWLd06E++HZlhmT6O+UhQrxTj7uc2+LQ+JF8hOc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=ryqXCpCNITTqgS4jcyg2mPmdtGu1t1K2ZnFleCUdP6UuFET9DYhd7HXRUOwXuLJKU
	 ArS7lrrwJUaD6jAxQd8BARMe45KV0AkU3mldVWUHvx1MfsMIzNv4YpNEs3mlYJzTrX
	 QPYl2izsExuEnegTeLwdA4qJO/JjRnVb2p1W/Bzc=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726358AbgDWGkE (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 23 Apr 2020 02:40:04 -0400
Received: from mail.kernel.org ([198.145.29.99]:44136 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725562AbgDWGkD (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 23 Apr 2020 02:40:03 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1587624003;
        bh=o7lVMWLd06E++HZlhmT6O+UhQrxTj7uc2+LQ+JF8hOc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=zeo8fTpLVb2WBHyS+ImvDxt21FuC4xAzhAkftyvXO1nD3iMRIupeDlhL1MuWU0Mdf
         FeVJsqkzz6hP2LTLXwm47gV9dQe67KNxgGputjuUsXhM6LrU45jpI+lm34P2TDU2fG
         CEm92JbgjdeNGyrYZGCwhHXJkitBuQ/OW8WfGyeU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] remoteproc: remove rproc_elf32_sanity_check
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158762400317.14545.10345691965160050179.git-patchwork-notify@kernel.org>
Date:   Thu, 23 Apr 2020 06:40:03 +0000
References: <20200422093017.10985-1-cleger@kalray.eu>
In-Reply-To: <20200422093017.10985-1-cleger@kalray.eu>
To:     Clement Leger <cleger@kalray.eu>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 22 Apr 2020 11:30:17 +0200 you wrote:
> Since checks are present in the remoteproc elf loader before calling
> da_to_va, loading a elf64 will work on 32bits flavors of kernel.
> Indeed, if a segment size is larger than what size_t can hold, the
> loader will return an error so the functionality is equivalent to
> what exists today.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> 
> [...]


Here is a summary with links:
  - [v3] remoteproc: remove rproc_elf32_sanity_check
    https://git.kernel.org/andersson/remoteproc/c/e29ff72b779426c7fe462ead93c7ad77fe562935

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
