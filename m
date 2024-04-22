Received: from mail-ed1-f53.google.com (mail-ed1-f53.google.com [209.85.208.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C8E313DDDD
	for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 10:11:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713780687; cv=none; b=TxmN+LX/FEovP5j911FvO6/ui2GLleLABVfPkHcOQywrMh3oph+sDOOfFV4flIGJGmq/DffpUVDpYh1wpsTBAdNoy4GzR2zY/ja1+cHOIFOmAum7Ub/aNuVkxrSl/E3z1LKVqQeFWG8Pf9WBuBKGzN51kXgKXxuoFCt/Myuws0s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713780687; c=relaxed/simple;
	bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=Rnw+NRyT7u3lT90GrNYbfiMHhXj6K56H/8sjVZo1v5Raoh1PqjXpPefmzlztWG5lm7C6ZzFX3TE2yK64sF+QI5taZudTHefd7ROvnyrxTbuxzfRGDc/zJ0kLCPnpg/YaQzTg9Xt4233AeXwKIdInk7NBGjfc2HNKs9iRjqrCzo0=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=DQPKbtTL; arc=none smtp.client-ip=209.85.208.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="DQPKbtTL"
Received: by mail-ed1-f53.google.com with SMTP id 4fb4d7f45d1cf-56e1bbdb362so4527098a12.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 22 Apr 2024 03:11:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713780684; x=1714385484; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=DQPKbtTLvBbDha9VadoYKtxH41zdlg9NBoojaidW7S+P80ABxLVbGxpA4Bz36ykbA0
         DvTS+W+Cqd8A0OrqmrRRRLNFwklVDts1At8K0L9S9ldWxGIazY+OKNnAE1Ft+d9TFSln
         2buDJgAUSvE88aUQVHMfrpl7BH/r2KAoQqKyb2AaQhbQyOf8yuvFwxGoghNMspC3JeWo
         Uoiv4ba1yumwhKeVMyOBq20vxzFyiDm7vCRfIEK2osEa3yy0f3Xjy5+uXoiobDgZk8HD
         l2ChtHlku0nzCjan5E1pJjKYEtw8uCrm/N7p0RaYF6jyjEswf9ozKIs5Mwnva76vSrCS
         JCLQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713780684; x=1714385484;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=ZVP3aG0NcRA85ZVF6oXusqwv7tzNPZN1nlYmyccmDwI=;
        b=hbnp6BJKZHJzXcGcLtv9DiXY3DRLDZaS7eu3rqeAVmWnoBuAFJ49/TPfsohpMlGxRR
         Zt4036G/QYKjRXEJTtMPjjsLbYNbTNCXW9OJCP3aVwu4BZOps8Od32l9Qt5NA1QwIa/d
         TBufxw+EBqpyAHBWTto1SNKNdjTW5rVBz3DqT3rLnT7gXoh7VXYb1h5K+Vy/WxY8NPCC
         iLB2/1ZMk2deLPXXaHBAgvrSoDk6PpfOmUBxk9tKPPdiN6UjP0pdggkIw720e2ZH0R2h
         X8O+BL8kUQIRZijzMbZRQTSPqnSNIv6WM0NDXSUni8j9QmWhSLYuAkOtq8ecfo2QubFv
         djRg==
X-Forwarded-Encrypted: i=1; AJvYcCWCrgZtcmBZe7YEs16xdVvopK6lYrSUIChwG1DkUXqfHupd5/HJ8K2qw39XYe3neyNSnsZUEcsSZuLy8H0+Bi5b5Kz67cENk+pq9dH9b2tQzA==
X-Gm-Message-State: AOJu0YyyUx+PSE4LAMQp6//g5emzQZVm7ThR6uAlbQ6ssq5f7uzro/h0
	6gd9XoZn4Skuh3rNpILODWxgZdIrvymayQfoRm6x+01OftNAh6bYsyXmNk7IcNtvHCgBiuSsEk5
	u
X-Google-Smtp-Source: AGHT+IFxFdnRkYcU1W4A4ooegzuAxfjIJ5izaKeas+y6bhhI+7p78KcoTkLsCyqkG9X8yXVwIpByrw==
X-Received: by 2002:a17:907:7284:b0:a55:b488:27b9 with SMTP id dt4-20020a170907728400b00a55b48827b9mr2795385ejc.38.1713780684478;
        Mon, 22 Apr 2024 03:11:24 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id k14-20020a170906128e00b00a525609ae30sm5576339ejb.169.2024.04.22.03.11.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 22 Apr 2024 03:11:24 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 22 Apr 2024 13:11:16 +0300
Subject: [PATCH v6 1/6] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240422-qcom-pd-mapper-v6-1-f96957d01207@linaro.org>
References: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
In-Reply-To: <20240422-qcom-pd-mapper-v6-0-f96957d01207@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>, Xilin Wu <wuxilin123@gmail.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1515;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=OSaaTloV3qTUv65Q5MV+1+bKbdFYs/aBBRehChJIAYs=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmJjfJo7q2j3nV4epHJZNEvf4ADbpJ2bmBvOwUT
 rMmzv7+9s2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZiY3yQAKCRCLPIo+Aiko
 1YbdB/90ubMG+tEw+IBRR5eBrgSKe9wNrEzJYF2vpQ1PZ5+yC/+qC26lbgFcbNU6Uyp6rDwaX1q
 BAmorJ36hQuS55JSMZ0zoIJLgY5o9B6CU6TrBpr1TboKCLl2zy0o9RR3GattRqOJkMMQd/B+bXG
 Eem6iJJSiLsXluKdpSGQavofHGU1iC9n7UUDeTgKlqBHTq5zACoYXE9EoZ2kTp8+YZBidizn+cd
 AeztMTasfnPfUsRKPXOzT3XxuLrtq/6R8jV3bBh7+iBHJoPAsiWACJeUBr90KtFe/84zZTXUvlF
 JuKZcRQh5ETZMxZMrL4FH/24EoJ28YK7tOQcfrd5s5fOYiRP
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

