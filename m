Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.2 required=3.0 tests=BAYES_00,
	HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	UNPARSEABLE_RELAY,URIBL_BLOCKED,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C899BC388F9
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 14:09:07 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 741CB2224A
	for <linux-remoteproc@archiver.kernel.org>; Sat, 21 Nov 2020 14:09:07 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1727531AbgKUOJH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 21 Nov 2020 09:09:07 -0500
Received: from smtp2207-205.mail.aliyun.com ([121.197.207.205]:51899 "EHLO
        smtp2207-205.mail.aliyun.com" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726570AbgKUOJG (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 21 Nov 2020 09:09:06 -0500
X-Alimail-AntiSpam: AC=CONTINUE;BC=0.1342164|-1;CH=green;DM=|CONTINUE|false|;DS=CONTINUE|ham_social|0.018434-0.00355031-0.978016;FP=0|0|0|0|0|-1|-1|-1;HT=ay29a033018047201;MF=fuyao@allwinnertech.com;NM=1;PH=DS;RN=4;RT=4;SR=0;TI=SMTPD_---.IzZuxG._1605967737;
Received: from localhost(mailfrom:fuyao@allwinnertech.com fp:SMTPD_---.IzZuxG._1605967737)
          by smtp.aliyun-inc.com(10.147.41.187);
          Sat, 21 Nov 2020 22:08:57 +0800
Date:   Sat, 21 Nov 2020 22:08:57 +0800
From:   fuyao <fuyao@allwinnertech.com>
To:     Maxime Ripard <maxime@cerno.tech>
Cc:     wens@csie.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] introduce sunxi hwspinlock
Message-ID: <20201121140857.GA23438@debian>
Mail-Followup-To: Maxime Ripard <maxime@cerno.tech>, wens@csie.org,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
References: <y>
 <cover.1605767679.git.fuyao@allwinnertech.com>
 <20201120160710.wlkl5cdfqlrym2fj@gilmour>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20201120160710.wlkl5cdfqlrym2fj@gilmour>
Organization: fuyao_love_xxt.Allwinnertech.Technology
User-Agent: Mutt/1.12.1+6 (4c2f7c70) (2019-08-28)
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Nov 20, 2020 at 05:07:10PM +0100, Maxime Ripard wrote:
> Hi!
> 
> On Thu, Nov 19, 2020 at 02:44:51PM +0800, fuyao@allwinnertech.com wrote:
> > From: fuyao <fuyao@allwinnertech.com>
> > 
> > this series add hwspinlock of sunxi. it provides hardware assistance for
> > synchronization between the multiple processors in the system.
> > (Or1k, Cortex-A7, Cortex-A53, Xtensa)
> 
> Xtensa? Which SoC has an Xtensa core?

The new Soc named R329 use Xtensa core as the arisc role and audio.
And the hwspinlock is the same as h3 and h6.

Additional, The new RISC-V Soc also use the same hwspinlock.

> 
> Unfortunately, there's been a submission of the same driver earlier this week:
> https://lore.kernel.org/lkml/cover.1605693132.git.wilken.gottwalt@posteo.net/
> 
> It would be great if you could point out whatever issue there is with
> that patch series (it looks like the retry delay could be useful for
> example).

I will test that submission with arisc next week.

BTW, which sunxi board you used, I want to used the same board with you.

^-^

thanks
-- 
fuyao


