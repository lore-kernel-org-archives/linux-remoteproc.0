Return-Path: <linux-remoteproc-owner@vger.kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from vger.kernel.org (vger.kernel.org [23.128.96.18])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 66450C63797
	for <linux-remoteproc@archiver.kernel.org>; Mon,  9 Jan 2023 13:57:12 +0000 (UTC)
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S236594AbjAIN5L (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Mon, 9 Jan 2023 08:57:11 -0500
Received: from lindbergh.monkeyblade.net ([23.128.96.19]:36742 "EHLO
        lindbergh.monkeyblade.net" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S237092AbjAIN4z (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Mon, 9 Jan 2023 08:56:55 -0500
Received: from mail-lf1-x12b.google.com (mail-lf1-x12b.google.com [IPv6:2a00:1450:4864:20::12b])
        by lindbergh.monkeyblade.net (Postfix) with ESMTPS id A71282BD2
        for <linux-remoteproc@vger.kernel.org>; Mon,  9 Jan 2023 05:56:54 -0800 (PST)
Received: by mail-lf1-x12b.google.com with SMTP id m6so13048746lfj.11
        for <linux-remoteproc@vger.kernel.org>; Mon, 09 Jan 2023 05:56:54 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=4QIXkCGrGCO+u3SizDkJ91yeqoSF5YkZvVyIYnHQQQw=;
        b=k4fzAsngV/IkFiMGW3VZxpxdEdEZkKDJf1qstoEnMDVeLnxagngtuVgHMacFD/EVlo
         itezAaUjcnc6mzYcZMdqTQ9QS6PA95xfPfN384zo00MdH1k9NTNYBGooKoZgoMJTdgBG
         KtCj+BMIc0CGKy2OMp3ohvt1dZVoGk9gXz5tyy5KShAuMAeQ4FnP2qYrdEjkX1Mv2Qiw
         tN8bZ7U2xP6LxEr0Czk5zBIlVloN8dVo0Wf1zGxHFNki5GmWLqHCvdZyapJ/oaTmXuLh
         /QHdpq4KFjzwqPXWlGdwnT/VBL7A4UD0hoUlPORYEQ6c3xVxHbQPd+cCxOSx97srNhc0
         JN3Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=4QIXkCGrGCO+u3SizDkJ91yeqoSF5YkZvVyIYnHQQQw=;
        b=dUMwMEUbZv2XUQhAnD4tFDYhmJ7eeaOuC2B7wXtVwm378FLMIXP7lnSU0T+Gu0Z8l8
         ar9neBHLTomF8llbK28NW90XZlFiIVfaSfPBzcRmosPb+HqzBFbDwsQib8fG17vtRH8g
         gzkN41gSdhokExbkT3rV682LsllyKc4UcjIo3G+TGPYNkKRteATq/jsEt4eG6Rj77e9t
         MO8jDt95dHvW/P5sB/Ph2BhQxiwQmsCRapNWhrwerF16tNpk04vpBzaGePWhRjuFSqX6
         aTX39/mHFOIP/61Q336XRLv105hU0u9CCvgDVu6gPqulqWxVk1gLAoYPFnyGrJQYJf+s
         YnGw==
X-Gm-Message-State: AFqh2kpRZogwZc/AdzKI1Oa1xuwjGIPHik7h1veWIFYGyu/0OU3x0iIJ
        UDJpK68BICJK3fydyvDHIRss2Q==
X-Google-Smtp-Source: AMrXdXupfpgVnNGmxRFz4qo0sSuywQRtysN94c7O17Hns0F7P9lldjFuJY4Zg1yvPSTCaVIH+dg3JA==
X-Received: by 2002:a05:6512:2510:b0:4b6:f30c:c7a9 with SMTP id be16-20020a056512251000b004b6f30cc7a9mr23867914lfb.1.1673272613132;
        Mon, 09 Jan 2023 05:56:53 -0800 (PST)
Received: from localhost.localdomain (abxi45.neoplus.adsl.tpnet.pl. [83.9.2.45])
        by smtp.gmail.com with ESMTPSA id x16-20020a056512079000b004c89b9fb1fdsm1638226lfr.68.2023.01.09.05.56.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Jan 2023 05:56:52 -0800 (PST)
From:   Konrad Dybcio <konrad.dybcio@linaro.org>
To:     linux-arm-msm@vger.kernel.org, andersson@kernel.org,
        agross@kernel.org, krzysztof.kozlowski@linaro.org
Cc:     marijn.suijten@somainline.org,
        Konrad Dybcio <konrad.dybcio@linaro.org>,
        Mathieu Poirier <mathieu.poirier@linaro.org>,
        linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: [PATCH v3 2/4] remoteproc: qcom: pas: Add SM6375 ADSP & CDSP
Date:   Mon,  9 Jan 2023 14:56:45 +0100
Message-Id: <20230109135647.339224-3-konrad.dybcio@linaro.org>
X-Mailer: git-send-email 2.39.0
In-Reply-To: <20230109135647.339224-1-konrad.dybcio@linaro.org>
References: <20230109135647.339224-1-konrad.dybcio@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org

Add a config for the ADSP&CDSP present on SM6375.

Signed-off-by: Konrad Dybcio <konrad.dybcio@linaro.org>
---
v2 -> v3:
No changes

 drivers/remoteproc/qcom_q6v5_pas.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_q6v5_pas.c b/drivers/remoteproc/qcom_q6v5_pas.c
index f95e0229a6c1..d8a4ecec8535 100644
--- a/drivers/remoteproc/qcom_q6v5_pas.c
+++ b/drivers/remoteproc/qcom_q6v5_pas.c
@@ -948,6 +948,8 @@ static const struct of_device_id adsp_of_match[] = {
 	{ .compatible = "qcom,sm6350-adsp-pas", .data = &sm6350_adsp_resource},
 	{ .compatible = "qcom,sm6350-cdsp-pas", .data = &sm6350_cdsp_resource},
 	{ .compatible = "qcom,sm6350-mpss-pas", .data = &mpss_resource_init},
+	{ .compatible = "qcom,sm6375-adsp-pas", .data = &sm6350_adsp_resource},
+	{ .compatible = "qcom,sm6375-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-adsp-pas", .data = &sm8150_adsp_resource},
 	{ .compatible = "qcom,sm8150-cdsp-pas", .data = &sm8150_cdsp_resource},
 	{ .compatible = "qcom,sm8150-mpss-pas", .data = &mpss_resource_init},
-- 
2.39.0

