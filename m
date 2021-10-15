Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B832EC433F5
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9EF4060E97
	for <linux-remoteproc@archiver.kernel.org>; Fri, 15 Oct 2021 17:23:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S237430AbhJORZU (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 15 Oct 2021 13:25:20 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:40128 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S242235AbhJORYx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 15 Oct 2021 13:24:53 -0400
Received: from mail-oi1-x230.google.com (mail-oi1-x230.google.com [IPv6:2607:f8b0:4864:20::230])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4F2C7C0613EE
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:23 -0700 (PDT)
Received: by mail-oi1-x230.google.com with SMTP id o204so13982476oih.13
        for <linux-remoteproc@vger.kernel.org>; Fri, 15 Oct 2021 10:22:23 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=UQGBuMylvu9UpPG16xaz7lVAENRpwI6V6j3bp4rN4V8=;
        b=Z32jp32n95zqUqhWkMrX4wuXD7gqEWBUoQ3lI3z+JPu9Fqs8D/TCdHv+/oKcxvuVsG
         5MY5DZtqjnWF45OCt8tP248VQrelq4DcFwkxYxGoVTrSToE2pBu0O0A0l0XVWNAN3fUG
         efgStWf1jtSTQp/PZpdavWMCawX29qpoDDGIaIRW+/soU9tgtY1BRlAkbEL0t6dhAk+t
         tWgdSnaMz4d9TWk166bIDJh2rApyQi8cTisbI8ueK6nyA3KDTjHFCzw/kI+XWq6torNd
         dg4vCsPgcBUuRrHxqxYrOPAMIheidts6ccxkhsuxY4Hl0wrvmGuY6We0/7bjZ2B5hzDW
         aRlg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=UQGBuMylvu9UpPG16xaz7lVAENRpwI6V6j3bp4rN4V8=;
        b=tcS0QUpObxcEPS16VHhz6RqD2et1H6HwDhf3dWjg1vRAqt6QV5A+/j1wPX8XAjAuff
         NXTKK9iIO9VRPAWScMYKyzOEbsJa15BvAJveeD9Zlzdep6gC5pq9ahzoXX9Oqd6/smBa
         IoHU0Qd8Nxl4Zov6lbgI706u1rg7QlXxMVJ6ix3R9V/3wxH5sCbOTJQO4Gig8Uiwq/78
         QiajsdVWD9YFq4TYhE8m8vMMiXFpD0BatJsM6X+P+U9lwoPvtT7FOmHPcTO1qyLyz6dU
         WHxTPEEAk2d3hzb3Cm47/MbJchRGUhy8kMbGo+jYJimXGp17Jli5P6BgwmKwqHqDbUca
         +LVw==
X-Gm-Message-State: AOAM533jYOxlIbqtm46NT2WIMw2ulSP9DSwLHXGuIsoLXc2iSzf+dQeZ
        3Le4eYNbGO4/4dDsnnyoZNZXR2G2FVruBQ==
X-Google-Smtp-Source: ABdhPJwa8s1a0Vpv49BVQ3zzH13cErd4RoRJClmYGmIqUl6vc5OL2TMuNEsVurpHsk1CKWr2KKNkXw==
X-Received: by 2002:a05:6808:1802:: with SMTP id bh2mr8031298oib.142.1634318542710;
        Fri, 15 Oct 2021 10:22:22 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id s206sm1289635oia.33.2021.10.15.10.22.21
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 15 Oct 2021 10:22:22 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Mathieu Poirier <mathieu.poirier@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>
Cc:     linux-stm32@st-md-mailman.stormreply.com,
        Rob Herring <robh@kernel.org>,
        linux-remoteproc@vger.kernel.org,
        Stefano Stabellini <stefanos@xilinx.com>,
        linux-kernel@vger.kernel.org,
        Bruce Ashfield <bruce.ashfield@xilinx.com>,
        Christoph Hellwig <hch@lst.de>
Subject: Re: (subset) [RFC PATCH 3/7] remoteproc: Remove vdev_to_rvdev and vdev_to_rproc from remoteproc API
Date:   Fri, 15 Oct 2021 12:22:12 -0500
Message-Id: <163431847249.251657.1509146684272045901.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
References: <20211001101234.4247-1-arnaud.pouliquen@foss.st.com> <20211001101234.4247-4-arnaud.pouliquen@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 1 Oct 2021 12:12:30 +0200, Arnaud Pouliquen wrote:
> These both functions are only used by the remoteproc_virtio.
> There is no reason to expose them in the API.
> Move the functions in remoteproc_virtio.c
> 
> 

Applied, thanks!

[3/7] remoteproc: Remove vdev_to_rvdev and vdev_to_rproc from remoteproc API
      commit: 9955548919c47a6987b40d90a30fd56bbc043e7b

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
