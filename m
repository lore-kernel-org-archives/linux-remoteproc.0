Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id B8F87C433F5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:38:14 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id 9C7BC60FE8
	for <linux-remoteproc@archiver.kernel.org>; Mon, 25 Oct 2021 23:38:14 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235223AbhJYXkg (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 25 Oct 2021 19:40:36 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:53224 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S235198AbhJYXkf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 25 Oct 2021 19:40:35 -0400
Received: from mail-pf1-x42f.google.com (mail-pf1-x42f.google.com [IPv6:2607:f8b0:4864:20::42f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A1F2DC061767
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:38:12 -0700 (PDT)
Received: by mail-pf1-x42f.google.com with SMTP id x66so12405884pfx.13
        for <linux-remoteproc@vger.kernel.org>; Mon, 25 Oct 2021 16:38:12 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FVNHzgpRJHqYjldy5FAUg1eLIzvHnEuecgAjYnV10E0=;
        b=WXAw0TAdf6nkxfq+YBDGb9BESm4cbE1kM2UImsCfsIOqH02O8uGLwWdv5e3cC+HUwg
         6s3vYcfvg/R0OiP3iyHgd6qGxVEJiLHjwQQscsGyhw2/DosoUw9FD7wk8HmgQ9j8SZyt
         EIMwIlH/kAHLTFvamV08RnRlLLcthRyNM7nZQ=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=FVNHzgpRJHqYjldy5FAUg1eLIzvHnEuecgAjYnV10E0=;
        b=aP2nIjjnhHGj2NKwtts2uODIRkT+/Ki38bohrUgU/f8HrAhcQciq1fpQMfGD5BOoHm
         qtGrHspQ4JyiYndzRNm2lNRB3DdMO8bY+caCQBXU5Fv2ERIB9HanVK0zKtCFOkji3uhz
         e8xkHSzIWyIuyidEJ7jSpaOF/45n4C/tVs6uBM8d48gt3Ajgsb9ZjT1Ad6iRnBKjvpdo
         75cl2yg6QBG/jPxDLiYV8406VrJlTlQSe/bvDjn5Ldv3W/4jejE0kDHtLNFMUOrQOhCf
         21Imzs9QaC411IcF5dJ0P+RlPsOKw6pZwMIF6Ah1q2kHbQWdFc5+nc+vqEOMX7oP6qye
         BUxg==
X-Gm-Message-State: AOAM531NReECY3KsG6z4xl6YYRhAIxs47iLgIjQbBj+bUTvmrUt+28v7
        lXFo0lTOYjLSIz+3Y1o//ETDfA==
X-Google-Smtp-Source: ABdhPJyFAv899r0PH05U6u1PhCLhQ9++LTCO36Ww8etfBbBIMfVlNQyGK5sSSlfCVhW8Um+J7jW2yg==
X-Received: by 2002:aa7:9043:0:b0:44d:13c7:14a5 with SMTP id n3-20020aa79043000000b0044d13c714a5mr21801830pfo.86.1635205092215;
        Mon, 25 Oct 2021 16:38:12 -0700 (PDT)
Received: from sujitka-glaptop.hsd1.ca.comcast.net ([2601:646:8e00:b2f0:eac2:13a5:2214:747b])
        by smtp.gmail.com with ESMTPSA id gn1sm5954453pjb.34.2021.10.25.16.38.11
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 25 Oct 2021 16:38:11 -0700 (PDT)
From:   Sujit Kautkar <sujitka@chromium.org>
To:     Andy Gross <agross@kernel.org>, Ohad Ben-Cohen <ohad@wizery.com>
Cc:     Stephen Boyd <swboyd@chromium.org>,
        Sibi Sankar <sibis@codeaurora.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Sujit Kautkar <sujitka@chromium.org>,
        linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org,
        linux-remoteproc@vger.kernel.org
Subject: [PATCH v2 0/2]     Fix two kernel warnings in glink driver
Date:   Mon, 25 Oct 2021 16:37:50 -0700
Message-Id: <20211025233751.1777479-1-sujitka@chromium.org>
X-Mailer: git-send-email 2.31.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org


    These changes addresses kernel warnings which shows up after enabling
    debug kernel. First one fixes use-after-free warning and second fixes
    warning by updating cdev APIs

    Changes in v2:
    - Fix typo in commit message

Sujit Kautkar (2):
  rpmsg: glink: Fix use-after-free in qcom_glink_rpdev_release()
  rpmsg: glink: Update cdev add/del API in
    rpmsg_ctrldev_release_device()

 drivers/rpmsg/qcom_glink_native.c | 5 ++++-
 drivers/rpmsg/rpmsg_char.c        | 5 ++---
 2 files changed, 6 insertions(+), 4 deletions(-)

-- 
2.31.0

