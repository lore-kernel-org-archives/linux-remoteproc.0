Return-Path: <SRS0=eTbm=EJ=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DBABC00A89
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 00:50:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1E84E2225E
	for <linux-remoteproc@archiver.kernel.org>; Tue,  3 Nov 2020 00:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1604364608;
	bh=vfY32RrC6dKgBn8wdaUREf0JRc1lfqO67ztX0ln8VjM=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=YXJCoiLI9KXuWNmgKdqGd/yGquCnymL/K1C/0jmrwxDIj0jm17lD0NDZ+MquH5RJS
	 aHoaDvc5GIq7Ba9fV+PICGDe4MA1eSNYAWT7oWZcorP4+jqCRSyMC7WUH2c3T0aKib
	 bKctpt9uoEE0bOzwNTBO5chLu1j/QeqRON+2NbBA=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726076AbgKCAuH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 2 Nov 2020 19:50:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:57048 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725914AbgKCAuH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 2 Nov 2020 19:50:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1604364607;
        bh=vfY32RrC6dKgBn8wdaUREf0JRc1lfqO67ztX0ln8VjM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=G10YgQEdjasUIak0+EhWTo7zcTLsxBcFrzXmtzb7kW5bQam1wd4EqNuIjyrl53/4p
         BJcI9NsKOYb8qldbDa2EQxgrV3yyYeJiZJqgvoXdSPhlrdVA9JmzaIZP6PlHUDyWjg
         O5bh9Zsp7JWhlZ+rCBpRvC8VffydrO/Sm9q+9l2Q=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: ti_k3: fix -Wcast-function-type warning
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160436460737.9872.15501636847666964335.git-patchwork-notify@kernel.org>
Date:   Tue, 03 Nov 2020 00:50:07 +0000
References: <20201026160533.3705998-1-arnd@kernel.org>
In-Reply-To: <20201026160533.3705998-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 26 Oct 2020 17:05:23 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The function cast causes a warning with "make W=1"
> 
> drivers/remoteproc/ti_k3_r5_remoteproc.c: In function 'k3_r5_probe':
> drivers/remoteproc/ti_k3_r5_remoteproc.c:1368:12: warning: cast between incompatible function types from 'int (*)(struct platform_device *)' to 'void (*)(void *)' [-Wcast-function-type]
> 
> [...]

Here is the summary with links:
  - remoteproc: ti_k3: fix -Wcast-function-type warning
    https://git.kernel.org/andersson/remoteproc/c/2316822989a3

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


