Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id D7211C433F5
	for <linux-remoteproc@archiver.kernel.org>; Tue,  8 Feb 2022 03:28:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237041AbiBHD2Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 7 Feb 2022 22:28:25 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55074 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230012AbiBHD2Y (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 7 Feb 2022 22:28:24 -0500
Received: from mail-oo1-xc32.google.com (mail-oo1-xc32.google.com [IPv6:2607:f8b0:4864:20::c32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 5B2A8C043188
        for <linux-remoteproc@vger.kernel.org>; Mon,  7 Feb 2022 19:28:24 -0800 (PST)
Received: by mail-oo1-xc32.google.com with SMTP id r15-20020a4ae5cf000000b002edba1d3349so16175455oov.3
        for <linux-remoteproc@vger.kernel.org>; Mon, 07 Feb 2022 19:28:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=7ZAKaEEyJI1QlBtAO97x/djdFEUaVpT8G63TEnOhPRg=;
        b=W6dNI7vUff+i2CWCPidwYuDGTXnjvVZ967bP9FBbHOD6GWxeF7BTCtKnnq+/EnBk8d
         Cdl5XsWFnnf0bi3ikaGN5N0vkfb9qsUCYM4uVsVSPTaZQ6NBZLPdwkCMoWNx+B36ZzH8
         Fg+da5Yr1RHZHbv40fywMSgRRWEd6sxVquv3W6NYMJRL8MNkjYqkaNTXciJh5Hy1iynM
         k52TqHw5xhSsd/Qh4qvrw0PeraONV9SYN6jCl0B++3IhJtysEQzjNCtGMfoss7RdzHvI
         jH0doWgS4TBQWIULob9UVazUbDZh6sgnMr3IcEg0csFxPhU/2SvH/KKa1PgPxd9vhqWj
         COUA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=7ZAKaEEyJI1QlBtAO97x/djdFEUaVpT8G63TEnOhPRg=;
        b=1TS5na0VKl1oyWvcFWCBSxzun6AWbdN6jTx1hLb+xR2pX9e1R9zbdnZC8aIbspPiNi
         8IrNXVeXZg5Lwr8uUNGxEeuu6b9M4iTmqy3vbeWxw4q0uHshbXS6GOQMYKhPbhhTddLZ
         nhloXRx2xGxdzLk0qwBozfLzVdvWqqY+b0iOQ/2UyrAo1Ju2BwbxdGFNRmJWJrav515t
         yQ0QEaqXgDGUZ2HIIsiOxI2Ih32UGeuxdP/yuPA5DcFex99jEPSr1iPVzoNzXRiZZ6F0
         cGJqg0YJ6c4Rr4CWbKty6JDKxBZchhmv+FoFjQh78EJbV6Nh2juGkXEsA9rU4MVeAJaQ
         vFwA==
X-Gm-Message-State: AOAM530IOwztcxEka84ZApRJfBoeT6wTH3j6vJc+1//twYcHcXhz8PI1
        aQAEcpF8rQS6lyQnTI6jRyRT0g==
X-Google-Smtp-Source: ABdhPJxN1005N1nYLZgtc+K1Uzm1yy23+Xza9MKiC+hNYnP7jyUycrml+zFm/YdVOHUZHfNTY5jJxQ==
X-Received: by 2002:a05:6870:3:: with SMTP id a3mr631975oaa.305.1644290903793;
        Mon, 07 Feb 2022 19:28:23 -0800 (PST)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id c13sm4705272otf.5.2022.02.07.19.28.22
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 07 Feb 2022 19:28:23 -0800 (PST)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Alistair Delva <adelva@google.com>, linux-kernel@vger.kernel.org
Cc:     linux-remoteproc@vger.kernel.org, Ohad Ben-Cohen <ohad@wizery.com>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rishabh Bhatnagar <rishabhb@codeaurora.org>,
        stable@vger.kernel.org, Sibi Sankar <sibis@codeaurora.org>,
        kernel-team@android.com
Subject: Re: [PATCH] remoteproc: Fix count check in rproc_coredump_write()
Date:   Mon,  7 Feb 2022 21:28:22 -0600
Message-Id: <164429089105.137686.16984376250267108775.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220119232139.1125908-1-adelva@google.com>
References: <20220119232139.1125908-1-adelva@google.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 19 Jan 2022 23:21:39 +0000, Alistair Delva wrote:
> Check count for 0, to avoid a potential underflow. Make the check the
> same as the one in rproc_recovery_write().
> 
> 

Applied, thanks!

[1/1] remoteproc: Fix count check in rproc_coredump_write()
      commit: 09dc6efba9088a84ac00bd25be36c50d0a01a4df

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
