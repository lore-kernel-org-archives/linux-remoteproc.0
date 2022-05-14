Return-Path: <linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 3A9C2C433FE
	for <linux-remoteproc@archiver.kernel.org>; Sat, 14 May 2022 02:04:52 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S229678AbiENCEu (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 13 May 2022 22:04:50 -0400
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36836 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S229703AbiENCEs (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 13 May 2022 22:04:48 -0400
Received: from mail-lf1-x136.google.com (mail-lf1-x136.google.com [IPv6:2a00:1450:4864:20::136])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id 21B844200AE
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 17:06:09 -0700 (PDT)
Received: by mail-lf1-x136.google.com with SMTP id u23so17016828lfc.1
        for <linux-remoteproc@vger.kernel.org>; Fri, 13 May 2022 17:06:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1CvvJPo1SMEVY2U38YctB/9fHmQv4dn7y8tFgTVZEk=;
        b=z0oGwMHu54BCin2PPXEa6MShFm8dXjJyFNgy0ghXHteAcGyCTA0oar+eih8/bCk54s
         jN+Urot6GEI4wyfsaybIVclOhBXqi9TiN6XEzIQ6VtNZ/WEmLF/IfVnCVZCLjUHgXwvt
         0cvGoMsYscWzHOfCsJT+IC81cBz84gxmfot5AKweJsucj8lEJxX2aIDZNue5Ncu9/6TP
         YY5RaDw8RjpFReV2xXvN5hYvtHccfoqvPFT2h1ZEc7Pb3QYnYKBJuzCvMYYhd8jMaTct
         fMRLFD6f6lxbVUi75n4juFpIZbLzhJLusXkVxnGrPeJ21wdx7NwtwrZxw2qvUNlnxref
         1AYw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:mime-version
         :content-transfer-encoding;
        bh=t1CvvJPo1SMEVY2U38YctB/9fHmQv4dn7y8tFgTVZEk=;
        b=cR0l1jnT7ayte5ww0dAhNdIvLMff8uR5xDgiRI7CpceUzq1xIHjb84kQKCetVYHrj+
         tEGrP1kXM/jzRojAYaftfeYaZ+Qv6OXf8tgu+raPsL52Su1cgciX6tl6oKqdcKCc/uG0
         MdDITOYZU4BVT9EvztRJ3HojcY0XVd92KCGG08jSw/GQaWLkmsbL9sdlReRJi0u3SJfm
         T3v8w5UTqm6YEdWL7SpwJF/eY/rr8gF52ghnazfDnCfTGdVv/Vn7SGJnQ4V/4srQRCeI
         JqdAyNH66QyO3cvAAfFhWjU5cGicWksE7iwLE+58p/4AjVSPQxVwsu4mlVgKOxEx/wmX
         jc0A==
X-Gm-Message-State: AOAM531fApEDo9msjO8MkFh/XlxWO49kriUCp5UFSI+2TxF8Rd2sB/GQ
        szV6NAD39lpFkJZdSe9dZ8XFSQ==
X-Google-Smtp-Source: ABdhPJwNTGDuEvQcrOGBBfbHwE/fQEJbVVwaNmkJ1FD4XdFxy917AOrEW6wq2Cz5Po9ds6Wryhdfow==
X-Received: by 2002:a05:6512:309:b0:472:105f:e88 with SMTP id t9-20020a056512030900b00472105f0e88mr5056462lfp.232.1652486470022;
        Fri, 13 May 2022 17:01:10 -0700 (PDT)
Received: from eriador.lan ([37.153.55.125])
        by smtp.gmail.com with ESMTPSA id z2-20020a2e9b82000000b0024f3d1daeaesm626221lji.54.2022.05.13.17.01.09
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 13 May 2022 17:01:09 -0700 (PDT)
From:   Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
To:     Andy Gross <agross@kernel.org>,
        Bjorn Andersson <bjorn.andersson@linaro.org>,
        Konrad Dybcio <konrad.dybcio@somainline.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        Rob Herring <robh+dt@kernel.org>,
        Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc:     linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        devicetree@vger.kernel.org
Subject: [PATCH 0/4] remoteproc: qcom: Add support for CDSP and MSS on SDM630/660
Date:   Sat, 14 May 2022 03:01:04 +0300
Message-Id: <20220514000108.3070363-1-dmitry.baryshkov@linaro.org>
X-Mailer: git-send-email 2.35.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Acompany existing support for ADSP on SDM630/660 platforms with support
for CDSP (660 only) and MSS (both platforms). Tested on IFC6560 (SDA660)
board.

Dmitry Baryshkov (3):
  dt-bindings: remoteproc: qcom: Add SDM660 modem PAS compatible
  dt-bindings: remoteproc: qcom: pas: Add SDM660 CDSP PAS compatible
  remoteproc: qcom: pas: Add SDM660 CDSP PAS support

Konrad Dybcio (1):
  remoteproc: qcom: q6v5-mss: Add support for SDM630/636/660 MSS
    remoteproc

 .../bindings/remoteproc/qcom,adsp.yaml        |   7 ++
 .../bindings/remoteproc/qcom,q6v5.txt         |   4 +
 drivers/remoteproc/qcom_q6v5_mss.c            | 111 ++++++++++++++++++
 drivers/remoteproc/qcom_q6v5_pas.c            |   1 +
 4 files changed, 123 insertions(+)

-- 
2.35.1

