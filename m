Return-Path: <SRS0=rFSt=CY=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-15.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 31051C43461
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 05:00:10 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id F2A38206DC
	for <linux-remoteproc@archiver.kernel.org>; Tue, 15 Sep 2020 05:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1600146010;
	bh=e5bQp2EOm0yB/jXi864MTivR7W7p/M4LXIwgEsgit4A=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=JoJMMrmZpYQS7HrEuGiZZnVJSfWB/5BnrkqhzDuLHQXsYyhIliBrPPAHDZgSt6cvM
	 DHKGH/InE99nRw5Jeb7N8tEtX6nc40smhrozShAAeJehJI5ji2AQugqYsXDhLeMZXw
	 k8+YoTfEUs/aHCMZ45QyHkenmpcnry5XHXyc2EuU=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726157AbgIOFAJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 15 Sep 2020 01:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:51058 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726057AbgIOFAH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 15 Sep 2020 01:00:07 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1600146007;
        bh=e5bQp2EOm0yB/jXi864MTivR7W7p/M4LXIwgEsgit4A=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=qFNWnUH+5vxhv6q7ffmUL7pdDsF/O8kzllFErbY7CUgDrw0eJgzcE5zSTz93Oo7S0
         3X/wiokSViZT+mFivpU0R3cjDtlBBiHsX+IfGcwZ/QO3UqCDrD5iXc0HF2mkQC2pst
         5tyDWJdpAeEKT6kzBky6idet6DcgvXvHM+6lKC3I=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH V7 1/4] rpmsg: glink: Use complete_all for open states
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160014600735.14763.11920348065936470143.git-patchwork-notify@kernel.org>
Date:   Tue, 15 Sep 2020 05:00:07 +0000
References: <1593017121-7953-2-git-send-email-deesin@codeaurora.org>
In-Reply-To: <1593017121-7953-2-git-send-email-deesin@codeaurora.org>
To:     Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Wed, 24 Jun 2020 22:15:18 +0530 you wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> The open_req and open_ack completion variables are the state variables
> to represet a remote channel as open. Use complete_all so there are no
> races with waiters and using completion_done.
> 
> Signed-off-by: Chris Lew <clew@codeaurora.org>
> Signed-off-by: Deepak Kumar Singh <deesin@codeaurora.org>
> Signed-off-by: Arun Kumar Neelakantam <aneela@codeaurora.org>
> 
> [...]


Here is a summary with links:
  - [V7,1/4] rpmsg: glink: Use complete_all for open states
    https://git.kernel.org/andersson/remoteproc/c/4fcdaf6e28d11e2f3820d54dd23cd12a47ddd44e
  - [V7,2/4] rpmsg: Guard against null endpoint ops in destroy
    https://git.kernel.org/andersson/remoteproc/c/d5158cda9e7b66fd412815df32e58943b7383f0c
  - [V7,3/4] rpmsg: glink: Add support for rpmsg glink chrdev
    https://git.kernel.org/andersson/remoteproc/c/0f579e52472198cec2d3d794a26e277c84e9dbd2
  - [V7,4/4] rpmsg: glink: Expose rpmsg name attr for glink
    https://git.kernel.org/andersson/remoteproc/c/4e3dda0bc603c1ca84680a56bfc49e8fe2519c89

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
