Return-Path: <SRS0=ISGM=DV=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-12.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=ham
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9AE4AC4363A
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 00:10:06 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6E4E9207C3
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Oct 2020 00:10:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1602634206;
	bh=5sJCiVP4i9U9xPxcqhbMZzeIWAPqk1Y2s3z6nqsaDZ8=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=eAERm9NKreTWXt8O2TdbQgWKmnPaNkaEmSzllv4GLGBrVGX8TSUQLv/H5+AY6hhI8
	 rHEc2gmlSBX1wRjkKW2MO9KV5p2r5ZzeW5Q0gWtOlMyGgbN+9LjSdaCzMjSUBfSgTm
	 32WwJMFUIm2iTEh7cHixvlI8D3MYT4RPd2vogJFk=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727391AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Received: from mail.kernel.org ([198.145.29.99]:47332 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1727470AbgJNAKF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Oct 2020 20:10:05 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1602634204;
        bh=5sJCiVP4i9U9xPxcqhbMZzeIWAPqk1Y2s3z6nqsaDZ8=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=kLecJh6cvrPntogwKzNCFJnrEP6xnw+i+BOeRmUagv8FcASfhGO0P2e/6YaXvm8PH
         XN+uxomAA15UVskuixnHvwmT2s56FeYZRucKNr8l4VuyofwuFPe3hDkE+Ahn+3Q/zX
         OePf6T4L14x4reHNKGU78Sm1rKwFWcmAH13Kr/Zw=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v3] remoteproc/mediatek: Add support for mt8192 SCP
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160263420477.29882.13176285381583345374.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Oct 2020 00:10:04 +0000
References: <20200921094847.2112399-1-pihsun@chromium.org>
In-Reply-To: <20200921094847.2112399-1-pihsun@chromium.org>
To:     Pi-Hsun Shih <pihsun@chromium.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This patch was applied to andersson/remoteproc.git (refs/heads/for-next):

On Mon, 21 Sep 2020 17:48:46 +0800 you wrote:
> Add support for mt8192 SCP.
> 
> Signed-off-by: Pi-Hsun Shih <pihsun@chromium.org>
> Reviewed-by: Tzung-Bi Shih <tzungbi@google.com>
> ---
> 
> Change since v2:
> * Inline scp_reset_assert / scp_reset_deassert.
> 
> [...]

Here is the summary with links:
  - [v3] remoteproc/mediatek: Add support for mt8192 SCP
    https://git.kernel.org/andersson/remoteproc/c/fd0b6c1ff85a

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


