Return-Path: <SRS0=tiv6=65=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=HEADER_FROM_DIFFERENT_DOMAINS,
	MAILING_LIST_MULTI,SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 08980C433E0
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 18:06:12 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E760B2070A
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 May 2020 18:06:11 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726244AbgEOSGJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 May 2020 14:06:09 -0400
Received: from ms.lwn.net ([45.79.88.28]:53756 "EHLO ms.lwn.net"
        rhost-flags-OK-OK-OK-OK) by vger.kernel.org with ESMTP
        id S1726212AbgEOSGJ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 May 2020 14:06:09 -0400
Received: from lwn.net (localhost [127.0.0.1])
        (using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
        (No client certificate requested)
        by ms.lwn.net (Postfix) with ESMTPSA id 0ACFE736;
        Fri, 15 May 2020 18:06:08 +0000 (UTC)
Date:   Fri, 15 May 2020 12:06:07 -0600
From:   Jonathan Corbet <corbet@lwn.net>
To:     Mauro Carvalho Chehab <mchehab+huawei@kernel.org>
Cc:     Linux Doc Mailing List <linux-doc@vger.kernel.org>,
        linux-kernel@vger.kernel.org, Thomas Gleixner <tglx@linutronix.de>,
        Ingo Molnar <mingo@redhat.com>,
        Peter Zijlstra <peterz@infradead.org>,
        Darren Hart <dvhart@infradead.org>,
        Will Deacon <will@kernel.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Baolin Wang <baolin.wang7@gmail.com>,
        Rob Herring <robh@kernel.org>,
        "David S. Miller" <davem@davemloft.net>,
        Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH 10/14] docs: move locking-specific documenta to locking/
 directory
Message-ID: <20200515120607.73ee1278@lwn.net>
In-Reply-To: <dd833a10bbd0b2c1461d78913f5ec28a7e27f00b.1588345503.git.mchehab+huawei@kernel.org>
References: <cover.1588345503.git.mchehab+huawei@kernel.org>
        <dd833a10bbd0b2c1461d78913f5ec28a7e27f00b.1588345503.git.mchehab+huawei@kernel.org>
Organization: LWN.net
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri,  1 May 2020 17:37:54 +0200
Mauro Carvalho Chehab <mchehab+huawei@kernel.org> wrote:

> Several files under Documentation/*.txt describe some type of
> locking API. Move them to locking/ subdir and add to the
> locking/index.rst index file.
> 
> Signed-off-by: Mauro Carvalho Chehab <mchehab+huawei@kernel.org>

I've applied this, but it really seems like this belongs in the core-api
manual someday.

Thanks,

jon
