Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 6A64FCCA479
	for <linux-remoteproc@archiver.kernel.org>; Mon, 18 Jul 2022 22:59:22 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S235232AbiGRW7V (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 18 Jul 2022 18:59:21 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:55138 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S234491AbiGRW7U (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 18 Jul 2022 18:59:20 -0400
Received: from mail-oa1-x2f.google.com (mail-oa1-x2f.google.com [IPv6:2001:4860:4864:20::2f])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 0140E2F014
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:19 -0700 (PDT)
Received: by mail-oa1-x2f.google.com with SMTP id 586e51a60fabf-10c0430e27dso27906988fac.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 18 Jul 2022 15:59:18 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=a6atdeqpTRf7cZa4d1Yxh7El3bgSgulLjp9cE9nTB/k=;
        b=Oc5g9E9Gk2r//WXCJSsGlwAOzYgPZtK7bresUOwH0y7JFnsEGTgAeOt9SsU2Cd2ZM3
         iIXFA+o2o7fmNaMlDZN7iunlZX+x+gNCJaskwYT7U5sOoA/r09t21yPe32Vqgid8EGjW
         lq7OTxhlR+BxJ1LuYWfLmL9Un7Od6G1z3KCIl5dXn2WV2w7ds7cEa3jY8SWthhH3Zmwj
         YAR7MynirecsqB9jFlKhTUwcBEozRyTb+ayKQ4o5A5uHIg39HxizVo60iZxFobg71zi8
         M/bSnY48libiu24k9Xh+9ILSVz1VrGgFV0tQy44BGoa2/HCBILdjs1K+NY96jSMYbEMa
         ammg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=a6atdeqpTRf7cZa4d1Yxh7El3bgSgulLjp9cE9nTB/k=;
        b=SuByamZdHVBBJxMI7MfdidEu0Fyj6YYGMiOlmmWRCnU9U11kMBXS+65yhX+b2eb6iC
         ZbKqiVyv4QGUx0W1IaDpvIBVBNFW7t+S+vUYWx6MBoRJG5jL4hWuAudBaXuFPWC0fvrP
         Sv80l8+CsNRfRXeSDI94Gz4PyFnyRRAmKWn1ywKD2Umh2eWXrsGILND7AlT+uJaACDvl
         ph51Or7zY8i8u9yXp0lHoa5PQFwotRvsebCvv8CUaFFzAVnNZNOTmOyCTuy6ewXuw5j5
         WKJooTHCs7JD5XNgrAL0JYSNr8CobzSjy4tvtq1/v3HXljTynj0eR+iF0mIoy2Bhtz1N
         ufRw==
X-Gm-Message-State: AJIora+mEDNgcaIK0TvJADJJIiiAOJyExF1Opx8qB7GCmbd10DXtN+kL
        qaNG/akrb7FQMh1yKU4sJzSryg==
X-Google-Smtp-Source: AGRyM1sfJepEUtV5EKxK3HZRsn0bP2byz3ZrkhPJc0Q3+R5eEMyHY7Lhelx0fG4PlG7En9RXi30Tlg==
X-Received: by 2002:a05:6870:c8a9:b0:f2:87f0:6707 with SMTP id er41-20020a056870c8a900b000f287f06707mr17930502oab.97.1658185158330;
        Mon, 18 Jul 2022 15:59:18 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id j10-20020a4a908a000000b0041ba304546csm5330931oog.1.2022.07.18.15.59.17
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 18 Jul 2022 15:59:17 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     agross@kernel.org, cgel.zte@gmail.com
Cc:     linux-kernel@vger.kernel.org, zealci@zte.com.cn,
        ran.jianping@zte.com.cn, mathieu.poirier@linaro.org,
        linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org
Subject: Re: (subset) [PATCH] remoteproc: qcom: using pm_runtime_resume_and_get to simplify the code
Date:   Mon, 18 Jul 2022 17:59:03 -0500
Message-Id: <165817634385.1905814.12595339089376725198.b4-ty@linaro.org>
X-Mailer: git-send-email 2.37.1
In-Reply-To: <20220428064545.3850057-1-ran.jianping@zte.com.cn>
References: <20220428064545.3850057-1-ran.jianping@zte.com.cn>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 28 Apr 2022 06:45:45 +0000, cgel.zte@gmail.com wrote:
> From: ran jianping <ran.jianping@zte.com.cn>
> 
> Using pm_runtime_resume_and_get() to replace pm_runtime_get_sync and
> pm_runtime_put_noidle. This change is just to simplify the code, no
> actual functional changes.
> 
> 
> [...]

Applied, thanks!

[1/1] remoteproc: qcom: using pm_runtime_resume_and_get to simplify the code
      commit: f2ac69165dd78fb905187736e65b25151377ed89

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
