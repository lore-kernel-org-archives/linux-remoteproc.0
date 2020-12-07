Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-21.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED
	autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 07C04C433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:10:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D1F752389F
	for <linux-remoteproc@archiver.kernel.org>; Mon,  7 Dec 2020 20:10:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727062AbgLGUKr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Dec 2020 15:10:47 -0500
Received: from mail.kernel.org ([198.145.29.99]:39644 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726733AbgLGUKq (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Dec 2020 15:10:46 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1607371806;
        bh=g5Dysvuyl5H+MV0ClJHJlItnqzPdB+hTDGSRPCFK6wk=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=ZLa8oaJHDlWKyN45kSLhjbGas7EXSXfItE2DkNLn7juDxjO9ZsyZ/a5GWOvPV/01W
         Uxa7VSTpSLomdqq4LhrjN6f30ukfvLVC+fOXA4gIifHjYfdjg3E5eCtkN3wYwKZG+i
         sWgVGHsNgnakvrur/ev7WoRJJH6WjKBlJKD5e2TjFERA11BJwKGZWrIfh9hPg057bY
         BvJGSEAf/0x3OQiTVH6SlNFTiZIiCucHUlkNKIrU3ZJ2j3VqBoZcCBGdybScrhjS8c
         0MUDdOaI8tQJUk7vqiCPz2QN70IUXsx2LusJwcENrdQtdYtDvoOLjIxmLD4KTrs1eQ
         GXShzEKUNbgtw==
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: fix spelling mistake "Peripherial" ->
 "Peripherial" in Kconfig
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160737180624.4672.5768120935495093248.git-patchwork-notify@kernel.org>
Date:   Mon, 07 Dec 2020 20:10:06 +0000
References: <20201204193411.1152006-1-colin.king@canonical.com>
In-Reply-To: <20201204193411.1152006-1-colin.king@canonical.com>
To:     Colin King <colin.king@canonical.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri,  4 Dec 2020 19:34:11 +0000 you wrote:
> From: Colin Ian King <colin.king@canonical.com>
> 
> There is a spelling mistake in the Kconfig help text. Fix it.
> 
> Signed-off-by: Colin Ian King <colin.king@canonical.com>
> ---
>  drivers/remoteproc/Kconfig | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)

Here is the summary with links:
  - remoteproc: fix spelling mistake "Peripherial" -> "Peripherial" in Kconfig
    https://git.kernel.org/andersson/remoteproc/c/d247d1855aca

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


