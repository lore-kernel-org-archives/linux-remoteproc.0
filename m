Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 8AB48C433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:47 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 6FFCA61151
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:47 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242498AbhJORZw (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:52 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40242 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242347AbhJORZZ (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:25 -0400
Received: from mail-oo1-xc2d.google.com (mail-oo1-xc2d.google.com [IPv6:2607:f8b0:4864:20::c2d])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 96EA5C0617AF
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
Received: by mail-oo1-xc2d.google.com with SMTP id a17-20020a4a6851000000b002b59bfbf669so3199851oof.9
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=kJaOC+igESCxHZ0vSXJ7r3WczPiGs7VUV72llPTS2Uk=;
        b=A+aVvtFyb8ZzRtWmDzfa0VG6m5m4ixVZqdZL3S7A65QKwyzPJw22PbxU3xVHazGm9R
         gSmmpldx8T7i8XJssZooB9Cg18uPB+UOETODn9SpBtw5rKCox7UYjbpOpOR8bWgYKznr
         qpSsYXnA5H/7MGyEbgczWuxqaXxbH8f9fRbIqc3Lf4sAyLySXIFpwo8kIqGShi7EWZ9d
         skqRN9I3HI6yuc2eIvOBLKXtw3cY7bNrnHXd6zJqZviQglX1A3iyLFX6+rUyJXRDzfqv
         m50wiFxiUxls3fnjiVZFeUJzJnCZ2UspX1y6s2B7/rvQks6+O2iM1G57dog9O6y0/VQz
         BDWg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=kJaOC+igESCxHZ0vSXJ7r3WczPiGs7VUV72llPTS2Uk=;
        b=s0AeoWinPGUDRFoxOUmT4acHYW2aznR/qeLe1QW5u4+wFlTBHzz3cgMI4SmC/nUvRs
         FC+0IQTscDYxQJNDimY1fbkifm40OHEEbIkxiBPa/BeGlQuRo8xUUC+IrsA07Py8G9v5
         VN1B2WMuKYpmsn2cnhSzS/kacFDh3DU9/c00riKffF4CTA48r3Skq+spXJGVUC3Yuvr4
         ilzqTjPoN1dX8krEWK918xFZ7QwSs8VcqpunEqwgWso7GK7JxKwkX8FA8dAXCbcUNCZL
         Vv6IEwNv5e7wzrSyM/e5ZzHGb5DXTuyFKCmFFDsdKM1J6xWT4pJgAZ8iKXklK4XAsIwg
         2jDw==
X-Gm-Message-State: AOAM5300gY64+V4103xP2LNN0B+6cO6GKYHr5Kz3PeZn4sFzsg23APNm
        7Jd9/J0B6rKqMBMINShlNbjdJFHv1OwUmg==
X-Google-Smtp-Source: ABdhPJzAgZdCsdlc8CdqRpH5laQZnFJ2Ly1chA6vVUc/nvd52UGsVuCVUlWZXSr1DTZCvOIMT6rQLw==
X-Received: by 2002:a4a:d5c8:: with SMTP id a8mr9422889oot.18.1634318548918;
        Fri, 15 Oct 2021 10:22:28 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:28 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     mathieu.poirier@linaro.org, agross@kernel.org,
        zhaoxiao <long870912@gmail.com>, ohad@wizery.com
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom_q6v5_mss: Use devm_platform_ioremap_resource_byname() to simplify code
Date:   Fri, 15 Oct 2021 12:22:19 -0500
Message-Id: <163431847249.251657.1271402903289939838.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20210906071147.9095-1-long870912@gmail.com>
References: <20210906071147.9095-1-long870912@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 6 Sep 2021 15:11:47 +0800, zhaoxiao wrote:
> In this function, devm_platform_ioremap_resource_byname() should be
> suitable to simplify code.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom_q6v5_mss: Use devm_platform_ioremap_resource_byname() to simplify code
      commit: 9db9c738ac89fb1c408c4ec819633540856ea62f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
