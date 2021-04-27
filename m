Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-8.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,URIBL_BLOCKED autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2C29AC433B4
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Apr 2021 06:25:48 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id E952E610FB
	for <linux-remoteproc@archiver.kernel.org>; Tue, 27 Apr 2021 06:25:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S232884AbhD0G03 (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 27 Apr 2021 02:26:29 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:10071 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S231468AbhD0G02 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 27 Apr 2021 02:26:28 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1619504746; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=/5CO6kyKiMLSUDsUJcNBx75sAEKt3Nx/B9KxXAfbB5c=;
 b=cm4Qu794K+njHdVxj7f/6+zjPBuW1b9ANeeFRt6B02lf21XZuw97baUf8nlRonCehqkcOOGx
 o/OAo+Mgg4GbpcGbx8d5qAL0qYA1KEsSboOC20UHbCMXT5tFdEy+fJ1WINoSLycFaCqQLJzZ
 1QOvpE4nHSD0RTWzBkPn8xXhVQQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n05.prod.us-west-2.postgun.com with SMTP id
 6087ae6afebcffa80f4922c5 (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 27 Apr 2021 06:25:46
 GMT
Sender: sibis=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 0181DC43217; Tue, 27 Apr 2021 06:25:45 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: sibis)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 1E859C433D3;
        Tue, 27 Apr 2021 06:25:45 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 27 Apr 2021 11:55:45 +0530
From:   Sibi Sankar <sibis@codeaurora.org>
To:     Stephen Boyd <swboyd@chromium.org>
Cc:     bjorn.andersson@linaro.org, mathieu.poirier@linaro.org,
        robh+dt@kernel.org, ulf.hansson@linaro.org, rjw@rjwysocki.net,
        agross@kernel.org, ohad@wizery.com, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org,
        linux-kernel@vger.kernel.org, dianders@chromium.org,
        rishabhb@codeaurora.org, sidgup@codeaurora.org
Subject: Re: [PATCH 02/12] soc: qcom: aoss: Drop power domain support
In-Reply-To: <161871128938.46595.8658084266884500136@swboyd.mtv.corp.google.com>
References: <1618574638-5117-1-git-send-email-sibis@codeaurora.org>
 <1618574638-5117-3-git-send-email-sibis@codeaurora.org>
 <161871128938.46595.8658084266884500136@swboyd.mtv.corp.google.com>
Message-ID: <7adff8e58784bb85ea844ad338bfb19c@codeaurora.org>
X-Sender: sibis@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-04-18 07:31, Stephen Boyd wrote:
> Quoting Sibi Sankar (2021-04-16 05:03:48)
>> The load state resources are expected to follow the life cycle of the
>> remote processor it tracks. However, modeling load state resources as
>> power-domains result in them getting turned off during system suspend
>> and thereby falling out of sync with the remote processors that are 
>> still
>> on. Fix this by replacing load state resource control through the 
>> generic
>> qmp message send interface instead.
>> 
>> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>
>> ---
> 
> Is it possible to keep this code around for a cycle so that there isn't
> the chance that someone is using the deprecated DT bindings with a new
> kernel? I worry that ripping the code out will cause them angst.

deprecated bindings with a newer kernel
shouldn't cause any problems since it is
the driver changes that make AOSS PD
mandatory or not. So the newer kernel will
just use qmp_send and leave the PD unused.

> Certainly we have to keep the code in place until DT is updated, so 
> this
> patch should come last?

sure I don't mind, as long as it simplifies
the merge process.

-- 
Qualcomm Innovation Center, Inc. is a member of Code Aurora Forum,
a Linux Foundation Collaborative Project.
