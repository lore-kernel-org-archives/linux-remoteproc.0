Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 68B98C5519F
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:08 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 00FFF246B8
	for <linux-remoteproc@archiver.kernel.org>; Wed, 18 Nov 2020 14:30:07 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="QyJh500B"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726625AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Received: from mail.kernel.org ([198.145.29.99]:54818 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726274AbgKROaH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 18 Nov 2020 09:30:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1605709806;
        bh=DzKR1IxBRNfFBbKVrcp2FVgVkU5IPdafjLYH0S1jCdU=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=QyJh500BUFEh/0wYZrUl8T1a0GZ76hDqyXQmAEfk8DbyfoaWapwww20XfN6YFbazW
         FtJpSZ47HJ8+mJQMUejw9+oL66a1Y8+A7QNKiDgdyiKXDCD/FBA2Cjw+k60fnPE0LL
         ulPNTLPPlIaWLBdFkoChM5oIrLbZdG4NIdvI8bXA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH] remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160570980679.9988.5941145137372650117.git-patchwork-notify@kernel.org>
Date:   Wed, 18 Nov 2020 14:30:06 +0000
References: <20201102143433.143996-1-zhangqilong3@huawei.com>
In-Reply-To: <20201102143433.143996-1-zhangqilong3@huawei.com>
To:     Zhang Qilong <zhangqilong3@huawei.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 2 Nov 2020 22:34:33 +0800 you wrote:
> If the pm_runtime_get_sync failed in q6v5_pds_enable when
> loop (i), The unroll_pd_votes will start from (i - 1), and
> it will resulted in following problems:
> 
>   1) pm_runtime_get_sync will increment pm usage counter even it
>      failed. Forgetting to pm_runtime_put_noidle will result in
>      reference leak.
> 
> [...]

Here is the summary with links:
  - remoteproc: q6v5-mss: fix error handling in q6v5_pds_enable
    https://git.kernel.org/andersson/remoteproc/c/feb691e11283

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


