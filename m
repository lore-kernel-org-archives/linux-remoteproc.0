Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 75CF9CCA479
	for <linux-remoteproc@archiver.kernel.org>; Sun, 17 Jul 2022 03:08:49 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233295AbiGQDIr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sat, 16 Jul 2022 23:08:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:39402 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S233523AbiGQDIj (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 16 Jul 2022 23:08:39 -0400
Received: from mail-oa1-x35.google.com (mail-oa1-x35.google.com [IPv6:2001:4860:4864:20::35])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id E3EBC15735
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
Received: by mail-oa1-x35.google.com with SMTP id 586e51a60fabf-f2a4c51c45so15597826fac.9
        for <linux-remoteproc@vger.kernel.org>; Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wxd2A3vrqrJp4uEK24rDCH8u8KrHdEc+rqmRMjv5vsM=;
        b=Oc9y7n1wSjfxlcoagZApdGWE1393wVgJT4hc9QksVRQtYvaM08nxFgkXS0wO3Yp2kq
         aaO6CxsHe3IYzp3UA3chNVvvELw0eU5Y0Mc5U6jT9GRlcpleoFfS8GNEXfRWqcArn/gP
         G4yGzOTqPRVEKg0Fg5wtAq85QLOBczkrpm/yGY54GKaoIPD2mibsbkG+TZGKMO/a6oCN
         TrMQhR7RDJxq0XdyzAF1GywzpOhZcfG4tz3QpDxKLP0nbCIFaq4Jsa3uKiRVYt7E8rV3
         MXKURC0wrxF5xMZu81b9P/PcFFgCWoFmp+GI9a+MUufLiHU/vI7LJuSWihp7S/u2pfKZ
         Wtjg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wxd2A3vrqrJp4uEK24rDCH8u8KrHdEc+rqmRMjv5vsM=;
        b=KImrdWuPswkjoYulMZ4Sc4QW92jCiLZly0plphfZ2hK1C7/qNj1UY3um5NZLsxgeKE
         wogujU5ubW1LwO48DWUKxJOpjQmyhg01Bu4En3F9Jb0jVYhjWo9VdlccbzZARwa4WATr
         RhieMHIjAbThOIxpe7apZkXt1z8GwlO+gx9EcJPxVdVvCJKvhs0HToNARj160ZpoGc22
         BBH1Gb6pbGbGEy8qTvaiFlVhmMvh5lMc4ekHXbZwaBhpSttNkgiyyHC9ADlNYHswrom8
         aXXXj00o+2QE6RDPfnalc6TVZ2adDuGktgJm5hI8A7ZyfFccMTg32JWEzYb/jj1JCv8n
         Scgw==
X-Gm-Message-State: AJIora9l7hEmcSbfP8yOml3fmywYDMXcNHSU6l4AcOjczVlV7E5R3/df
        HnuVoscViF3+MUbWFfehKWxObg==
X-Google-Smtp-Source: AGRyM1sGOKzmDGOOL3ZAxQHb7krIn1F6BElzw2dQZhH8qvgkf9bKPwpisj+2/yge8MsIM+PUE63T0w==
X-Received: by 2002:a05:6870:41c3:b0:10c:529c:3844 with SMTP id z3-20020a05687041c300b0010c529c3844mr10944443oac.0.1658027316429;
        Sat, 16 Jul 2022 20:08:36 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id z203-20020a4a49d4000000b0043577be222bsm3203928ooa.22.2022.07.16.20.08.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 16 Jul 2022 20:08:35 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Stephan Gerhold <stephan.gerhold@kernkonzept.com>
Cc:     linux-remoteproc@vger.kernel.org,
        Stephan Gerhold <stephan@gerhold.net>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-arm-msm@vger.kernel.org,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Luca Weiss <luca@z3ntu.xyz>, Andy Gross <agross@kernel.org>,
        Rob Herring <robh+dt@kernel.org>, devicetree@vger.kernel.org
Subject: Re: (subset) [PATCH 3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by default
Date:   Sat, 16 Jul 2022 22:08:26 -0500
Message-Id: <165802729676.1737676.7471723089108330875.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
References: <20220712124421.3129206-1-stephan.gerhold@kernkonzept.com> <20220712124421.3129206-4-stephan.gerhold@kernkonzept.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Tue, 12 Jul 2022 14:44:18 +0200, Stephan Gerhold wrote:
> The remoteproc configuration in qcom-msm8974.dtsi is incomplete because
> it lacks the regulator supplies that should be added in the board DT
> files. Some of the msm8974 boards are currently missing the regulator
> supplies and should have the remoteprocs disabled to avoid making use
> of the incomplete configuration.
> 
> This also fixes dtbs_check warnings after moving "qcom,msm8974-mss-pil"
> to DT schema, which rightfully complains that the -supply properties
> are missing for some boards:
> 
> [...]

Applied, thanks!

[3/6] ARM: dts: qcom: msm8974: Disable remoteprocs by default
      commit: 8d8be8dd7c1f5d50f84ecc7a6a41962da48c6164

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
