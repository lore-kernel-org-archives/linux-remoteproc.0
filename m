Return-Path: <linux-remoteproc-owner@vger.kernel.org>
Received: from mail.kernel.org ([198.145.29.99]:57802 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726279AbfKUSUE (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 21 Nov 2019 13:20:04 -0500
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: Fix wrong rvring index computation
From: patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <157436040385.16867.4327217983966443610.git-patchwork-notify@kernel.org>
Date: Thu, 21 Nov 2019 18:20:03 +0000
References: <20191004073736.8327-1-cleger@kalray.eu>
In-Reply-To: <20191004073736.8327-1-cleger@kalray.eu>
Sender: linux-remoteproc-owner@vger.kernel.org
To: Clement Leger <cleger@kalray.eu>
Cc: linux-remoteproc@vger.kernel.org
List-ID: <linux-remoteproc@vger.kernel.org>

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next).

On Fri,  4 Oct 2019 09:37:36 +0200 you wrote:
> Index of rvring is computed using pointer arithmetic. However, since
> rvring->rvdev->vring is the base of the vring array, computation
> of rvring idx should be reversed. It previously lead to writing at negative
> indices in the resource table.
> 
> Signed-off-by: Clement Leger <cleger@kalray.eu>
> 
> [...]


Here is a summary with links:
  - remoteproc: Fix wrong rvring index computation
    https://git.kernel.org/andersson/remoteproc/c/00a0eec59ddbb1ce966b19097d8a8d2f777e726a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
