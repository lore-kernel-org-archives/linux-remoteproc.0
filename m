Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EC13CC433FE
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:14:05 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by mail.kernel.org (Postfix) with ESMTP id D2E14611C5
	for <linux-remoteproc@archiver.kernel.org>; Mon, 27 Sep 2021 23:14:05 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S238226AbhI0XPm (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 27 Sep 2021 19:15:42 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39496 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S238158AbhI0XPf (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 27 Sep 2021 19:15:35 -0400
Received: from mail-ot1-x32b.google.com (mail-ot1-x32b.google.com [IPv6:2607:f8b0:4864:20::32b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 4B73FC061769
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
Received: by mail-ot1-x32b.google.com with SMTP id r43-20020a05683044ab00b0054716b40005so19724126otv.4
        for <linux-remoteproc@vger.kernel.org>; Mon, 27 Sep 2021 16:13:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=w5Ooxkd/2W1SVsL+c5obIKvuXLUkHc42IA8RpQ4EDLQ=;
        b=Z6Jv9VYlNPiF/0AetlI99EUo9Ktni9ivJQxXUhXF3l3rNQ+IPouCnzlNJV2eDkAXmi
         DRiIVhl7D9ikwaVvo8iBsNDynIqvJKVfN28rZMTJumP2dUKsTpVpwEaz1Asx2xY/T/qi
         cKDURMDxAcuPKaJkuzkN/Ywu4cEixBleADZrrQdL1+tX1ZCI2C9S8uTqSjKiR8NCDu2Y
         mT5vOttM7T9ehmWr6E8u6bCbUoSP8/SRASiyoQ24uxLaedHHNyImMeSPDA8GXlez2yVk
         o3fhw5TjetOYcQ9pYnzycepjRbtcHpUJJnVVmt5BBglmcFwCufginf3/yEXh1ziUwxyp
         0mMA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=w5Ooxkd/2W1SVsL+c5obIKvuXLUkHc42IA8RpQ4EDLQ=;
        b=CPyXX/Y7R6cb7VKEBKwLhsEIyoKbpTVFU5Jwqwh+5Xe+ENK/mbodjX3h9Wz0ZBqZc4
         r3a6Q6TZ2/ksAQRj8OilDZ2q2GbeM9mA7AubgoA3xehzpcV9bieqkNsRuhEY27qS5eyq
         JmLrrLWGyd3ncKKalJBaHg/JFSSeXvRzSPey2F/eBoheAnt3eKHeALPWxcbicaj2Cm+u
         wxfzvJtFAyw1VtQrg3FdkaAMn+8uT1k3ZLwTruphtwN7rWEb5ePpmNgwtvWCkUMoeCt6
         8pfNT/knQfLc8TbqBDyePO0Cc4XJb0fa2LWGzgi4ss+SOJnF7YEAmpCv7TJKKBtW/BvW
         epHQ==
X-Gm-Message-State: AOAM533x/NdUM6sfv6G/VZzso+DbWcwkRklVCmQpaFNcvXD4Za1s49p/
        UDfBk4rnFah5nT85Ox/2XeafKg==
X-Google-Smtp-Source: ABdhPJxeBCaW9TMScB7Aysl+CgjuywcQ9o3FrkqVMpbqGG4yG6C9KR1etUxDWenaB2Td71JySDDkeg==
X-Received: by 2002:a9d:7751:: with SMTP id t17mr2284713otl.276.1632784436673;
        Mon, 27 Sep 2021 16:13:56 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id p21sm4162268oip.28.2021.09.27.16.13.55
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 27 Sep 2021 16:13:56 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     robh+dt@kernel.org, mka@chromium.org, will@kernel.org,
        Sibi Sankar <sibis@codeaurora.org>, swboyd@chromium.org,
        saiprakash.ranjan@codeaurora.org
Cc:     evgreen@chromium.org, linux-remoteproc@vger.kernel.org,
        robin.murphy@arm.com, linux-arm-msm@vger.kernel.org,
        joro@8bytes.org, linux-kernel@vger.kernel.org,
        linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
        agross@kernel.org, p.zabel@pengutronix.de, dianders@chromium.org,
        ohad@wizery.com, mathieu.poirier@linaro.org
Subject: Re: (subset) [PATCH v5 03/10] dt-bindings: remoteproc: qcom: Update Q6V5 Modem PIL binding
Date:   Mon, 27 Sep 2021 18:13:51 -0500
Message-Id: <163278440375.1524647.11521640589539342548.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <1631886935-14691-4-git-send-email-sibis@codeaurora.org>
References: <1631886935-14691-1-git-send-email-sibis@codeaurora.org> <1631886935-14691-4-git-send-email-sibis@codeaurora.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 17 Sep 2021 19:25:28 +0530, Sibi Sankar wrote:
> Add a new modem compatible string for QTI SC7280 SoCs and introduce the
> "qcom,ext-regs" and "qcom,qaccept-regs" properties needed by the modem
> sub-system running on SC7280 SoCs.
> 
> 

Applied, thanks!

[03/10] dt-bindings: remoteproc: qcom: Update Q6V5 Modem PIL binding
        commit: b577e51c8c2afc8e00dc99c0a3bd7d67cd06de44

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
