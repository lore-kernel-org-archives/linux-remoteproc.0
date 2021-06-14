Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-16.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8F083C48BE8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 21:00:04 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6CF47601FC
	for <linux-remoteproc@archiver.kernel.org>; Mon, 14 Jun 2021 21:00:04 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S234950AbhFNVCH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 14 Jun 2021 17:02:07 -0400
Received: from mail.kernel.org ([198.145.29.99]:50482 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S234397AbhFNVCG (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 14 Jun 2021 17:02:06 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id 66B196124B;
        Mon, 14 Jun 2021 21:00:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1623704403;
        bh=GnON8esteUQABQZndbfjtsk4poS310epKkCnvSKTYv8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qVhy8b293j54Fnv9yFUx9xItN2iOs47DMGHFs2xy0I4v1CeSvb34jxj49jt9vyySE
         Pvd13pKojT1syF+ywnP6QXhPpgka00rPxsgYxwtZZltXZHktPYpgl8CWQGkVdvRA4x
         KhXE10i2UNrEBog8FfWl8F1M9IbCIsatKL2/80iQBnRLo03gE9LWT03u7EI3Wm5ica
         8Ki2S77E5JHw0+Q/bf8xKq4yzu2z+NIrxgxRjKOvY7Fl3WpxG/Ohu2SroA952gnfrY
         sjhPADPJUnh/PnV8lf/ZVP1UCPxHkw27LSadP+jMFRyKPogUZFAvYGXVvasNgLgmV2
         UF/+VcBkI2FBw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [RFC PATCH] dt-bindings: hwlock: sun6i: Fix various warnings in
 binding
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <162370440337.11696.14690406687110243826.git-patchwork-notify@kernel.org>
Date:   Mon, 14 Jun 2021 21:00:03 +0000
References: <20210603144216.10327-1-s-anna@ti.com>
In-Reply-To: <20210603144216.10327-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Thu, 3 Jun 2021 09:42:16 -0500 you wrote:
> The allwinner,sun6i-a31-hwspinlock.yaml binding has a mismatched
> $id and fails to compile the example due to undefined args specifier
> values for clocks and resets. Fix both of these issues.
> 
> Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock")
> Signed-off-by: Suman Anna <s-anna@ti.com>
> 
> [...]

Here is the summary with links:
  - [RFC] dt-bindings: hwlock: sun6i: Fix various warnings in binding
    https://git.kernel.org/andersson/remoteproc/c/234462bc7f23

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


