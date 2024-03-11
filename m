Received: from mail-lj1-f182.google.com (mail-lj1-f182.google.com [209.85.208.182])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8144745BFF
	for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 15:34:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710171249; cv=none; b=dUyPvXgSeM5gtIX3IbVt38+CmKRP2idivdJT0tV9VfJ+FbOa8NKfd0lGZ0rbKy1yYeFgbtgkZJH9Gjeyf1hbjCUjP11BKtn5rZocUYE274PiLUfXAR2IMjK6ZAXWAD1CkujqS1k6oWyVCWHfIeD4Xq9VYaHdeZn/7SWMEmQVEEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710171249; c=relaxed/simple;
	bh=Yvr55imNsVDZtCUiDXnycqIHGG7y4xl4lh0mVlDLWII=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=fglrCCVsbVTwXp5tNjcIaTeU5XwocjecLnUtz6DFvwZo28wud0ZYPMRPinb0fNqSSYyshqjNlaY0hUz02UxRhjh9zymqcyhAZuigK/iDq6GORmmiuRrfh7bFtiTLdKSiV5+HFh/D7rzle9HzJ9AQ4rQsQuoLMPBRb02FmWL3NTs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=BNMlqI64; arc=none smtp.client-ip=209.85.208.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="BNMlqI64"
Received: by mail-lj1-f182.google.com with SMTP id 38308e7fff4ca-2d220e39907so74004421fa.1
        for <linux-remoteproc@vger.kernel.org>; Mon, 11 Mar 2024 08:34:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1710171246; x=1710776046; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=BDtCv3rciFHV66pbjS4lehN/siYq37duyWooEjJyENA=;
        b=BNMlqI64/evGEoq15lUDEcMmSTKnfG7zNnk9BYfdhRWaHfcuB1Q/f7KR4SctRycjeD
         Vz2ryqATwhUzK5+pMpcCjmCD2y4Q5zdkjz/rIQbp/RbCk1m93AjwOlBy9rurC03QHGiH
         LPwIBKL6jpqLCgP2JVnFuz5EmEu4I/lSBlLjSe3NeTkSGkObz4hPMcBQjs5YStdTHYKh
         iehPbRZhoaSwPR5NNBxS2CWvWZK5yzjuL0nTOgJUCRjWhisrG1kry082WRzOi1lQOztR
         sLcZyk8OqWsSn16llrkt7i3Y5KSsYtfaJnCeMRTHrz6G0N9M9BCzFYTaD31aEmFeE61v
         T6YQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1710171246; x=1710776046;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=BDtCv3rciFHV66pbjS4lehN/siYq37duyWooEjJyENA=;
        b=l0REBZolJ0W3EuQpJIn4Y/ipfCXwwcNg1Jvf3El3DqG4DJg52mXHJ8YBW71yRFUpQ6
         8uJKOpfr21/FvbXVknYEYumKSS0N1QusXS2RdESy8wk+w2gs13JcyDiRhOIq03q8QH5Y
         NEoGK9leLC5YwOBI6QoD9ZCLuMfxQIXxMkcoqhQ+Ci1/rCMzO3XgwiG6mPWAGmSYlG4i
         gsoU5n7MF1VtfjIXV41wIfI9va6Efhx+eWFhe/KtILLyDl3upAsi7zyPLarbbPNdluB8
         TQhUvOXeGvhn/IWdWD1p73Oqdrl9SEmA0E1aVVQViwkdqo9uOFuDmvfCrkaqBBAK7O1c
         NdzA==
X-Forwarded-Encrypted: i=1; AJvYcCUJ1pTqiT+sioREXSp1w5ULGc4cbBWlQoU6vBes0pRec6J5m4lXONx2KLSKhHT411TqleMBFiLvqHsrrTrEkZKW/uboWoSW2OJNxdQ5Z582wg==
X-Gm-Message-State: AOJu0YxdD6z+QNFVmJnr+w1Zb+TxtS9P84tz/jMZiTxlGfyXTUZMYBtE
	wyRRwJtIq8mjd+AZnMC5zrcg0NBhekWpUE+9norKS98vdLkX5PI05Qjf2AZOFnY=
X-Google-Smtp-Source: AGHT+IF800B5kgOhgBUwkuVg8PxS6GjxrhdHn89LtgKe+MZ2BTmV3t1KFcDFa5tO4Nyynevb86AY5A==
X-Received: by 2002:a05:651c:2122:b0:2d2:d9b2:b2fc with SMTP id a34-20020a05651c212200b002d2d9b2b2fcmr735537ljq.11.1710171245809;
        Mon, 11 Mar 2024 08:34:05 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id q19-20020a2e9153000000b002d449f736ddsm119294ljg.0.2024.03.11.08.34.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 11 Mar 2024 08:34:05 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Mon, 11 Mar 2024 17:34:01 +0200
Subject: [PATCH v4 1/7] soc: qcom: pdr: protect locator_addr with the main
 mutex
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240311-qcom-pd-mapper-v4-1-24679cca5c24@linaro.org>
References: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
In-Reply-To: <20240311-qcom-pd-mapper-v4-0-24679cca5c24@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org, 
 Johan Hovold <johan+linaro@kernel.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1963;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=Yvr55imNsVDZtCUiDXnycqIHGG7y4xl4lh0mVlDLWII=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBl7yRr1/mDodIBknlWWj89C3m9SkLJxUu7trE/Q
 mSfhxmz84yJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZe8kawAKCRCLPIo+Aiko
 1aIACACIrbNw5GJDHmTU66rg83e/ykrH001awbmBCzgy86JYe7DVZrFhyBzzKnchoQ0ic/9VGq9
 OU9T+S2Dx8hIf5053vlXBztDvo1lD9p6yWRDbDs9Vp5H9uF2K2Rq4Ag7+5iVpbr3+OVuWuFyPdQ
 s7EyAPbRJOuLl28Ztkvn5u8z0ri35dzomhyGfmLGrdM68jlaBUNhurgMJn6S2VuxOeA1kkGyl0z
 IdIwgLimdh4aE+hHzZ4vTvQoN6WmT1cmj6bQLSh5SzGyJru2PYahPC1drzpb5+lR4sTQkyjvUTR
 TptW+GQw1hZGZwvBwwREaXMkAf7ibdfxr/wtxaZmkM1gwZZS
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

If the service locator server is restarted fast enough, the PDR can
rewrite locator_addr fields concurrently. Protect them by placing
modification of those fields under the main pdr->lock.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 6 ++++--
 1 file changed, 4 insertions(+), 2 deletions(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index a1b6a4081dea..7b5fdf9fd3d7 100644
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
@@ -133,11 +133,13 @@ static int pdr_register_listener(struct pdr_handle *pdr,
 	req.enable = enable;
 	strscpy(req.service_path, pds->service_path, sizeof(req.service_path));
 
+	mutex_lock(&pdr->lock);
 	ret = qmi_send_request(&pdr->notifier_hdl, &pds->addr,
 			       &txn, SERVREG_REGISTER_LISTENER_REQ,
 			       SERVREG_REGISTER_LISTENER_REQ_LEN,
 			       servreg_register_listener_req_ei,
 			       &req);
+	mutex_unlock(&pdr->lock);
 	if (ret < 0) {
 		qmi_txn_cancel(&txn);
 		return ret;

-- 
2.39.2

