Return-Path: <SRS0=Or6o=C2=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-5.1 required=3.0 tests=BAYES_00,DKIM_INVALID,
	DKIM_SIGNED,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,NICE_REPLY_A,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1 autolearn=no autolearn_force=no
	version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id ADB1BC43461
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 18:25:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 5349021D7B
	for <linux-remoteproc@archiver.kernel.org>; Thu, 17 Sep 2020 18:25:42 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=fail reason="signature verification failed" (1024-bit key) header.d=mg.codeaurora.org header.i=@mg.codeaurora.org header.b="Qo/hbKQh"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S1726634AbgIQSVT (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Thu, 17 Sep 2020 14:21:19 -0400
Received: from mail29.static.mailgun.info ([104.130.122.29]:38965 "EHLO
        mail29.static.mailgun.info" rhost-flags-OK-OK-OK-OK)
        by vger.kernel.org with ESMTP id S1726564AbgIQSU5 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Thu, 17 Sep 2020 14:20:57 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1600366825; h=Content-Transfer-Encoding: Content-Type:
 In-Reply-To: MIME-Version: Date: Message-ID: From: References: Cc: To:
 Subject: Sender; bh=2Awvd0docYELA3/VOnVrhxEnBWW9DSBcjwiYbeE9eKM=; b=Qo/hbKQhqmK3JO8fdGq1nf+0mPzKidedUTV6ae4voUBbEtwqVnSuGa4KdutIKy+i8MEIYao2
 NFLvY5Lq30Z3x5TogkzNAuSnFj7EkyDYg7sAKEaHnd8XgQbqr7Tprn01Mv/PvsffdshvMKD5
 zCK+6g6Tjb9DeXjNQDkpz1Az1sE=
X-Mailgun-Sending-Ip: 104.130.122.29
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n03.prod.us-west-2.postgun.com with SMTP id
 5f63a8daea858627d51edc40 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Thu, 17 Sep 2020 18:20:10
 GMT
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 76D50C433FF; Thu, 17 Sep 2020 18:20:10 +0000 (UTC)
Received: from [192.168.1.10] (cpe-75-83-25-192.socal.res.rr.com [75.83.25.192])
        (using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
        (No client certificate requested)
        (Authenticated sender: sidgup)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 0AEE5C433CA;
        Thu, 17 Sep 2020 18:20:08 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.3.2 smtp.codeaurora.org 0AEE5C433CA
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; dmarc=none (p=none dis=none) header.from=codeaurora.org
Authentication-Results: aws-us-west-2-caf-mail-1.web.codeaurora.org; spf=fail smtp.mailfrom=sidgup@codeaurora.org
Subject: Re: [PATCH v4 0/3] Introduce mini-dump support for remoteproc
To:     agross@kernel.org, bjorn.andersson@linaro.org, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-msm@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, tsoni@codeaurora.org,
        psodagud@codeaurora.org, rishabhb@codeaurora.org,
        linux-doc@vger.kernel.org
References: <01010174796142bd-a595147b-833a-48fe-b692-f8b6fe466146-000000@us-west-2.amazonses.com>
From:   Siddharth Gupta <sidgup@codeaurora.org>
Message-ID: <5a8002bd-2eaa-5acd-d7ad-b651dd5e4fbb@codeaurora.org>
Date:   Thu, 17 Sep 2020 11:20:08 -0700
User-Agent: Mozilla/5.0 (Windows NT 10.0; WOW64; rv:68.0) Gecko/20100101
 Thunderbird/68.12.0
MIME-Version: 1.0
In-Reply-To: <01010174796142bd-a595147b-833a-48fe-b692-f8b6fe466146-000000@us-west-2.amazonses.com>
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 7bit
Content-Language: en-US
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Gentle remind to review this patch series.

Thanks,
Sid

On 9/10/2020 11:57 AM, Siddharth Gupta wrote:
> Sometimes firmware sizes can be in ten's of MB's and reading
> all the memory during coredump can consume lot of time and
> memory.
> Introducing support for mini-dumps. Mini-dump contains smallest
> amount of useful information, that could help to debug subsystem
> crashes.
> During bootup memory is allocated in SMEM (Shared memory)
> in the form of a table that contains the physical
> addresses and sizes of the regions that are supposed to be
> collected during coredump. This memory is shared amongst all
> processors in a Qualcomm platform, so all remoteprocs
> fill in their entry in the global table once they are out
> of reset.
> This patch series adds support for parsing the global minidump
> table and uses the current coredump frameork to expose this memory
> to userspace during remoteproc's recovery.
>
> This patch series also integrates the patch:
> https://patchwork.kernel.org/patch/11695541/ sent by Siddharth.
>
> Changelog:
> v3 -> v4:
> - Made adsp_priv_cleanup a static function.
>
> v2 -> v3:
> - Refactored code to remove dependency on Qualcomm configs.
> - Renamed do_rproc_minidump to rproc_minidump and marked as exported
>    symbol.
>
> v1 -> v2:
> - 3 kernel test robot warnings have been resolved.
> - Introduced priv_cleanup op in order to making the cleaning of
>    private elements used by the remoteproc more readable.
> - Removed rproc_cleanup_priv as it is no longer needed.
> - Switched to if/else format for rproc_alloc in order to keep
>    the static const decalaration of adsp_minidump_ops.
>
> Siddharth Gupta (3):
>    remoteproc: core: Add ops to enable custom coredump functionality
>    remoteproc: qcom: Add capability to collect minidumps
>    remoteproc: qcom: Add minidump id for sm8150 modem remoteproc
>
>   drivers/remoteproc/qcom_minidump.h          |  64 +++++++++++++
>   drivers/remoteproc/qcom_q6v5_pas.c          | 107 ++++++++++++++++++++-
>   drivers/remoteproc/remoteproc_core.c        |   6 +-
>   drivers/remoteproc/remoteproc_coredump.c    | 138 ++++++++++++++++++++++++++++
>   drivers/remoteproc/remoteproc_elf_helpers.h |  27 ++++++
>   include/linux/remoteproc.h                  |   5 +
>   6 files changed, 344 insertions(+), 3 deletions(-)
>   create mode 100644 drivers/remoteproc/qcom_minidump.h
>
