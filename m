Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.4 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,
	NICE_REPLY_A,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5DF51C43465
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 23:40:56 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1AC1C20678
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 23:40:56 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=infradead.org header.i=@infradead.org header.b="Ts43QCN8"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726152AbgIQXkx (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 19:40:53 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:59754 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S1725886AbgIQXkw (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 19:40:52 -0400
Received: from casper.infradead.org (casper.infradead.org [IPv6:2001:8b0:10b:1236::1])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id B149EC06174A;
        Thu, 17 Sep 2020 16:40:52 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
        d=infradead.org; s=casper.20170209; h=Content-Transfer-Encoding:Content-Type:
        In-Reply-To:MIME-Version:Date:Message-ID:From:References:Cc:To:Subject:Sender
        :Reply-To:Content-ID:Content-Description;
        bh=TWLY8lh82j+jk86UdlGDuopQMIOUwT0jOd2vp9Tv/1s=; b=Ts43QCN89haSq7P6RVEULZ2DKK
        GxR4w3WSaJSn1YM2+sEE6KuyDPL8qj4aCcyvmbmdZQYOervwbKaDwmlFKIDaJfsqDu2JX2bkS4g7P
        JOQot+HtAHomBIa+ZOMtUyNNTpyHLBaNsSylfAE2OVBijWCxawn2D6PxioxEIjgwh0Smb11H2vKv+
        /UmWt0YMLK65/dI+T7XqHHmlzeRk8gyK8NDyuYpLo4UpCWFUARTq4JayiIpbKpRhDGEY7RP5BdY+k
        LyoD/e+shHBN03GVLSE0dnFPyx0QWuSjTSkwpeIIgdRs+nuV3EnJ5pEFrEgwKCcJpVklflJZMHVfI
        X6XNMuYw==;
Received: from [2601:1c0:6280:3f0::19c2]
        by casper.infradead.org with esmtpsa (Exim 4.92.3 #3 (Red Hat Linux))
        id 1kJ3WE-0000rp-LC; Thu, 17 Sep 2020 23:40:51 +0000
Subject: Re: [PATCH v4 0/3] Move recovery/coredump configuration to sysfs
To:     Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        tsoni@codeaurora.org, psodagud@codeaurora.org,
        sidgup@codeaurora.org
References: <1600368999-9461-1-git-send-email-rishabhb@codeaurora.org>
From:   Randy Dunlap <rdunlap@infradead.org>
Message-ID: <55d2c397-fad3-9dea-289b-6c10d31565ba@infradead.org>
Date:   Thu, 17 Sep 2020 16:40:47 -0700
User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <1600368999-9461-1-git-send-email-rishabhb@codeaurora.org>
Content-Type: text/plain; charset=utf-8
Content-Language: en-US
Content-Transfer-Encoding: 7bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 9/17/20 11:56 AM, Rishabh Bhatnagar wrote:
> From Android R onwards Google has restricted access to debugfs in user
> and user-debug builds. This restricts access to most of the features
> exposed through debugfs. This patch series removes the recovery/coredump
> entries from debugfs and moves them to sysfs. 
> 'Coredump' and 'Recovery' are critical interfaces that are required
> for remoteproc to work on Qualcomm Chipsets. Coredump configuration
> needs to be set to "inline" in debug/test build and "disabled" in
> production builds. Whereas recovery needs to be "disabled" for
> debugging purposes and "enabled" on production builds.
> 
> Changelog:
> 
> v4 -> v3:
> - Remove the feature flag to expose recovery/coredump
> 
> v3 -> v2:
> - Remove the coredump/recovery entries from debugfs
> - Expose recovery/coredump from sysfs under a feature flag
> 
> v1 -> v2:
> - Correct the contact name in the sysfs documentation.
> - Remove the redundant write documentation for coredump/recovery sysfs
> - Add a feature flag to make this interface switch configurable.
> 
> Rishabh Bhatnagar (3):
>   remoteproc: Expose remoteproc configuration through sysfs
>   remoteproc: Add coredump configuration to sysfs
>   remoteproc: Add recovery configuration to sysfs
> 
>  Documentation/ABI/testing/sysfs-class-remoteproc |  44 ++++++++
>  drivers/remoteproc/Kconfig                       |  12 +++
>  drivers/remoteproc/remoteproc_debugfs.c          |  10 +-
>  drivers/remoteproc/remoteproc_sysfs.c            | 126 +++++++++++++++++++++++
>  4 files changed, 190 insertions(+), 2 deletions(-)
> 

Hi,

Is there a patch 3/3?
This email (reply) is patch 0/3, then I see
                      patch 1/2
                      patch 2/2
so I'm confused.  However, the diffstat above references a Kconfig file
and neither patch 1/2 nor patch 2/2 contains any Kconfig changes.

thanks.
-- 
~Randy

