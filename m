Return-Path: <SRS0=Av4F=BB=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,
	SPF_HELO_NONE,SPF_PASS autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6DDC1C433DF
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 00:00:09 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 3B837207DD
	for <linux-remoteproc@archiver.kernel.org>; Wed, 22 Jul 2020 00:00:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=default; t=1595376009;
	bh=sD8UKc7skd4SX4FCcDRnslMIQjmprxh+IcX0eKqCVa0=;
	h=Subject:From:Date:References:In-Reply-To:To:Cc:List-ID:From;
	b=v141Cmj3wwu41lrMBD3ixoxpbfpQ94CmcfqOjqehc+si8kN0YDRvv+JPq9gD9E/VD
	 Gr6Qs31XMBy529+WHodGSJ9eMm59rgw8M1yKHatRAAFnZ6uhtdcgkDpPZevK03vLUD
	 cL1fIQQU0TOVFu9O0gutY33zliXLAx1WyP28OESo=
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726468AbgGVAAJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 21 Jul 2020 20:00:09 -0400
Received: from mail.kernel.org ([198.145.29.99]:56444 "EHLO mail.kernel.org"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726148AbgGVAAI (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 21 Jul 2020 20:00:08 -0400
Content-Type: text/plain; charset="utf-8"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
        s=default; t=1595376008;
        bh=sD8UKc7skd4SX4FCcDRnslMIQjmprxh+IcX0eKqCVa0=;
        h=Subject:From:Date:References:In-Reply-To:To:Cc:From;
        b=fabkMwMpvuyZaY0NY+SfGKu8Wm5fTl1WJNsSQKrgksvCHBIvGLaQ/b94hwcWUQTx6
         dGayGamt0vXfrU/fwWuzruHShTbb3KMZYdGItH8jJwUiGfnq7qfqCuPM9KWuUV2eZP
         ltzHuZkZoiHK9/0nFdEwxmusKY+viLAkarJ+plxA=
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Subject: Re: [PATCH v6 00/11] remoteproc: stm32: Add support for attaching to M4
From:   patchwork-bot+linux-remoteproc@kernel.org
Message-Id: <159537600822.467.3415753133492662771.git-patchwork-notify@kernel.org>
Date:   Wed, 22 Jul 2020 00:00:08 +0000
References: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
In-Reply-To: <20200714200445.1427257-1-mathieu.poirier@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>
Cc:     linux-remoteproc@vger.kernel.org
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Hello:

This series was applied to andersson/remoteproc.git (refs/heads/for-next).

On Tue, 14 Jul 2020 14:04:34 -0600 you wrote:
> This set applies on top of [1] and refactors the STM32 platform code in
> order to attach to the M4 remote processor when it has been started by the
> boot loader.
> 
> New to V6:
> 1) Removed extra newline in patch 06.
> 2) Re-worked title and changelog of patch 08 to better reflect
>    what is done by the patch.
> 
> [...]


Here is a summary with links:
  - [v6,01/11] remoteproc: stm32: Decouple rproc from memory translation
    https://git.kernel.org/andersson/remoteproc/c/7b9f18ca933ae35b90add6fe1787056bbc789a8a
  - [v6,02/11] remoteproc: stm32: Request IRQ with platform device
    https://git.kernel.org/andersson/remoteproc/c/b8631ab137c78f58afacd7e7f822cd3fc296f589
  - [v6,03/11] remoteproc: stm32: Decouple rproc from DT parsing
    https://git.kernel.org/andersson/remoteproc/c/8210fc873d2f1a550ad41093d21a7c18217f75fb
  - [v6,04/11] remoteproc: stm32: Remove memory translation from DT parsing
    https://git.kernel.org/andersson/remoteproc/c/95e32f868aa67cb0d581ca8ced456dc2fac5edf7
  - [v6,05/11] remoteproc: stm32: Parse syscon that will manage M4 synchronisation
    https://git.kernel.org/andersson/remoteproc/c/9276536f455b38b965ea16958a01f77bfae385f3
  - [v6,06/11] remoteproc: stm32: Properly set co-processor state when attaching
    https://git.kernel.org/andersson/remoteproc/c/376ffdc044568fcd9982a89d57eed67874566f85
  - [v6,07/11] remoteproc: Make function rproc_resource_cleanup() public
    https://git.kernel.org/andersson/remoteproc/c/d9473cbfb0c5cbb279dfdeaec780934729537d27
  - [v6,08/11] remoteproc: stm32: Parse memory regions when attaching to M4
    https://git.kernel.org/andersson/remoteproc/c/dadbdb9c304c51038465e0735585538a78e8578b
  - [v6,09/11] remoteproc: stm32: Properly handle the resource table when attaching
    https://git.kernel.org/andersson/remoteproc/c/11a7aaa72cc5539591bd34c637ab12e55cb79e1e
  - [v6,10/11] remoteproc: stm32: Introduce new attach() operation
    https://git.kernel.org/andersson/remoteproc/c/bee04d4672e0e8f6b82b62b092763b88a395da22
  - [v6,11/11] remoteproc: stm32: Update M4 state in stm32_rproc_stop()
    https://git.kernel.org/andersson/remoteproc/c/efd8626213f6897b416e573e87f4582810086b93

You are awesome, thank you!

-- 
Deet-doot-dot, I am a bot.
https://korg.wiki.kernel.org/userdoc/pwbot
