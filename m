Return-Path: <SRS0=9kKd=5T=vger.kernel.org=linux-remoteproc-owner@kernel.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
X-Spam-Level: 
X-Spam-Status: No, score=-9.9 required=3.0 tests=DKIM_SIGNED,DKIM_VALID,
	DKIM_VALID_AU,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SIGNED_OFF_BY,SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=3.4.0
Received: from mail.kernel.org (mail.kernel.org [198.145.29.99])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 9A85BC43331
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:50:25 +0000 (UTC)
Received: from vger.kernel.org (vger.kernel.org [209.132.180.67])
	by mail.kernel.org (Postfix) with ESMTP id 3284E207FF
	for <linux-remoteproc@archiver.kernel.org>; Fri,  3 Apr 2020 17:50:25 +0000 (UTC)
Authentication-Results: mail.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="iVNXp3/4"
Received: (majordomo@vger.kernel.org) by vger.kernel.org via listexpand
        id S2404324AbgDCRuY (ORCPT
        <rfc822;linux-remoteproc@archiver.kernel.org>);
        Fri, 3 Apr 2020 13:50:24 -0400
Received: from mail-qv1-f68.google.com ([209.85.219.68]:39346 "EHLO
        mail-qv1-f68.google.com" rhost-flags-OK-OK-OK-OK) by vger.kernel.org
        with ESMTP id S2404187AbgDCRuP (ORCPT
        <rfc822;linux-remoteproc@vger.kernel.org>);
        Fri, 3 Apr 2020 13:50:15 -0400
Received: by mail-qv1-f68.google.com with SMTP id v38so4022303qvf.6
        for <linux-remoteproc@vger.kernel.org>; Fri, 03 Apr 2020 10:50:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=from:to:cc:subject:date:message-id:in-reply-to:references
         :mime-version:content-transfer-encoding;
        bh=wAONRYcVO4RfP3C96vLmeLLooX/mPDYTON30vhuD5cY=;
        b=iVNXp3/43clmRsJeacYyRlYtzqzS5AZhSQ+jH/korT8/ktSvyrD0uBudRLip/aSzbx
         i3fJFMr+zBwDbnWF746bGQS1W+f+TGbLCuvbuOXaXJ7ewQ7lMgSeG3Ssyee9mXg+uzVS
         Rbu0gz0chlxDH3WByItA3qxFkhkTQV85EHb3nchE3AKLKGqXg8XLT3BVF6iSXkScPZ6I
         GMlPFqHdj346kWYJfx5lGdmdWN/KtzwrrgutCoguh4oAwvmNkyu3lFIYXare2g/obs1W
         DbsJZD8F4GEDNnS/+ggh7rbgTZHuuJmelaPmCCxAVtJO4yFwtDbDtXoH01+qbqmngOAN
         j1bg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20161025;
        h=x-gm-message-state:from:to:cc:subject:date:message-id:in-reply-to
         :references:mime-version:content-transfer-encoding;
        bh=wAONRYcVO4RfP3C96vLmeLLooX/mPDYTON30vhuD5cY=;
        b=BXqAaHy7/iz6hH45wJ27BRfOK1iHNfxJOgR8mJKKlVIMHj2Fzoe58Ssosze3flkYqS
         q0Y1LWwWBC8GfIXHFROymIVtQYhkbezwdXxHTffWEHQEkGk47rDm83DlDI7/7p5qQR2Q
         scJXlZiB9HBOdb2WeMT0ILRcOa73hpcYjd17hy5D6hIFg90JRlDvwRc/OeYhwBAPJDYq
         dWS377MqYFKNJyqREY49za7HdzVkTAIRqKRVC1cnJXB+4I6lW7ze4Ou23MZ9Mu3Y/q6v
         /NifkCZAnKBejWek6Wqd4XvKuh4pKg1F7VSrhJi/A6I7UumsFyv7ByWczWbICyqC3CxV
         OrmA==
X-Gm-Message-State: AGi0PuazUhfJX3SsgSBd8B3dTnQYN2JIJPxjQeZb3dmjHCF5ku7qcXaO
        KlQw6S0bUbcPmozMdBq8y10KtA==
X-Google-Smtp-Source: APiQypJ8RDEp8OGf/STkumxgjzcqkfiVAr1Uw4MNFcGtFAkjN8HqNzwHWoaFlOk7r8uDk/0Zf+QGkw==
X-Received: by 2002:a05:6214:1583:: with SMTP id m3mr9622282qvw.215.1585936213887;
        Fri, 03 Apr 2020 10:50:13 -0700 (PDT)
Received: from presto.localdomain (c-73-185-129-58.hsd1.mn.comcast.net. [73.185.129.58])
        by smtp.gmail.com with ESMTPSA id 77sm6821225qkh.26.2020.04.03.10.50.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 03 Apr 2020 10:50:13 -0700 (PDT)
From:   Alex Elder <elder@linaro.org>
To:     Bjorn Andersson <bjorn.andersson@linaro.org>,
        Ohad Ben-Cohen <ohad@wizery.com>,
        Andy Gross <agross@kernel.org>
Cc:     linux-remoteproc@vger.kernel.org, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org
Subject: [PATCH 2/3] remoteproc: qcom_q6v5_mss: fix a bug in q6v5_probe()
Date:   Fri,  3 Apr 2020 12:50:04 -0500
Message-Id: <20200403175005.17130-3-elder@linaro.org>
X-Mailer: git-send-email 2.20.1
In-Reply-To: <20200403175005.17130-1-elder@linaro.org>
References: <20200403175005.17130-1-elder@linaro.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Sender: linux-remoteproc-owner@vger.kernel.org
Precedence: bulk
List-ID: <linux-remoteproc.vger.kernel.org>
X-Mailing-List: linux-remoteproc@vger.kernel.org
Message-ID: <20200403175004.v2y1rAbpn7GhXBy6CSVhQSIEzKrSAPO5iDlzDfCPIFs@z>

If looking up the DT "firmware-name" property fails in q6v6_probe(),
the function returns without freeing the remoteproc structure
that has been allocated.  Fix this by jumping to the free_rproc
label, which takes care of this.

Signed-off-by: Alex Elder <elder@linaro.org>
---
 drivers/remoteproc/qcom_q6v5_mss.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/remoteproc/qcom_q6v5_mss.c b/drivers/remoteproc/qcom_q6v5_mss.c
index ce49c3236ff7..60cdf699ea80 100644
--- a/drivers/remoteproc/qcom_q6v5_mss.c
+++ b/drivers/remoteproc/qcom_q6v5_mss.c
@@ -1675,7 +1675,7 @@ static int q6v5_probe(struct platform_device *pdev)
 	ret = of_property_read_string_index(pdev->dev.of_node, "firmware-name",
 					    1, &qproc->hexagon_mdt_image);
 	if (ret < 0 && ret != -EINVAL)
-		return ret;
+		goto free_rproc;
 
 	platform_set_drvdata(pdev, qproc);
 
-- 
2.20.1

