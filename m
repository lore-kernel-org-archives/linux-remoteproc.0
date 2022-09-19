Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id C16D5ECAAD3
	for <linux-remoteproc@archiver.kernel.org>; Mon, 19 Sep 2022 20:40:46 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229749AbiISUko (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 19 Sep 2022 16:40:44 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39632 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229453AbiISUkn (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 19 Sep 2022 16:40:43 -0400
Received: from mail-pj1-x1031.google.com (mail-pj1-x1031.google.com [IPv6:2607:f8b0:4864:20::1031])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B02A45F73
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:40:42 -0700 (PDT)
Received: by mail-pj1-x1031.google.com with SMTP id o99-20020a17090a0a6c00b002039c4fce53so3122568pjo.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 19 Sep 2022 13:40:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date;
        bh=/Stmq8yFlzyGsVydt7vXujqOluZq1bXgQOGENaoRM1M=;
        b=sn+iFM+jjtdYh5vMPtsJ019GP5VGQ7bSvKY+iq4KEkqk/4bwFJt0ZBSAmapLsjnCV3
         2orjTNeOC74BpzOrH7PzJONDb40z9Ph5EJsMCXBl3g5js28Mas8NDNBWvFRzKAHcz+Z4
         KadTCClFhiGHMDdQ5rR+IAhEKKabIVCXS/lt136Zp3CI6o9vbFlwlGEElO+2QZCQ4l0d
         sxgZUIMbu8Y3btOlvZZOyAIsfqvwxXwErJ34zSR0JLIQWaT/s5nEzoWaYD0fKIugLV6L
         3BLN4WoaJHrnxbbACYQBalNNe9qGkOKtLVkRNincXAMrhxCcZn/bo/0xMNOBo+3/ZaoD
         1Jxg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date;
        bh=/Stmq8yFlzyGsVydt7vXujqOluZq1bXgQOGENaoRM1M=;
        b=FfmSiA8daDndz6KS0vPHMLeSCJq2PdYeOe7zvpHDs/KRoK+dywyDdAraWhljjJINj+
         mEYHQcGhBsOwENcwsWRCzWBTWI14B7WW08XbB/aIxCmHwEb7M9hZjJlz+0K3T7PKVI5I
         fZm2w2egQ6YmYRQY673TWflIzy3Sqq6sZHZ4Gb4BH/RQ/XHqzv8r7A6SHpW5JtS50dXs
         otcTt388azghMsTfyFxt6VZV7EXoVyzyQPIfDhgWVy4eYC052MH341CJa6jsLs2NtnQQ
         IlsUR37dwzg3FhEGo5V8oFE4U0xCnuJ9ptJ46X+EQUXYw5b6wohwSY7DPQTG1srkDU4Y
         tMBA==
X-Gm-Message-State: ACrzQf2s0S84oOpwrwNtQcmJFfNFfhOzkdXbu0TMIAX/2rDqlB8RbSGo
        n788E56/X/vh2unb5KIFvkqwnQ==
X-Google-Smtp-Source: AMsMyM46srhSD2BUG3nOCVVNRgjK8euLz89d3A2QF7ddIMd9iEsY9lvzSI5XW9UrTV2t8kzDK9RIlg==
X-Received: by 2002:a17:903:18d:b0:178:28d1:4a13 with SMTP id z13-20020a170903018d00b0017828d14a13mr1512305plg.160.1663620041878;
        Mon, 19 Sep 2022 13:40:41 -0700 (PDT)
Received: from p14s (S0106889e681aac74.cg.shawcable.net. [68.147.0.187])
        by smtp.gmail.com with ESMTPSA id b6-20020a170903228600b0017693bb573bsm21154389plh.219.2022.09.19.13.40.40
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 19 Sep 2022 13:40:41 -0700 (PDT)
Date:   Mon, 19 Sep 2022 14:40:38 -0600
From:   Mathieu Poirier <mathieu.poirier@linaro.org>
To:     Deepak Kumar Singh <quic_deesin@quicinc.com>
Cc:     bjorn.andersson@linaro.org, arnaud.pouliquen@foss.st.com,
        swboyd@chromium.org, quic_clew@quicinc.com,
        linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: [PATCH V4 0/2] rpmsg_char/ctrl driver fixes
Message-ID: <20220919204038.GF759648@p14s>
References: <1663584840-15762-1-git-send-email-quic_deesin@quicinc.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <1663584840-15762-1-git-send-email-quic_deesin@quicinc.com>
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, Sep 19, 2022 at 04:23:58PM +0530, Deepak Kumar Singh wrote:
> Change from v4:
> Corrcted mistaked in commit message for patch2.
> 
> Deepak Kumar Singh (2):
>   rpmsg: glink: Add lock to avoid race when rpmsg device is released
>   rpmsg: glink: Add lock to rpmsg_ctrldev_remove
>

Why does 'glink' still shows up in this cover letter and the version number wrong?


>  drivers/rpmsg/rpmsg_char.c | 8 ++++++++
>  drivers/rpmsg/rpmsg_ctrl.c | 2 ++
>  2 files changed, 10 insertions(+)
> 
> -- 
> 2.7.4
> 
