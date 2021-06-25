Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-11.1 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,
	INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS
	autolearn=unavailable autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 589A4C48BC2
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:42 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 352486194B
	for <linux-remoteproc@archiver.kernel.org>; Fri, 25 Jun 2021 23:23:42 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229952AbhFYX0C (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 25 Jun 2021 19:26:02 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:34906 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229826AbhFYX0C (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 25 Jun 2021 19:26:02 -0400
Received: from mail-pl1-x636.google.com (mail-pl1-x636.google.com [IPv6:2607:f8b0:4864:20::636])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 86549C061767
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:23:40 -0700 (PDT)
Received: by mail-pl1-x636.google.com with SMTP id y13so5483027plc.8
        for <linux-remoteproc@vger.kernel.org>; Fri, 25 Jun 2021 16:23:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=date:from:to:cc:subject:message-id:references:mime-version
         :content-disposition:in-reply-to;
        bh=I++Hou46KR2uj9FywP1lXIkCQRmcDSf2J7N01SOGghw=;
        b=PVPsHGryXepq++jasKNZrwOxRq0wtzSBiiAzjetks/D7Qtf5JoJYTLiNHxfdTg6YY5
         dnvjh/XfZ6UVkTR6gO5T3jXtO1e+ahuZGiYy4laO6YaPH4XzAUq1qRXANzz33dMm5Tv6
         QCOHiTC7H98VU25JFlCI50vR8+ybayijKvMZg=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:date:from:to:cc:subject:message-id:references
         :mime-version:content-disposition:in-reply-to;
        bh=I++Hou46KR2uj9FywP1lXIkCQRmcDSf2J7N01SOGghw=;
        b=dApWPGXZ5D8CLWLGagwT/7rPC/7xDOyPtDmmudT1Z+T3wZIVYqhXhg2DR6gGORV2kB
         BSQQ5ju9+DeoCQxFONmHUpsqhp+hGj6w9+u6sGWXYSTp9tG0Huz+HQk8lBb32myHlxXF
         Ff3PVRR6XfJ7zkQkjNB9TFHJpVHjfOZZO//WxXRpUj+fKRGfuYyKKtVFqLRdWWi42kv+
         JHYb8atOJ6klTjFpwobXoljnHRmmteYSOwWdRcV8nXxuTZpZ6/SYnXn6HypmFWZYdU3S
         Ga22QlRjov+1jdTlm+/rfOwJMa6g7zHYVK1nYDtwDYnfNTIHfHvp8XQ0DiSgwK1d99f2
         BrCQ==
X-Gm-Message-State: AOAM531xxhpaaoSMVZL0mneaITvDKsqjFJ3Vha9Y136BSButwzGHhTnN
        KjCPo6ai0ZH5Zg0Jl0WT9YwTSr2yU5wbAg==
X-Google-Smtp-Source: ABdhPJxjkafwQnqg424OpXjqQy03Ybb/oMQ3swvwysUOB5GqLJ1DNO98wJV+qB0cT5tMvqS4kG8Wlg==
X-Received: by 2002:a17:903:230d:b029:127:9144:db9e with SMTP id d13-20020a170903230db02901279144db9emr11110808plh.3.1624663419950;
        Fri, 25 Jun 2021 16:23:39 -0700 (PDT)
Received: from localhost ([2620:15c:202:201:cc13:a7dd:f4b5:2160])
        by smtp.gmail.com with UTF8SMTPSA id c184sm6643949pfa.38.2021.06.25.16.23.38
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Fri, 25 Jun 2021 16:23:39 -0700 (PDT)
Date:   Fri, 25 Jun 2021 16:23:37 -0700
From:   Matthias Kaehlcke <mka@chromium.org>
To:     Sibi Sankar <sibis@codeaurora.org>
Cc:     bjorn.andersson@linaro.org, robh+dt@kernel.org, will@kernel.org,
        saiprakash.ranjan@codeaurora.org, ohad@wizery.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        robin.murphy@arm.com, joro@8bytes.org, p.zabel@pengutronix.de,
        linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, evgreen@chromium.org,
        dianders@chromium.org, swboyd@chromium.org
Subject: Re: [PATCH 2/9] remoteproc: qcom: pas: Add SC7280 Modem support
Message-ID: <YNZleW/fLA6jPcn8@google.com>
References: <1624564058-24095-1-git-send-email-sibis@codeaurora.org>
 <1624564058-24095-3-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <1624564058-24095-3-git-send-email-sibis@codeaurora.org>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, Jun 25, 2021 at 01:17:31AM +0530, Sibi Sankar wrote:
> Add support for booting the Modem DSP found on QTI SC7280 SoCs.
> 
> Signed-off-by: Sibi Sankar <sibis@codeaurora.org>

Reviewed-by: Matthias Kaehlcke <mka@chromium.org>
