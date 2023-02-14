Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3968AC6379F
	for <linux-remoteproc@archiver.kernel.org>; Tue, 14 Feb 2023 09:46:37 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232577AbjBNJqg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 14 Feb 2023 04:46:36 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231710AbjBNJqF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 14 Feb 2023 04:46:05 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C339B233D0
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 01:46:02 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id 4BF322403F3
        for <linux-remoteproc@vger.kernel.org>; Tue, 14 Feb 2023 10:46:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1676367961; bh=uLmz//y1yvE3HoFw//y4zEkCSNNtd9iN4bLEf+FBaIc=;
        h=Date:From:To:Cc:Subject:From;
        b=NvK7hL7SsyZNfWg0X9CVu1MTcuhaNUtUMsU3lbw8XBqKmAIPqHQnvVmocugPP+PDa
         VvnFHUaqk/GB3blwSaxLGL1yLDQ3WS4FK7KjEGxnfkhsfXEfGQe4v3rXSKUpYQY95g
         UEL6pD6l4Mp4g337N7fQZWMDWYPJQf41MDZ0QUkTozTsTg0JR41obePk8CVnQvZE07
         7+r/Sx1PoOi55JsdcAQXRsN4LI/1t3DDk5lwVtLQdgTbRHqzn6JEXGAviSagBAZKYk
         XcYa0tPdESHNbbrto/Phhl727R8HgJiG2jj8VAmsm7wsjNbVTQwadPjOLoEbxKxshf
         K/OohAZOgDHQw==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PGGYH0cQvz9rxL;
        Tue, 14 Feb 2023 10:45:55 +0100 (CET)
Date:   Tue, 14 Feb 2023 09:45:54 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Bastian Germann <bage@debian.org>
Cc:     Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <andersson@kernel.org>,
        Baolin Wang <baolin.wang@linux.alibaba.com>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Chen-Yu Tsai <wens@csie.org>,
        Samuel Holland <samuel@sholland.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
        devicetree@vger.kernel.org
Subject: Re: [PATCH 2/3] dt-bindings: hwlock: sun6i: Add missing names
Message-ID: <20230214104554.35338faa@posteo.net>
In-Reply-To: <20230213231931.6546-3-bage@debian.org>
References: <20230213231931.6546-1-bage@debian.org>
        <20230213231931.6546-3-bage@debian.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 14 Feb 2023 00:19:29 +0100
Bastian Germann <bage@debian.org> wrote:

> The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names
> and reset-names set to "ahb" as required by the driver.

Hmm, this one is a bit odd. If you look into my earlier versions of the
patchset, you may notice, that I actually included these bindings and they
were refused. I think the argumentation was like
"there is only one bus = no need for it".

If it gets accepted now, I really like to know why. (It was some trouble
back then to get the documentation properly done and accepted.)

greetings,
Will
