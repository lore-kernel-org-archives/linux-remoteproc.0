Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id BA85DC63777
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 19:50:28 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 640E52086A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 24 Nov 2020 19:50:28 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (1024-bit key) header.d=kernel.org header.i=@kernel.org header.b="IIQCOMRv"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1728052AbgKXTuI (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 24 Nov 2020 14:50:08 -0500
Received: from mail.kernel.org ([198.145.29.99]:59336 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726715AbgKXTuH (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 24 Nov 2020 14:50:07 -0500
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1606247407;
        bh=EFQw9hurn6qpt2EIk3ATUhqoZBX93MI2Ii0439JzWOM=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=IIQCOMRvUrJKefGSY0vP/lPgLsND9khZ2udNKYGDGhl/vFG4mPXHVmlij39by9fs+
         ocgNYPd+wzYYCuc9EMXQeC5funRg8MP8yERGHPnRa+JeJlMKkt7/mYOxFOppg2mdqk
         xubiUkv8O2wtxjgvMO5F9JTaKSfMjSRSBCOezuW0=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v7 0/8] rpmsg: Make RPMSG name service modular 
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <160624740719.13327.10642451790305903826.git-patchwork-notify@kernel.org>
Date:   Tue, 24 Nov 2020 19:50:07 +0000
References: <20201120214245.172963-1-mathieu.poirier@linaro.org>
In-Reply-To: <20201120214245.172963-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Fri, 20 Nov 2020 14:42:37 -0700 you wrote:
> This revision addresses comments received from the previous revision,
> i.e V6.  Please see details below.
> 
> It starts by making the RPMSG protocol transport agnostic by
> moving the headers it uses to generic types and using those in the
> current implementation.  From there it re-uses the work that Arnaud
> published[1] to make the name service modular.
> 
> [...]

Here is the summary with links:
  - [v7,1/8] rpmsg: Introduce __rpmsg{16|32|64} types
    https://git.kernel.org/andersson/remoteproc/c/6bef038011a0
  - [v7,2/8] rpmsg: virtio: Move from virtio to rpmsg byte conversion
    https://git.kernel.org/andersson/remoteproc/c/5f2f6b7db119
  - [v7,3/8] rpmsg: Move structure rpmsg_ns_msg to header file
    https://git.kernel.org/andersson/remoteproc/c/c435a04189de
  - [v7,4/8] rpmsg: virtio: Rename rpmsg_create_channel
    https://git.kernel.org/andersson/remoteproc/c/77d372989db9
  - [v7,5/8] rpmsg: core: Add channel creation internal API
    https://git.kernel.org/andersson/remoteproc/c/9753e12cd3bd
  - [v7,6/8] rpmsg: virtio: Add rpmsg channel device ops
    https://git.kernel.org/andersson/remoteproc/c/1ee1e5e162af
  - [v7,7/8] rpmsg: Make rpmsg_{register|unregister}_device() public
    https://git.kernel.org/andersson/remoteproc/c/55488110acc1
  - [v7,8/8] rpmsg: Turn name service into a stand alone driver
    https://git.kernel.org/andersson/remoteproc/c/950a7388f02b

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


