Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 372DDC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:41 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 1FAF960E97
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S242302AbhJORZr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242387AbhJORZT (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:25:19 -0400
Received: from mail-ot1-x330.google.com (mail-ot1-x330.google.com [IPv6:2607:f8b0:4864:20::330])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id CE0B3C0617A6
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
Received: by mail-ot1-x330.google.com with SMTP id w12-20020a056830410c00b0054e7ceecd88so13835722ott.2
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=A0CDMNUR71HgJrfftNYsg7DS8YRU3P+LQw0A9OhNuZs=;
        b=IDeibCWYKS2wzrbcIBkdMG5zJGKQuRj29PykyntI58zXM71JoxQftHI1AZAAnf3BXy
         I0SCVC6vz9Y0qUmiwa1pNwzmd/dmN3/r5HMm46AQsAf15Odg6AJZ2gLf5bkHeWTPUFas
         aSNYr4W9ys6LOM7gT8prX/PW51+kR0OD3Lr+vuzK1yaBYS4kxmShJyNQ/IVWbwNMrC0W
         zNpUNB+jczTbV9MQTH10vKYPk3jDA/smePzfD+8ah0LtP6MrMny05XwsqvRi3PwKkYf1
         MpG+QgvbSrIs/NFmKwwnG4f/Bq7djrGT9tCVCdqCtfRmaAiBvDUYOln1gqqF9HYV7Az/
         kL1g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=A0CDMNUR71HgJrfftNYsg7DS8YRU3P+LQw0A9OhNuZs=;
        b=5OVj0uih0nMx7z9dLzN0z0gxqtvQ1IYaUikBz/3lfO8Nvt/h3jM8Clw1IIJRc+H+iR
         tPiuIS2mhzf3F3yMATu31kkJLO9dvBjKEE48ft4MhvUZswzO1i1w8vf11i+IXPizUkFY
         iNIujgU7G8RRtSWEsuJp21JTpmXJgARiIThstaR0VSc4YukIpO0KehemfFxhqsL2VPX8
         s1KJKdjuz6tqdt9uW36xr49SzN18g8diGhGKIG7A/uS3P5lHmVnElyIq1Vy49b9Yn07b
         DjcPxEqCGI3cGGFaRQQCRnBPwuLxrRimG+Z7cIfx3WSSKfbq/YjHuvMGUkU0CSyRIHx+
         cJRg==
X-Gm-Message-State: AOAM533a8d2dvL0JZbjybsVHryTHeRKgJZ5S/X6O4n2RdAh9zqhlv98C
        u0X5OsIs89zeS//yIsf7T6J1sw==
X-Google-Smtp-Source: ABdhPJyxGxk94GNy6Cdjjf1KxdLld/ChJk7x+JXmp3sy1iARjLV2yxM35xjFreDcjAaHeyvJJ0PMgg==
X-Received: by 2002:a05:6830:925:: with SMTP id v37mr6993097ott.381.1634318547224;
        Fri, 15 Oct 2021 10:22:27 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:26 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     clew@codeaurora.org, Deepak Kumar Singh <deesin@codeaurora.org>
Cc:     mathieu.poirier@linaro.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH V1 5/6] rpmsg: glink: Remove channel decouple from rpdev release
Date:   Fri, 15 Oct 2021 12:22:17 -0500
Message-Id: <163431847250.251657.4770402105504317.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1596086296-28529-6-git-send-email-deesin@codeaurora.org>
References: <1596086296-28529-1-git-send-email-deesin@codeaurora.org> <1596086296-28529-6-git-send-email-deesin@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 30 Jul 2020 10:48:15 +0530, Deepak Kumar Singh wrote:
> From: Chris Lew <clew@codeaurora.org>
> 
> If a channel is being rapidly restarting and the kobj release worker
> is busy, there is a chance the the rpdev_release function will run
> after the channel struct itself has been released.
> 
> There should not be a need to decouple the channel from rpdev in the
> rpdev release since that should only happen from the close commands.
> 
> [...]

Applied, thanks!

[5/6] rpmsg: glink: Remove channel decouple from rpdev release
      commit: 343ba27b6f9d473ec3e602cc648300eb03a7fa05

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
