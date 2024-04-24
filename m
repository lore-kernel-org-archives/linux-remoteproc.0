Received: from mail-lj1-f175.google.com (mail-lj1-f175.google.com [209.85.208.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 96697158D88
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 09:28:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.175
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950883; cv=none; b=AQPDQ5LXioo4SNVcwQU1spK+ztvA/6wGSXJphteyvl8YtApMP9zQ73fsHYHvnf9dwfzs1Eifo+oH5+T4KVlXoMaADpFsfjOrTvayncSdssoshuCgf2dnG8rYRQ0q1fKHTt1viSNEM9r2Ps+XXPlBxX4LDvhAJRHOkSZWCbI9Tr0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950883; c=relaxed/simple;
	bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=cQYGzVneGhwXeVvsb7+Y9eMgSdlCllnINIEn7ymEXjwYqqNOlggntG4xM62vHejVM505EU0BRLqN64wcuM0RhMCYZWa2EL8wGeUwFvSJgET+hTA/alzGwcrDJgJBWz8jmBy5pZwJxQ3xq/HSIAr58NUy9vlju3GmMYVMIjUKcO4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=M/MM6rWP; arc=none smtp.client-ip=209.85.208.175
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="M/MM6rWP"
Received: by mail-lj1-f175.google.com with SMTP id 38308e7fff4ca-2dd19c29c41so50335881fa.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 02:28:01 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950880; x=1714555680; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=M/MM6rWPHGe+1z1kG7WfRbKOpQIUtYrHJ87JpSebFhc1hmeK3hqJ9IWXZPVaOarKGz
         ONCb35woilijVro74V9kx0K8hEeGkewZVypLPyXNqtdlZL28m6Ht+FXwQr85ndc5BTlg
         KJbAvdOIJRqH1U34kMMIOtN219X+FXlX9kTDxlPNYEZxG3h/w5FO76x72KmvuP0CPIBq
         qgbEnWNQaNL7APJ9DW8KgSbIfjrjNBSe99+lJvRdONWnnJ+Zpd//gvSiSXD2dp9f7deh
         gLtVnMJgYuB+uwY6TgFzmOTFlkcaMeKIY2YBjrfEiisC3Kcg0eEV/kIUfUiSODZG0Jl2
         qsrw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950880; x=1714555680;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=SWyRZiiEJ4LMzoY5Uv595Dr8dlsGayaXTDiueKSB6wQut3XQ1FRTuc5shJJnfypSWy
         JhRNwDYkIUtMPv6pNBnMzqfuwIeMjo2W+9WUBXq+9JnFfrlrnKNs1G9APGFKXTQIKZgc
         1vt33uuIeL0VwXnB4C2j9C+mAX/jOqZ++3OiEsTEj9kshgliYzph+frcs43te9ZLsffx
         bP4quemSdQK2ka99ue4rQa/CTXLvNppFZ1F4Phi0fkxYu8lDsR+rZzCIYwVyxqgIYKRH
         uaPVAG4y0KjG+KN/kaLKwMU7/M+/xFchMyAio2biORBYU1PX7iavO6zLp0upg+GfOXXr
         ECXw==
X-Forwarded-Encrypted: i=1; AJvYcCVTVg6Cm9imXqPQRByW+sBh6dXqF6yVN2vZom74ypeflpImfz+61hZufgR4rDQC1Q62CQxpShmy7Py+4jwImiNu5Jq4x80osLOGT7xkBrCJ0w==
X-Gm-Message-State: AOJu0Yzyd/osY1v/6iGWVAwmDcY2zHabbNTCT4x74xJ7oy9Ik+K6yOcr
	09UrGsEQAVKaga7GxW6CZ6el6bilRzxFWv5lqvsN2K7e6kSFRtxYiZWxBpqi68k=
X-Google-Smtp-Source: AGHT+IEHqr2lZGaBKa1MiPLKvem2gV6St90T7tmmwbeBqa+6DjJavqHtQEvbkp8gTXdere6jcfb+5g==
X-Received: by 2002:a2e:9a88:0:b0:2d8:da4c:5909 with SMTP id p8-20020a2e9a88000000b002d8da4c5909mr1025985lji.51.1713950879955;
        Wed, 24 Apr 2024 02:27:59 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.27.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:27:59 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 12:27:57 +0300
Subject: [PATCH v7 1/6] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-qcom-pd-mapper-v7-1-05f7fc646e0f@linaro.org>
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCdlGg7OoLB653KFzavMEguVk4v/t+HfvrEv
 KuTkp88gZmJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQnQAKCRCLPIo+Aiko
 1QhRB/wI8jCQzyswFja87BTkRioiKAY3pjM88Ho+fyDHUFV5p25Boh67bxlsLm8ryXPyDCexl06
 qJf0Ux+icXMAivSZNhXdhEXjAlK7IXAerNJuT3afPbKkmuZ6XTQTTV2R1UsqwLWweWh9RL2w5Ik
 JM3mRfbQ5RUFuOimZM73P7UXMQUdXy5/TpW4Bd9P40x4SgEfJ/v9WFPoc2FIt/Bf0jh1EA7LWt7
 2GO2kBGZzDZMpBgG/sGN6UWZrxNUpWST6YirsWIs9FYjaN60aitunxiCbCSOKSaQGgwNixnmU7C
 mDcqR98+7kCzvHPo0qzpKBzA/0y1X6W9zqCPzWErTdoMnJy0
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the service locator server is restarted fast enough, the PDR can
rewrite locator_addr fields concurrently. Protect them by placing
modification of those fields under the main pdr->lock.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 4 ++--
 1 file changed, 2 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..19cfe4b41235 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -76,12 +76,12 @@ static int pdr_locator_new_server(struct qmi_handle *qmi,
 					      locator_hdl);
 	struct pdr_service *pds;
 
+	mutex_lock(&pdr->lock);
 	/* Create a local client port for QMI communication */
 	pdr->locator_addr.sq_family = AF_QIPCRTR;
 	pdr->locator_addr.sq_node = svc->node;
 	pdr->locator_addr.sq_port = svc->port;
 
-	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = true;
 	mutex_unlock(&pdr->lock);
 
@@ -104,10 +104,10 @@ static void pdr_locator_del_server(struct qmi_handle *qmi,
 
 	mutex_lock(&pdr->lock);
 	pdr->locator_init_complete = false;
-	mutex_unlock(&pdr->lock);
 
 	pdr->locator_addr.sq_node = 0;
 	pdr->locator_addr.sq_port = 0;
+	mutex_unlock(&pdr->lock);
 }
 
 static const struct qmi_ops pdr_locator_ops = {

-- 
2.39.2

