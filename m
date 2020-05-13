Return-Path: <SRS0=SCme=63=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.3 required=3.0 tests=DKIMWL_WL_HIGH,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 376AFC2D0FD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 06:20:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 10A1F2312B
	for <linux-remoteproc@archiver.kernel.org>; Wed, 13 May 2020 06:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1589350807;
	bh=+u9WEjpzPO4IoooSANcJ+P0V+UNiaCRZlIA50MCmTAc=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=tOhHUfafI7D/+0T1HZiu/4rWbH2Oq5t2VLRDKSThWvjQKB27oYCs9h2PfETJ6RFec
	 Z6x8QJnkf7nhVGXBid92tLHPjVrXPICxymXaAfndSFWeabbdHR3Bh+bzxZpRzo169u
	 qUCa9EGaGlGPPnHyPQyoODyQzgJIwM5UJwqhZVgU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1729106AbgEMGUG (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 13 May 2020 02:20:06 -0400
Received: from mail.kernel.org ([198.145.29.99]:43872 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1728927AbgEMGUG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 13 May 2020 02:20:06 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1589350806;
        bh=+u9WEjpzPO4IoooSANcJ+P0V+UNiaCRZlIA50MCmTAc=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=lpnwDNNQpAikhU3MSn8Mt+d2uRsgHJrzamMxVnHrmsi1QIsLAMKDPF4lfINQpqKdo
         OPxqwxwrGwV5V3X5cREmsRQFiEePQT20hM/p8Ge9sSjXvGg0YNG9cgRkMrrJBN9QKN
         z9keavzGbry/orhvavELc5LwDwvJ59A8uc5zunQU=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 1/2] remoteproc: qcom_q6v5_mss: map/unmap mpss segments
 before/after use
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <158935080633.26945.9821739841419532784.git-patchwork-notify@kernel.org>
Date:   Wed, 13 May 2020 06:20:06 +0000
References: <20200415071619.6052-1-sibis@codeaurora.org>
In-Reply-To: <20200415071619.6052-1-sibis@codeaurora.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 15 Apr 2020 12:46:18 +0530 you wrote:
> The application processor accessing the mpss region when the Q6 modem is
> running will lead to an XPU violation. Fix this by un-mapping the mpss
> segments post copy during mpss authentication and coredumps.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
> ---
> 
> [...]


Here is a summary with links:
  - [v2,1/2] remoteproc: qcom_q6v5_mss: map/unmap mpss segments before/after use
    https://git.kernel.org/andersson/remoteproc/c/be050a3429f46ecf13eb2b80f299479f8bb823fb
  - [v2,2/2] remoteproc: qcom_q6v5_mss: Remove unused q6v5_da_to_va function
    https://git.kernel.org/andersson/remoteproc/c/9666174a4e1a7b1e32c214312678f8452275da6a

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
