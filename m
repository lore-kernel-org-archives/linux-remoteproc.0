Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id A3EDEC43334
	for <linux-remoteproc@archiver.kernel.org>; Sun,  3 Jul 2022 04:00:51 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S233024AbiGCEAr (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Sun, 3 Jul 2022 00:00:47 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:58062 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S232798AbiGCD7l (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Sat, 2 Jul 2022 23:59:41 -0400
Received: from mail-oi1-x231.google.com (mail-oi1-x231.google.com [IPv6:2607:f8b0:4864:20::231])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 3C809DF11
        for <linux-remoteproc@vger.kernel.org>; Sat,  2 Jul 2022 20:58:00 -0700 (PDT)
Received: by mail-oi1-x231.google.com with SMTP id l81so8914176oif.9
        for <linux-remoteproc@vger.kernel.org>; Sat, 02 Jul 2022 20:58:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=eJ/HSOVi6T6+W5It4M/UYPcXmqIF2IGyMOvm2eYN/hg=;
        b=cPQGTSOZ9AG/DoR8s7YJk3MwgY/duECkhznMoQhV9VHOHPgCoKbhkeSQkaUEZLdUJv
         3kgb76sBG6wvqrVmvtWi67t17x4cm43Ga6124GkiDF7MgM7y+Lsnj/z9MHXl1B50RysP
         Mote2c/eCti6U3mS2V53GpevNTPSSjowsciZk/sf+oY6dTzqLPT9I4SiaeLs5/oTJSun
         IH/rlva/UrvwoZasNHEfWJgZk3QwMWMcJYQGTCFkRvahN+MRKze+4fqfL6aGf0fZI0jq
         ioD0PhcNLqM/0Be1rwOVctffCJDVsMmSRUagjJb82X6ClUp8TTWRhA7oLU+fSh0EZRss
         VMDw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=eJ/HSOVi6T6+W5It4M/UYPcXmqIF2IGyMOvm2eYN/hg=;
        b=ojHA2OYCMGfcgyxCby4k8mpnyEXSGMO5xqcp/qxdFi2L2n6opqF/oX7dCSNJYBdmvo
         bTyW1JCfsY4Yhoy60XsyGC1j6IOIzEIqrDVwij+MEpaeWx1eNG75F7mnnzc2EM00zr3A
         63RLDPwPRJ+baz6NAngjn7oPWhAgfoF50jrDS7ebywITARxAC/6WM9BY10I2SfI2k1Xv
         f86Q8a8kNSmS6caJxni3Ul5fGJXP24UhmysXKJqpWlul3a3awRV1Q4nWWAJHCsen/sQC
         VXXDdyYTCboXjnGXSVAnVB1+w+Rw0bM/SjrH1xW6xrFQZO9WVIpNOCuJxr2i/PGCWo3y
         0rFQ==
X-Gm-Message-State: AJIora/E26cH+GWTtEPD1cHofT2rSQgkKBsECuzTBbsNzCBc8nBxHU+h
        AyWo41Wffc9oaSEs/4zE1hIssm43KH2IhA==
X-Google-Smtp-Source: AGRyM1sXofxsPr+IeRS/vIyhp0YmRs7G23WDfuwp8Os14Ws4pDKs+/H7OT/xUXeyp/wv1Y7JyEka5g==
X-Received: by 2002:aca:a904:0:b0:335:5e06:1e38 with SMTP id s4-20020acaa904000000b003355e061e38mr12960230oie.20.1656820678671;
        Sat, 02 Jul 2022 20:57:58 -0700 (PDT)
Received: from builder.lan (104-57-184-186.lightspeed.austtx.sbcglobal.net. [104.57.184.186])
        by smtp.gmail.com with ESMTPSA id 25-20020aca0f19000000b0032e5d0b5d5fsm12965910oip.58.2022.07.02.20.57.57
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sat, 02 Jul 2022 20:57:57 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Sireesh Kodali <sireeshkodali1@gmail.com>,
        linux-arm-msm@vger.kernel.org
Cc:     Andy Gross <agross@kernel.org>, Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzysztof.kozlowski+dt@linaro.org>,
        open list <linux-kernel@vger.kernel.org>
Subject: Re: (subset) [PATCH v2 2/2] arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
Date:   Sat,  2 Jul 2022 22:56:51 -0500
Message-Id: <165682055970.445910.12399555371619436680.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220526141740.15834-3-sireeshkodali1@gmail.com>
References: <20220526141740.15834-1-sireeshkodali1@gmail.com> <20220526141740.15834-3-sireeshkodali1@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Thu, 26 May 2022 19:47:40 +0530, Sireesh Kodali wrote:
> The smem-state properties for the pronto node were incorrectly labelled,
> reading `qcom,state*` rather than `qcom,smem-state*`. Fix that, allowing
> the stop state to be used.
> 
> 

Applied, thanks!

[2/2] arm64: dts: qcom: msm8916: Fix typo in pronto remoteproc node
      commit: 5458d6f2827cd30218570f266b8d238417461f2f

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
