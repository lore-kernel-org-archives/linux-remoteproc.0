Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75DA1C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:26 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236258AbiGRW7Z (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:25 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55172 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236179AbiGRW7V (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:21 -0400
Received: from mail-oa1-x32.google.com (mail-oa1-x32.google.com [IPv6:2001:4860:4864:20::32])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 019502E696
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:21 -0700 (PDT)
Received: by mail-oa1-x32.google.com with SMTP id 586e51a60fabf-10c0430e27dso27907051fac.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=NV4dJf06JpETuYEa97f8Es6YEFSzPZEdSxUhK7T8gPY=;
        b=gPzrCbF/R4aQCEbz26PodRSoEiKvAeWc04hPzE9RyiN1WMIcOjYTmF0gQXFQ6xuWxZ
         ej7u7SINT0nm+xJ3/zPHbwH3Rz6Qi+XAoi6N50Wcz91jLrsQCo06n/as8djohNYQjlJh
         579MV676S+LYuvIp3gep9qjC9J0uONFB7qXpwbp4XWYVNQlvaYsKwIkh2O1gK9lHVkLM
         YDTZFK/f4FW4t2HESTneTypMI/rf39Cn8iSCDclCZE90Nh9aSgb2UMZ5XQiOHUkJ8J6j
         Hf9X9SEQiegkx7HhkrlWCkxqHzeHV/veOlT77PjRluKAXWHCz3Dd3TJZ/ias7QU7IVlY
         19zg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=NV4dJf06JpETuYEa97f8Es6YEFSzPZEdSxUhK7T8gPY=;
        b=WN1pdI+ydm1kRfwrXzIlYkOp0kBbOtfGbx2q67lbfKgVc1r0WCqS0SobG+3IgTJrqi
         e03gCi+7UUw8KO2nfdQU/2Jy4C2Gn0N+7ttoLYPtabE25n7ZENZWNStryc1mBX1ROqYv
         uLXZdLuCaIsMMzYUH1t4tAANKS+qfa1rfyZAfGWhm5TSjx2JWCR8o8Ll+fa1g6L5FXjX
         BMFymfnh3oIdvMh1kPHgRWDyunDe1zrjjbQXDOMwoXz5J2gqntNIMTkNrCYv3z12KbN8
         PYSplI0Osfr3WjzNuD7Pf2NY4L83qZVMpBFA29mbI1q6w2878plRkFEQv4fUTWe7OFv9
         XVlg==
X-Gm-Message-State: AJIora/fZ0S3YkWXZRZ7No9sV+eEx8EHDSUVNLEShxx36gKy8TCWW/ds
        wjhkCLV+NvDTGBayAfUK46fpyrXD0CgtUA==
X-Google-Smtp-Source: AGRyM1vgx6CtiMspHJBNgKe/N241+t6rCwdY0gCPfz8aB0tXcuvxtoONpVe8nImPqBXA/YO9JvT0ew==
X-Received: by 2002:a05:6808:f02:b0:33a:59a3:3a12 with SMTP id m2-20020a0568080f0200b0033a59a33a12mr7727380oiw.181.1658185159331;
        Mon, 18 Jul 2022 15:59:19 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.18
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:18 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     cgel.zte@gmail.com
Cc:     chi.minghao@zte.com.cn, linux-kernel@vger.kernel.org,
        zealci@zte.com.cn, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
Date:   Mon, 18 Jul 2022 17:59:04 -0500
Message-Id: <165817634387.1905814.7963009931516641488.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220411013656.2517150-1-chi.minghao@zte.com.cn>
References: <20220411013656.2517150-1-chi.minghao@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 11 Apr 2022 01:36:56 +0000, cgel.zte@gmail.com wrote:
> From: Minghao Chi <chi.minghao@zte.com.cn>
> 
> Using pm_runtime_resume_and_get is more appropriate
> for simplifing code
> 
> 

Applied, thanks!

[1/1] remoteproc: using pm_runtime_resume_and_get instead of pm_runtime_get_sync
      commit: 3ebebb9a2d9a5c2d2b866739b50838dc152727fc

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
