Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EB65AC4361B
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:10:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id BB48C2388D
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726733AbgLGUKr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Dec 2020 15:10:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39642 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1725879AbgLGUKq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Dec 2020 15:10:46 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607371806;
        bh=tXebTqbgX0dwje1h67EVKJldoI6Yo5yhvwDt+jk/f74=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=e7oFgu0cWob4NKRPJY4ZM3I62hTyrxgJ0XG2HozN5w9m3mQlpXTeLsypAgMUDVswN
         sj2mWAqo7PNaUceqWe4zk/HdYmDmlBWPWHKiVaFh5z+kbvIHTebL0mwFvvVztNggwa
         is09t/aUxrfMFY4KBY8qWKl8V9c4uwM62SySqjt/gk858B+O3dDLcdLiDQ8SyA61Jh
         TrmyvqgY/ArqbRB5CRXyL2u3qPYtifaltLHI/XfEKbgeiI41iyOq3n5LMT/bXgCoSE
         xAG8WQipR3zcUbTL6f84rvkyhBg5+pMZ1IdiPHiUgKnfVHFDRg54kz2b2Cr0DUOuUN
         0hmPL24EStGaQ==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: sysmon: fix shutdown_acked state
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160737180619.4672.16101646874828308886.git-patchwork-notify@kernel.org>
Date:   Mon, 07 Dec 2020 20:10:06 +0000
References: <20201204193740.3162065-1-arnd@kernel.org>
In-Reply-To: <20201204193740.3162065-1-arnd@kernel.org>
To:     Arnd Bergmann <arnd@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri,  4 Dec 2020 20:37:35 +0100 you wrote:
> From: Arnd Bergmann <arnd@arndb.de>
> 
> The latest version of sysmon_stop() starts by initializing
> the sysmon->shutdown_acked variable, but then overwrites it
> with an uninitialized variable later:
> 
> drivers/remoteproc/qcom_sysmon.c:551:11: error: variable 'acked' is used uninitialized whenever 'if' condition is false [-Werror,-Wsometimes-uninitialized]
>         else if (sysmon->ept)
>                  ^~~~~~~~~~~
> drivers/remoteproc/qcom_sysmon.c:554:27: note: uninitialized use occurs here
>         sysmon->shutdown_acked = acked;
>                                  ^~~~~
> 
> [...]

Here is the summary with links:
  - remoteproc: sysmon: fix shutdown_acked state
    https://git.kernel.org/andersson/remoteproc/c/9d7b4a40387d

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


