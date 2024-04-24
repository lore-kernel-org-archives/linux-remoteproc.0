Received: from mail-lj1-f171.google.com (mail-lj1-f171.google.com [209.85.208.171])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4033158DB8
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 09:28:03 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.171
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950887; cv=none; b=rsmNu/y+BWOvcnJdcH3i06AcDCUcRYOY5Kc/06FPE9ldZSvyMHgMPR2NTJr+9p4ok4itUkowPAZ8tkK4S39P+c1hNqeJVQ4pwklKNXbO8yEpOgbzVswQCjNvD5uCIgZus2otFmxjNoOiD/a7jbgFEEb7LUs1B47s2kszTm1Xomw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950887; c=relaxed/simple;
	bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=BzSb6fozCFdSME+Hssll8DApv71BCpVSc3rRwQSP3M6wBGir01nK2SZ+MTrLdSD0vCZv702Kg86OG4xuiOowOfNz68nTFQ1rVQM51A1wyJl9/dmljGCBHNKM7v7+uS2GEzmZbTAqf/gCH6Gl4Aowbu3riefCchxH3yTtdDDy5Hg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=XoVFoPZo; arc=none smtp.client-ip=209.85.208.171
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="XoVFoPZo"
Received: by mail-lj1-f171.google.com with SMTP id 38308e7fff4ca-2d872102372so5676611fa.0
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 02:28:03 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950882; x=1714555682; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=XoVFoPZoeqy5o3elJP283O6pj87b+pEe15vykP9b7+wtJhP5HzJRdn8Zmvb1uOoW7i
         Y0lqqzzFwVFGeYpsEZB7XWbq2nevB1Vhbiv0G/HpFsu6dBIK781JGJvzw0jk5NEzzBsy
         HzDJM/zPNI5xUA4B4AyWl81mPr35xT7yllF/P7bncmpxqqjxLMseXdn82/OLvqbTRrAX
         iL5fvk3Z7LJNPv3qntDrFviA5QzStX24Tyo/axbnnqG3deU4Nv3nAkwP0PNHsCtBx+zS
         iYeeNZWf8otxK50aFGvfiumZobcPrVImFJ8Bt9jVEeO0pd3qPYyw2ZjpIMQXIUx+7Sn4
         4vCQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950882; x=1714555682;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=WKIDfr5zIf6Ah4i9hZjm4f94DXkgUa1CksRrZAM9u2Y=;
        b=aMezJ/AiZzZG61mHv8rUdnt5eU3iH9tQwm7ogWMuDbm9KHI0jbH0Q+0JckFv+uG2i8
         mkcMlFDUFGs0z3KgQO9pUdU9M0DSR7BA3X+Z8T014Lsi5WouLGOABTcGTIkr7jP7Hxco
         L73vSo/xUjnxdE6YufSH5PUxzTWYj5KJQBWrfoJxuVWBuq5uM8RB+J0+MrosTXRPSqYi
         21IDQXQKAo7KvRO3Womk/lPmx6BNUEc2DUMl7Vv/vT/8+0SkdYW1Wrp/Ebv5z9dZe2pN
         KZWBqL6SeFzARBtwP3ta8/0VhW467S3IDd9jAODvXZBgtJ4tgfyBpW+wfI/SINrEHFwX
         S8Jw==
X-Forwarded-Encrypted: i=1; AJvYcCXuqVY+u/1HyZaQPF3o9gMLDslMmzOb+JIhyBx6x4fQD02GdaCXyU+l2nnk5nG/ay0SLu2HWJMB8IXj1fg4BCXzqN0bDbQdEYnOZXVv8SxOAg==
X-Gm-Message-State: AOJu0Yxe+3NAnDNECuVbBVNf9P0eQ5C0PCPHrxlGkA5FLYqVJT+zwsga
	hIC2rZeelc2s4K81CFteFPBfzreQSGrpoMtjJCrBJ9CBwrFM7GbxnpQm9PkD12w=
X-Google-Smtp-Source: AGHT+IHebM75drxdOnrxsgY5l4bNvlEn1Sev4Za7ABMcDvjoldc82tcuIYbgC9vqcExAIbiS4tnQoQ==
X-Received: by 2002:a2e:a162:0:b0:2da:7932:435c with SMTP id u2-20020a2ea162000000b002da7932435cmr1669436ljl.10.1713950882166;
        Wed, 24 Apr 2024 02:28:02 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.28.01
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:28:01 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 12:28:00 +0300
Subject: [PATCH v7 4/6] soc: qcom: qmi: add a way to remove running service
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-qcom-pd-mapper-v7-4-05f7fc646e0f@linaro.org>
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
X-Developer-Signature: v=1; a=openpgp-sha256; l=3574;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=fvMToiiNdTZTq3/y+FkrPuwl0NqwcqEAFZtgK2uk0Fw=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCdpQLEwZxPfgyslqbii/uZUTzYjcRAKy4JN
 hOMIlXpie2JATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQnQAKCRCLPIo+Aiko
 1eVVCACD4gAYfHo1HZS2t0ulf3VsZtOrCvAC6LXJrVC4ifoQ1XwH/qiCi6yS8APzGyPRMzWs6C8
 PlBfdjpMAnuFEshPh5B6/LzDIwspXNcNR7zZxoP33KBuszyatGdoWJzC8zjCjZ5Z4Fvvjo/Ncm+
 JvwXZDhzXyL5ujA+yGFKvgnwKhLBTdjzvnnwzqOHhLjwIB+HU88SdJjLDJcqziNsouxj+UH9pa4
 Jbj6josUrnKkgzY6tMUU9qRUgZEBNaxBl45NpfpcXTCyY7bBO35ir48eyEJ4VscDHwF+SmXPY+e
 X/FVuibkg0H9XO4kkvvLNkaHm31vcU7bCvrDHBcv3HH4/xDz
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

Add qmi_del_server(), a pair to qmi_add_server(), a way to remove
running server from the QMI socket. This is e.g. necessary for
pd-mapper, which needs to readd a server each time the DSP is started or
stopped.

Tested-by: Neil Armstrong <neil.armstrong@linaro.org> # on SM8550-QRD
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/qmi_interface.c | 67 ++++++++++++++++++++++++++++++++++++++++
 include/linux/soc/qcom/qmi.h     |  2 ++
 2 files changed, 69 insertions(+)

diff --git a/drivers/soc/qcom/qmi_interface.c b/drivers/soc/qcom/qmi_interface.c
index bb98b06e87f8..18ff2015c682 100644
--- a/drivers/soc/qcom/qmi_interface.c
+++ b/drivers/soc/qcom/qmi_interface.c
@@ -289,6 +289,73 @@ int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
 }
 EXPORT_SYMBOL_GPL(qmi_add_server);
 
+static void qmi_send_del_server(struct qmi_handle *qmi, struct qmi_service *svc)
+{
+	struct qrtr_ctrl_pkt pkt;
+	struct sockaddr_qrtr sq;
+	struct msghdr msg = { };
+	struct kvec iv = { &pkt, sizeof(pkt) };
+	int ret;
+
+	memset(&pkt, 0, sizeof(pkt));
+	pkt.cmd = cpu_to_le32(QRTR_TYPE_DEL_SERVER);
+	pkt.server.service = cpu_to_le32(svc->service);
+	pkt.server.instance = cpu_to_le32(svc->version | svc->instance << 8);
+	pkt.server.node = cpu_to_le32(qmi->sq.sq_node);
+	pkt.server.port = cpu_to_le32(qmi->sq.sq_port);
+
+	sq.sq_family = qmi->sq.sq_family;
+	sq.sq_node = qmi->sq.sq_node;
+	sq.sq_port = QRTR_PORT_CTRL;
+
+	msg.msg_name = &sq;
+	msg.msg_namelen = sizeof(sq);
+
+	mutex_lock(&qmi->sock_lock);
+	if (qmi->sock) {
+		ret = kernel_sendmsg(qmi->sock, &msg, &iv, 1, sizeof(pkt));
+		if (ret < 0)
+			pr_err("send service deregistration failed: %d\n", ret);
+	}
+	mutex_unlock(&qmi->sock_lock);
+}
+
+/**
+ * qmi_del_server() - register a service with the name service
+ * @qmi:	qmi handle
+ * @service:	type of the service
+ * @instance:	instance of the service
+ * @version:	version of the service
+ *
+ * Remove registration of the service with the name service. This notifies
+ * clients that they should no longer send messages to the client associated
+ * with @qmi.
+ *
+ * Return: 0 on success, negative errno on failure.
+ */
+int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
+		   unsigned int version, unsigned int instance)
+{
+	struct qmi_service *svc;
+	struct qmi_service *tmp;
+
+	list_for_each_entry_safe(svc, tmp, &qmi->services, list_node) {
+		if (svc->service != service ||
+		    svc->version != version ||
+		    svc->instance != instance)
+			continue;
+
+		qmi_send_del_server(qmi, svc);
+		list_del(&svc->list_node);
+		kfree(svc);
+
+		return 0;
+	}
+
+	return -EINVAL;
+}
+EXPORT_SYMBOL_GPL(qmi_del_server);
+
 /**
  * qmi_txn_init() - allocate transaction id within the given QMI handle
  * @qmi:	QMI handle
diff --git a/include/linux/soc/qcom/qmi.h b/include/linux/soc/qcom/qmi.h
index 469e02d2aa0d..5039c30e4bdc 100644
--- a/include/linux/soc/qcom/qmi.h
+++ b/include/linux/soc/qcom/qmi.h
@@ -241,6 +241,8 @@ int qmi_add_lookup(struct qmi_handle *qmi, unsigned int service,
 		   unsigned int version, unsigned int instance);
 int qmi_add_server(struct qmi_handle *qmi, unsigned int service,
 		   unsigned int version, unsigned int instance);
+int qmi_del_server(struct qmi_handle *qmi, unsigned int service,
+		   unsigned int version, unsigned int instance);
 
 int qmi_handle_init(struct qmi_handle *qmi, size_t max_msg_len,
 		    const struct qmi_ops *ops,

-- 
2.39.2

