Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-3.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,HEADER_FROM_DIFFERENT_DOMAINS,MAILING_LIST_MULTI,SPF_HELO_NONE,
	SPF_PASS autolearn=no autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 51A99C4320A
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Aug 2021 18:05:50 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 2C60460F11
	for <linux-remoteproc@archiver.kernel.org>; Tue, 10 Aug 2021 18:05:50 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237265AbhHJSGL (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Tue, 10 Aug 2021 14:06:11 -0400
Received: from so254-9.mailgun.net ([198.61.254.9]:42577 "EHLO
        so254-9.mailgun.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238910AbhHJSEj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Tue, 10 Aug 2021 14:04:39 -0400
DKIM-Signature: a=rsa-sha256; v=1; c=relaxed/relaxed; d=mg.codeaurora.org; q=dns/txt;
 s=smtp; t=1628618657; h=Message-ID: References: In-Reply-To: Subject:
 Cc: To: From: Date: Content-Transfer-Encoding: Content-Type:
 MIME-Version: Sender; bh=bDO2vmOnrMiag9r3MOqOnhI26ABF0ECDJ8jRg53NeCs=;
 b=C3x/iBDqTh864CXeTzu+zlKqmz/VaYSp0CadGjpYf+nuwZt4WHGwlgygJzc1D2lVUTBzuACq
 62AcpVEL31KE2QsXTATdSTdtBs8SHdvH+ZUOmCuMa/B72TtALEfDGwxQo1dhEt92Ok0G/JPg
 0OEzEeCr9Sao3P3dlRTBwl575LQ=
X-Mailgun-Sending-Ip: 198.61.254.9
X-Mailgun-Sid: WyI4ZWZiZiIsICJsaW51eC1yZW1vdGVwcm9jQHZnZXIua2VybmVsLm9yZyIsICJiZTllNGEiXQ==
Received: from smtp.codeaurora.org
 (ec2-35-166-182-171.us-west-2.compute.amazonaws.com [35.166.182.171]) by
 smtp-out-n07.prod.us-east-1.postgun.com with SMTP id
 6112bf98b3873958f5e1ac9b (version=TLS1.2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_GCM_SHA256); Tue, 10 Aug 2021 18:04:08
 GMT
Sender: pillair=codeaurora.org@mg.codeaurora.org
Received: by smtp.codeaurora.org (Postfix, from userid 1001)
        id 483C4C358EB; Tue, 10 Aug 2021 18:04:07 +0000 (UTC)
Received: from mail.codeaurora.org (localhost.localdomain [127.0.0.1])
        (using TLSv1 with cipher ECDHE-RSA-AES256-SHA (256/256 bits))
        (No client certificate requested)
        (Authenticated sender: pillair)
        by smtp.codeaurora.org (Postfix) with ESMTPSA id 6113DC2E884;
        Tue, 10 Aug 2021 18:04:05 +0000 (UTC)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII;
 format=flowed
Content-Transfer-Encoding: 7bit
Date:   Tue, 10 Aug 2021 23:34:04 +0530
From:   Rakesh Pillai <pillair@codeaurora.org>
To:     Stephen Boyd <sboyd@kernel.org>
Cc:     agross@kernel.org, bjorn.andersson@linaro.org,
        mathieu.poirier@linaro.org, ohad@wizery.com,
        p.zabel@pengutronix.de, robh+dt@kernel.org, sibis@codeaurora.org,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 0/2] Add support for sc7280 WPSS PIL loading
In-Reply-To: <162699197027.2679160.6825677812017791100@swboyd.mtv.corp.google.com>
References: <1615361290-19238-1-git-send-email-pillair@codeaurora.org>
 <162699197027.2679160.6825677812017791100@swboyd.mtv.corp.google.com>
Message-ID: <25c4175bca7fb2f055d8f87fa61ed487@codeaurora.org>
X-Sender: pillair@codeaurora.org
User-Agent: Roundcube Webmail/1.3.9
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On 2021-07-23 03:42, Stephen Boyd wrote:
> Quoting Rakesh Pillai (2021-03-09 23:28:08)
>> Add support for PIL loading of WPSS co-processor for SC7280 SOCs.
>> 
>> Rakesh Pillai (2):
>>   dt-bindings: remoteproc: qcom: Add SC7280 WPSS support
>>   remoteproc: qcom: q6v5_wpss: Add support for sc7280 WPSS
>> 
> 
> Is this patch series going to be resent?

Hi Stephen,
I posted a v2 for this patch series, with the dt-bindings converted to 
yaml.

Thanks,
Rakesh Pillai.
