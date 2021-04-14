Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.0 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D13F4C433B4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:15 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id A46C3613C7
	for <linux-remoteproc@archiver.kernel.org>; Wed, 14 Apr 2021 02:20:15 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S231786AbhDNCUe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 13 Apr 2021 22:20:34 -0400
Received: from mail.kernel.org ([198.145.29.99]:46666 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S229710AbhDNCUb (ORCPT <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 13 Apr 2021 22:20:31 -0400
Received: by mail.kernel.org (Postfix) with ESMTPS id EB2EC613C7;
        Wed, 14 Apr 2021 02:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=k20201202; t=1618366811;
        bh=AaKyGVAS9/59lm2utKKfd2ido/eFksPUaxRJzCxszac=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=RC9OnKHmatPyUod5AT1XH9K2On0XN+eeud98PMBXlDPchsq2ZfwEG3YaZVoqKU1NK
         9qSGd3hKOJJEyO7VvlJh7sI+YwElbxIRPPhz4WRDK/VzdsLaFxDYIGZudtlRhlqQYO
         tl/oYuTO/s5wVHJpqGkf3W/1nbEknC1GzAaUlxAGtDYjdGGECE8ncmLtcNwprcCwKw
         ukFyJn7vA+cTSSe1tcBpCnix5Fj7IqcLVqbHYxpOfKLGfLr4qDoZS0wxVMc5nkE/a2
         8BJscHJE7AK1sP2ThBXJr60nacIf2G0I8cNKwezDUK3vLTF/ZFJsV63d7aQlP1201H
         16GCFADVreEtw==
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v2 0/3] PRU firmware event/interrupt mapping fixes
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <161836681090.7360.10429412919501045588.git-patchwork-notify@kernel.org>
Date:   Wed, 14 Apr 2021 02:20:10 +0000
References: <20210407155641.5501-1-s-anna@ti.com>
In-Reply-To: <20210407155641.5501-1-s-anna@ti.com>
To:     Suman Anna <s-anna@ti.com>
Cc:     linux-remoteproc@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next):

On Wed, 7 Apr 2021 10:56:38 -0500 you wrote:
> Hi All,
> 
> The following is a minor revised version of the series [1] that includes fixes
> for various different issues associated with the PRU firmware event/interrupt
> mapping configuration logic. Please see the v1 cover-letter [1] for additional
> details.
> 
> [...]

Here is the summary with links:
  - [v2,1/3] remoteproc: pru: Fixup interrupt-parent logic for fw events
    https://git.kernel.org/andersson/remoteproc/c/6d1f2803cb6b
  - [v2,2/3] remoteproc: pru: Fix wrong success return value for fw events
    https://git.kernel.org/andersson/remoteproc/c/1fe72bcfac08
  - [v2,3/3] remoteproc: pru: Fix and cleanup firmware interrupt mapping logic
    https://git.kernel.org/andersson/remoteproc/c/880a66e026fb

You are awesome, thank you!
--
Deet-doot-dot, I am a bot.
https://korg.docs.kernel.org/patchwork/pwbot.html


