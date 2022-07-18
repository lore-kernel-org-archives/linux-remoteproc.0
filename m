Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 2B930C433EF
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 23:00:10 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236549AbiGRXAJ (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 19:00:09 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:56034 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236419AbiGRW76 (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:58 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 6530833425
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:32 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10c0e6dd55eso27851692fac.7
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=03LF5AI/NRTuD/kyS3OgVmU6nY/7BwKmaxTyhvUPiv8=;
        b=Ksc5LSfoveTc5spzX5+RHcF06T0ME6J9F+KmQmCChPqrUcOSWXBKjzGEMAOBeofcOT
         Y/DGf0P3FZJECh8tpUplIwS8GxduPhfhcm0jjci4dLv2s4oZIUiu5mjg2AxMu+dTuuKe
         IED1DJAy+EPEteErMxPgYhpv70NK5ww6FGWlk9+XaBC0CkCTJtqWPQ8yLSY0J0BF/CTr
         ascKv/uw4tEIVk37CWiW5fjMscttD1Bx+BOI3pkclbmljHGfamgaZvm5Cmsj8tXDWymh
         u4nfnFqDE2H2n4CQAfpd9iNHnnJ498j/0c+EPvV0KSzbieMoCvA20tP/bIlTaAQsAlCl
         kgEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=03LF5AI/NRTuD/kyS3OgVmU6nY/7BwKmaxTyhvUPiv8=;
        b=67TnmoyyG6W7sk5sGWFh8G6ZcsewdkK5XFX+hDinVxNE6tq+VZcEPWE9O/oHx18Hjj
         5QyN58t3EwLoWyo9PX9x0ZrPrsCH25BcKMVor6o+hZuoNelPRpgsFgXa1jjVtlVqdk3w
         ewR+rw4cXNGi2jkZC23K3hbLADdkN412zTFUS0kxMfqeGs1soSq/otZWbgIlqfTZEI1x
         3M21utSkl+00RAcKbBlLSTX80oCs7HGY29ctYGRFrOx907V3OEk+8UDNaaNf/OGebWol
         DDDN6cTOjUJKPCbsCfT/IBCBlJ/g1PzIH0xkVNCZY1WZcIBrqx5Gx6Ot1uistkktqUPx
         GgVQ==
X-Gm-Message-State: AJIora9ZhUlz/yE70vyMEL6mQsMNKlCebE1Zb/RYEIqT8xG1XU0QwrNi
        6V/NtwW5QqLYqycmhgsvozu5DQ==
X-Google-Smtp-Source: AGRyM1uQXJXECfVWeSDUL1gakmAAxWhayKcDa92Y0JVrAm78oukdolXUfwGG6P8vFuqc1xkizr7qjw==
X-Received: by 2002:a05:6808:18a9:b0:339:f385:a7c9 with SMTP id bi41-20020a05680818a900b00339f385a7c9mr13967278oib.242.1658185170485;
        Mon, 18 Jul 2022 15:59:30 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:30 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, mathieu.poirier@linaro.org,
        zhangxuezhi1@coolpad.com
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: Re: (subset) [PATCH] rpmsg: convert sysfs snprintf to sysfs_emit
Date:   Mon, 18 Jul 2022 17:59:15 -0500
Message-Id: <165817634388.1905814.15887899020372976123.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220607120649.78436-1-zhangxuezhi1@coolpad.com>
References: <20220607120649.78436-1-zhangxuezhi1@coolpad.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 7 Jun 2022 20:06:49 +0800, Xuezhi Zhang wrote:
> Fix the following coccicheck warning:
> drivers/rpmsg/qcom_glink_native.c:1677:8-16:
> WARNING: use scnprintf or sprintf
> 
> 

Applied, thanks!

[1/1] rpmsg: convert sysfs snprintf to sysfs_emit
      commit: 7113ac825371c17c15e2d0be79d850e5e16d3328

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
