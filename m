Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3B664C636CC
	for <linux-remoteproc@archiver.kernel.org>; Thu, 16 Feb 2023 08:55:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229756AbjBPIzF (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 16 Feb 2023 03:55:05 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:42040 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229706AbjBPIzF (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 16 Feb 2023 03:55:05 -0500
Received: from mout02.posteo.de (mout02.posteo.de [185.67.36.66])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 949D03B3F3
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 00:55:01 -0800 (PST)
Received: from submission (posteo.de [185.67.36.169]) 
        by mout02.posteo.de (Postfix) with ESMTPS id EF2372404C4
        for <linux-remoteproc@vger.kernel.org>; Thu, 16 Feb 2023 09:54:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=posteo.net; s=2017;
        t=1676537700; bh=CdZyo6JjpXiyHzEMPe2wM0kSGNglA5FAaZGZKnEZChU=;
        h=Date:From:To:Cc:Subject:From;
        b=NGtca2mSTcpvtekUIjKzkrHEIHC+UHhv88b1aw+jRKufVi+0h0ygloe6bBUPDwYJs
         46kEdMmv9M2erO+rabUK83bApS0HO6RyeDpfoUQv/vMjFb1SJacigxS0XSU1lFbx/R
         zS1OWAQY22di8YdjuAP80wJVZmgslAum3Ifz1wmDKTXK3KMt7CnB0cGN3uAGhRDaxl
         AU7e0YG8ICCtbB/0HwEi2jxDp2GK/+0z3peGxXX/YixjcJgVQFBvb42x9k8DCTcSK+
         cq2nRdCHvml1tvPK8euO9bXDgxVlGov1pTNFeoZUnrtg7WL7ea7EHwxWnq7/pc2CBn
         Usq6M+qxEZYeQ==
Received: from customer (localhost [127.0.0.1])
        by submission (posteo.de) with ESMTPSA id 4PHTKW4zcRz6tm5;
        Thu, 16 Feb 2023 09:54:55 +0100 (CET)
Date:   Thu, 16 Feb 2023 08:54:54 +0000
From:   Wilken Gottwalt <wilken.gottwalt@posteo.net>
To:     Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Cc:     Bastian Germann <bage@debian.org>,
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
Subject: Re: [PATCH v2 3/5] dt-bindings: hwlock: sun6i: Add missing names
Message-ID: <20230216095454.54f4d5ca@posteo.net>
In-Reply-To: <a2d10295-d9eb-cd1f-8f48-b61f97487208@linaro.org>
References: <20230215203711.6293-1-bage@debian.org>
        <20230215203711.6293-4-bage@debian.org>
        <a2d10295-d9eb-cd1f-8f48-b61f97487208@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 16 Feb 2023 09:36:08 +0100
Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org> wrote:

> On 15/02/2023 21:37, Bastian Germann wrote:
> > The allwinner,sun6i-a31-hwspinlock.yaml binding needs clock-names and
> > reset-names set to "ahb" as required by the Linux driver.
> > 
> > Fixes: f9e784dcb63f ("dt-bindings: hwlock: add sun6i_hwspinlock") 
> > Signed-off-by: Bastian Germann <bage@debian.org>
> 
> With new data, I changed my opinion and NAKed this. Still NAK, sorry.
> Please drop the clock/reset-names from the driver (use indices) and DTS.

I won't be able to fix this in the next time. I'm currently in the state of
moving and can't set up my hardware to test the changes. And I'm not willing
to submit changes without testing. And with testing I really mean testing it
against a running Crust firmware which touches the hwspinlock unit.

If someone wants to change that, I'm happy to see it working out, but please
do it properly. Just testing the locks in Linux only is not sufficient. If
some directions are required, I still have my working repo up at Github:
https://github.com/wgottwalt/sunxi_hwspinlock
It may be a bit dated, but should be a good start.

Greetings,
Will
