Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 1C7F0C636D4
	for <linux-remoteproc@archiver.kernel.org>; Wed, 15 Feb 2023 05:01:35 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233057AbjBOFBe (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Wed, 15 Feb 2023 00:01:34 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:38736 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229749AbjBOFBd (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Wed, 15 Feb 2023 00:01:33 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E204E34004
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 21:01:31 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 31D28240649
        for <linux-remoteproc@vger.kernel.org>; Wed, 15 Feb 2023 06:01:30 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1676437290; bh=FWiteDJexgPQ7XRRBus0P85wr8k1keyo2CAWC376RBg=;
        h=Date:From:To:Cc:Subject:From;
        b=LgoCIgmA4DG3U60cJpRJjIfKH2twgmEqeqoq6NeO4a5klvUy8lbvR28CSQQGmpLeB
         u/cuCqwPjajm87/BGARvdGKD7jbG7tuMZd5kvjp8XR7FGogGQjTtBILnhU4uOFLtaC
         NqEN/t1repkDdAO46q6Frc8WszoJ4xFjstGj4D+W8YNzJsuOjZKChNHGl4So8xi1rm
         dysZ4bqopyhPAep0kE1DpQm1+Oj9BVrxkLtcLGKvF3lFPY7+rgwOO1CH2LWK4dFQgu
         T+4yjxHc7VypDuYwKSU/8pgo2ZmZr/rj9Xy4vbsFKRf+HNwzFWqVJ7a7ITbQOdHk4s
         FsddejQMTLvWg==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PGmBZ5hGhz9rxF;
        Wed, 15 Feb 2023 06:01:26 +0100 (CET)
Date:   Wed, 15 Feb 2023 05:01:25 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Bastian Germann <bage@debian.org>
Cc:     Andre Przywara <andre.przywara@arm.com>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 0/3] Enable hwlock on Allwinner A64
Message-ID: <20230215060125.0e06312e@posteo.net>
In-Reply-To: <d483ea28-feed-41d1-f9b6-4abfcfe42874@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
        <20230214001805.6ead683d@slackpad.lan>
        <d483ea28-feed-41d1-f9b6-4abfcfe42874@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 Feb 2023 22:55:45 +0100
Bastian Germann <bage@debian.org> wrote:

> Am 14.02.23 um 01:18 schrieb Andre Przywara:
> > So are there Linux/Crust patches out there that use this device?
> 
> I do not know of any. I was just investigating the chip and checked the parts that I could easily
> use in Linux.

Easily using it is, well, a bit questionable. The only reason to use this is
for syncing access to hardware between the ARM and the embedded OpenRISC core.
Like Andre wrote, it only makes sense if you want to etablish some form of
shared access between Linux and the Crust firmware. Using this in Linux only
instead of the common spinlocks won't be fun, that hwspinlock unit is slower.

greetings,
Will
