Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id F3763CCA486
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:25 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236294AbiGRW7Y (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:24 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55176 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S236252AbiGRW7W (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:22 -0400
Received: from mail-oa1-x2e.google.com (mail-oa1-x2e.google.com [IPv6:2001:4860:4864:20::2e])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id F412C2AE15
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
Received: by mail-oa1-x2e.google.com with SMTP id 586e51a60fabf-10cf9f5b500so26725179fac.2
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=CQNKQg4/4rlYkT0pvrPfSwWDA5R5vk3Reis9j7ygfZ0=;
        b=mproMcYTqqfOtVnyqO37xGLVGbOJIBKxs8FZcEi6h8wY3JGCHOOZTooWTQx9upJO2E
         IDg062qAL1wLGfs0c27XOt7v8Qczl1dWm6gUTlF5hLxdx47uLoFehZZd4NPb34TeUD4E
         BsnXqcTtK2Gr+gV+szOatzp4c8XvGwpsYhVKsQ3+5747FIeXAgjyv3IdJzSFua8fOc9B
         iDTYG9j/xVhBWYZ3T1i0+f6V/Meb/xVvCsiyP7YML0SP8RYiuSc8mHpvf68uliDYdPkI
         ayvs0MOMVCcadH4Cvme7Dk9eUOjztC5shPXtUqvPvQkX7LXQEu48KOldhNK5jAEQI+Y7
         xLZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=CQNKQg4/4rlYkT0pvrPfSwWDA5R5vk3Reis9j7ygfZ0=;
        b=nDDTbjBKgTHkez+41d3YkKZhvvIuHz8z/4dwwPBCIakCx6/E19m6pAL+rU5UKTPI9t
         HZ5B2e4FkhJEWlqckD6oBRiwpk3ZnhI49pioxRlzoC6Pv/CljC5Ld2x4bJSaYy4iJuii
         e6uJmBHVvZp+pRqHs26yko5J8HBARwO7B2bHbdzwyYXPRSHl1grG4LIbEGciSbT+woFA
         DLgPsakiQXFvl7whyprEHVC8lWvE+AONtfjlx+Ehjy9SyXKSY+7WiCwwZLtj6Ie1eZYv
         /PsLFtnqORghs4lL1SisSn+eY17yx/S8xscMLvhvZAWf+oC/ptPG3Amdhlq1besk3gaV
         asbg==
X-Gm-Message-State: AJIora9zCPeVJPLs8eb3I32fhATgSRaijMQFd6JVfKlc1mU7u308kfkq
        43fEbfqqvcVRAjNM4s6AJiLvaynuXu7xUQ==
X-Google-Smtp-Source: AGRyM1sYrhGIP2I3RKA0sIjDmB3B4FJ2ovcm9+EUBuukF3UC9eAcuhovugrFaXOPgYXTS24tMAJI9A==
X-Received: by 2002:aca:f00a:0:b0:335:2675:aa14 with SMTP id o10-20020acaf00a000000b003352675aa14mr14870356oih.206.1658185160393;
        Mon, 18 Jul 2022 15:59:20 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:19 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, konrad.dybcio@somainline.org,
        mathieu.poirier@linaro.org, dmitry.baryshkov@linaro.org
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
Date:   Mon, 18 Jul 2022 17:59:05 -0500
Message-Id: <165817634387.1905814.7290372787603141520.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220704162202.819051-1-dmitry.baryshkov@linaro.org>
References: <20220704162202.819051-1-dmitry.baryshkov@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Mon, 4 Jul 2022 19:22:02 +0300, Dmitry Baryshkov wrote:
> MSM8996 follows the rest of MSS devices and requires a vote on MX and CX
> power domains. Add corresponding entry to the device data.
> 
> 

Applied, thanks!

[1/1] remoteproc: qcom: q6v5-mss: add powerdomains to MSM8996 config
      commit: f8272a502d601d74aaa21c35aa73904bcbcd6b84

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
