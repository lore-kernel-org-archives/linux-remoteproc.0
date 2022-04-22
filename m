Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5B56FC433EF
	for <linux-remoteproc@archiver.kernel.org>; Fri, 22 Apr 2022 23:22:17 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229868AbiDVXZH (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 22 Apr 2022 19:25:07 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:47026 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S230025AbiDVXYx (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 22 Apr 2022 19:24:53 -0400
Received: from mail-oa1-x36.google.com (mail-oa1-x36.google.com [IPv6:2001:4860:4864:20::36])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 2C6C31EE1DA
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 16:00:04 -0700 (PDT)
Received: by mail-oa1-x36.google.com with SMTP id 586e51a60fabf-e5c42b6e31so10106109fac.12
        for <linux-remoteproc@vger.kernel.org>; Fri, 22 Apr 2022 16:00:04 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=ElI2t4nByDOB6dr+yLR266lxMKTIEX40DDSnpkzAfdk=;
        b=AAL18eX8s5pFrRM+VhPDxLjLMGLkQCN9PL+jVRgw0V7kN4VQZrGyrC9yvnUkDDTA9m
         kUoPiX2AeDEFGlhQgafrnJM6b0hbFWx6As1XdFyzsaPMNT+LFL88wT8KL6EtbHBVMNiY
         XmAZFpWedjwOngPwoyeeBAkh1yzof7YA1rRPwXRc4zrYY9xeqwYv73OLXw569g5RyDJ/
         4UItx60O5ACzGqIv8o1yXv3z55PWWdx2axpX7VycwhT98ePwWGv8hegxjQnUJGFg1Nsc
         Uj1hIqqdCUTMkyisAjlr4sM4FbKyYp5nyDGNaJ/+DYjN1Lwjt3DbfgXDofNsTFiWo2YU
         ZsbQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=ElI2t4nByDOB6dr+yLR266lxMKTIEX40DDSnpkzAfdk=;
        b=J/jbpto2IT49hGdZjecK1guLtZq/6sM2+K0PVm42KecKnu87UTSi/Yd+foG1auRGQu
         zw7evSkZKerGqh2B7mFHXRh5Sp4C486GamGH+676lFX7V5h1Ys162+bOx6U1OGCq0FiX
         Y94Jtzkygp9HI6fAyVim+H2vwCPraxcadvKBb+FQthTqGJu0WN0ge3W1uMPulEyjIprJ
         2B9tV+l/71C/ijMISUvuDRZWTObEqwZOUbQlrWBUD+nHdmWr/2Zpp1vE4k1X/UBXvqHm
         R6ti0HFmsH8SQ5317hNRMidRjZbmUYbO4N8L/+AHpUdBCGVZBU+iLtccisQyhfJME+pi
         yrDg==
X-Gm-Message-State: AOAM533E78WBN/MdWcgNDOnNaup/ws7swhf0HGnkYgBMmzD0VQ0Mwei6
        PWFGutmXRQn5sq2h+PKniRSwTA==
X-Google-Smtp-Source: ABdhPJyhzjfmiSNV9pg+MVvlFlGDkq8CvnWd0Mwcnumh+SSclYdBOE1HNA5Unl92+fFrCF1gMYMSkg==
X-Received: by 2002:a05:6870:ea89:b0:e6:4acc:9302 with SMTP id s9-20020a056870ea8900b000e64acc9302mr3081663oap.203.1650668403484;
        Fri, 22 Apr 2022 16:00:03 -0700 (PDT)
Received: from builder.lan ([2600:1700:a0:3dc8:3697:f6ff:fe85:aac9])
        by smtp.gmail.com with ESMTPSA id v65-20020aca6144000000b0032259d24076sm1250566oib.30.2022.04.22.16.00.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 22 Apr 2022 16:00:02 -0700 (PDT)
From:   Bjorn Andersson <bjorn.andersson@linaro.org>
To:     Rob Herring <robh+dt@kernel.org>,
        =?UTF-8?q?N=C3=ADcolas=20F=20=2E=20R=20=2E=20A=20=2E=20Prado?= 
        <nfraprado@collabora.com>
Cc:     Tinghan Shen <tinghan.shen@mediatek.com>,
        devicetree@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        linux-kernel@vger.kernel.org,
        Krzysztof Kozlowski <krzysztof.kozlowski@canonical.com>,
        Matthias Brugger <matthias.bgg@gmail.com>,
        linux-mediatek@lists.infradead.org, kernel@collabora.com,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        AngeloGioacchino Del Regno 
        <angelogioacchino.delregno@collabora.com>,
        linux-arm-kernel@lists.infradead.org
Subject: Re: (subset) [PATCH v1 1/3] dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
Date:   Fri, 22 Apr 2022 18:00:01 -0500
Message-Id: <165066838719.2742284.7900096409445311556.b4-ty@linaro.org>
X-Mailer: git-send-email 2.32.0
In-Reply-To: <20220225225854.81038-2-nfraprado@collabora.com>
References: <20220225225854.81038-1-nfraprado@collabora.com> <20220225225854.81038-2-nfraprado@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

On Fri, 25 Feb 2022 17:58:52 -0500, Nícolas F. R. A. Prado wrote:
> The SCP node can have an associated interrupt. Add a property for it.
> 
> 

Applied, thanks!

[1/3] dt-bindings: remoteproc: mediatek: Add interrupts property to mtk,scp
      commit: b7da6f517214c307efece604ac9dc58dc6123c07

Best regards,
-- 
Bjorn Andersson <bjorn.andersson@linaro.org>
