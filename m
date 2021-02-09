Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.6 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5D868C4332B
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:41:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 30F6B64EC8
	for <linux-remoteproc@archiver.kernel.org>; Tue,  9 Feb 2021 17:41:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233243AbhBIRlf (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 9 Feb 2021 12:41:35 -0500
Received: from mail.kernel.org ([198.145.29.99]:59658 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S233365AbhBIRkv (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 9 Feb 2021 12:40:51 -0500
Received: by mail.kernel.org (Postfix) with ESMTPS id F064F64E15;
        Tue,  9 Feb 2021 17:40:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1612892408;
        bh=TZlAa5+6wcouYskQioJR0/2V5lg283Gwd9ZBs5XrzlE=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=vLnXhKO6GizIGGVfivQ3yzT8aLZVJwOTtd5sMsvP0wXOAVJll8JcUD34Dgcw+0P9F
         W61tG12VqSPiPQFq+en3cadigW7vxq8th+zZChKRe7zpOWJGSysWG9W6HtGRPH9Jr9
         swu8I7DwaTCScbGmnSJfydC1E/Zv1jLIzwU3T4yeqSN3/IVtUNDYz2lVvJj9AWXClQ
         eNVF/bxpN3zv39J4qHWJKBHvGfeQoLc9bGv9gMVu7sYbTL8fPEWU3Y/iyWG6/WK78L
         YICkTQYMN0QK6Y8pefBPw6GjNXrbZ+NAMMhdyI5GJjftea38li7x3AD+x6On/jRcWB
         sl2e84WG+RLaw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3 0/4] remoteproc/mediatek: support L1TCM for MT8192 SCP
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161289240793.27941.5123530480508289882.git-patchwork-notify@kernel.org>
Date:   Tue, 09 Feb 2021 17:40:07 +0000
References: <20210127083136.3745652-1-tzungbi@google.com>
In-Reply-To: <20210127083136.3745652-1-tzungbi@google.com>
To:     Tzung-Bi Shih <tzungbi@google.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 27 Jan 2021 16:31:32 +0800 you wrote:
> The series applies after [1].
> 
> The series supports L1TCM which is a high performance memory region in
> MT8192 SCP.
> 
> The 1st patch replaces platform_get_resource_byname() and
> devm_ioremap_resource() pairs per [2] suggested.
> 
> [...]

Here is the summary with links:
  - [v3,1/4] remoteproc/mediatek: use devm_platform_ioremap_resource_byname
    https://git.kernel.org/andersson/remoteproc/c/2e88e8fcdfcd
  - [v3,2/4] remoteproc/mediatek: enable MPU for all memory regions in MT8192 SCP
    https://git.kernel.org/andersson/remoteproc/c/ff3ea536023e
  - [v3,3/4] dt-bindings: remoteproc: mediatek: add L1TCM memory region
    https://git.kernel.org/andersson/remoteproc/c/503c64cc42f1
  - [v3,4/4] remoteproc/mediatek: support L1TCM
    https://git.kernel.org/andersson/remoteproc/c/ca23ecfdbd44

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


