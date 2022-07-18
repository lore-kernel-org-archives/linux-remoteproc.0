Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 64EB0C43334
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:41 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236406AbiGRW7j (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:39 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55454 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236316AbiGRW73 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:29 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id C38D533348
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10c0430e27dso27907494fac.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:subject:date:message-id:in-reply-to:references:mime-version
         :content-transfer-encoding;
        bh=L2ugrH+vV2/fshk7A8AN1ZS6scfn8XmrA1rF0sehwrQ=;
        b=yuHOIPPdm19zaAsiSHjZBpRrspvcmjZpQ5R3BHnEFdLfJD8hU29D9hN8L7eKKgKQDK
         DeBKL5Cq0reAHR7SxIZcWKvZZ27NYcTBODkPPxJCRCuwHcRjEtK1xEDS5ztI/CBHgb85
         qyulOE++8gId4lqw4zQk/xwwpSbW5cx9aCvAAwH3qCpgfZ6XZLgUCzR40ztZyGYnCgjw
         3NhjcNLZ6qMs8gx4UDd5e4PAVuNG25Ey/FIGtvUj4Fg5t15rdeqGp4B57s3lzKZkpmbC
         F7fIt8CmhlY3w1OBHR5xZfFco3Ftl/kKYSlMDE6bS/65yF0XKL3sjRrngdraO+01WAEW
         5NYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=L2ugrH+vV2/fshk7A8AN1ZS6scfn8XmrA1rF0sehwrQ=;
        b=BBOgA1x4TCT5GXvmwPGTi1eJ+TEum7oNxSY2EF3tK5CcvHvQgIP7gixA6Z184QBI7I
         3ovwlqf1LWfJbfSXgE1xEE9YnOn45Gw7o3DiZiFcZucxIaAEu2rj9ZzoE78BQL4Iw/7h
         FKOKNs5yUqWumgHjzuZAcQ+zquo2BrVPAEv/t1rDOClYLQpc1kqcyJw3UDxHcx//8Omb
         3B0JAVNPoVhQ977+/EQNpu0+n4st6SPYNzMidp7l76GSrfFcsW+EBt9tsrbqaPV1C+uq
         Efh4g47KfQIhFVaYZCGgBYH7C5fJbPZMUCM2d02W1me7zYNhjWDAIDiyIF84+/tsyLNZ
         E0IQ==
X-Gm-Message-State: AJIora9wfh67n/S300Cpqc0H9ivFOSG93uOhkxnnAThQ9N+0C6ctyXvp
        UtZKbcukogOJat5oTdTOS0q6Fw==
X-Google-Smtp-Source: AGRyM1trQRwmcDs9HmVw8Wc+ZYZq17t65W0M6cKZAm/AQ6Pfd8IouTBn0qpKkQT71IdYGV4yz6jmnA==
X-Received: by 2002:a05:6870:9a1d:b0:10c:31f9:9434 with SMTP id fo29-20020a0568709a1d00b0010c31f99434mr15454682oab.233.1658185164491;
        Mon, 18 Jul 2022 15:59:24 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:23 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     linux-kernel@vger.kernel.org, linmq006@gmail.com,
        agross@kernel.org, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
Date:   Mon, 18 Jul 2022 17:59:09 -0500
Message-Id: <165817634385.1905814.17910663719629021480.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220511120737.57374-1-linmq006@gmail.com>
References: <20220511120737.57374-1-linmq006@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Wed, 11 May 2022 16:07:37 +0400, Miaoqian Lin wrote:
> of_parse_phandle() returns a node pointer with refcount
> incremented, we should use of_node_put() on it when done.
> 
> 

Applied, thanks!

[1/1] rpmsg: qcom_smd: Fix refcount leak in qcom_smd_parse_edge
      commit: 65382585f067d4256ba087934f30f85c9b6984de

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
