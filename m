Received: from mail-lj1-f173.google.com (mail-lj1-f173.google.com [209.85.208.173])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7D08A158D9C
	for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 09:28:02 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.208.173
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713950884; cv=none; b=r6WT/cGVEFzQH79e+POoPXmQ23KBXUUUwnf6rkl99vesVcl3OvC2rNKZYbIEdFSiuRfiyIM48j+LGudaZ7V7/oXM6vAI5yEwzXk6yu/R7Ei5wZ7eeeZbn217Eo6ow7PznHmSK34p2Izj2xfbURWVNYKC1vJLz+rTxjZ7E6k9PYs=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713950884; c=relaxed/simple;
	bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=qZs7YWC8DMksfUuM0tVVXunWmq58z8Z/IZ9hMkEBwzrg3tp4zT5keE4YNEOj37IqvASvJjN75xb6+AczXHoTEYNVdaoO+HxwVLFekyTYkYRa7oWXOQDdBqD+WbTHPie5wZqU2NyWqN5Q8fHe5B6bHXFA2Zsacp5Qi+ueUXMPTY8=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=z8vjBZ1C; arc=none smtp.client-ip=209.85.208.173
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="z8vjBZ1C"
Received: by mail-lj1-f173.google.com with SMTP id 38308e7fff4ca-2d9fe2b37acso89724341fa.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 24 Apr 2024 02:28:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1713950881; x=1714555681; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=z8vjBZ1C8RkctPXh/FBtpLR6O1IAG9HA/oiCJaAkfVfJq9P06Oip/lw8lz3vwYDct/
         JqcJzWGDRP/JQ9OlnFdol2tohcooVWv3BZfxnT+cGBwlJOS5EYORLTZ2/7WJHO54+MVl
         DfdJiA4ftvExCE+hsUdJS9/2F8v/H+bE5FaaF9C1x6KAqct1PPNdqy7B99gnC7Ni4Zlb
         wNqyvXQ2hPGfUFsWv8BNHZdHLoqqS7ISP0yJZZW/JO5llO+cvFcL4+6cXF+qCAq5Epwo
         mrR8kMjDTyuCOjp3jkPjq3fC0ZZeQAXMc0v7kcYAF8V8wCnWlpJ5o32XYtIGv5/LfYsj
         5FZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1713950881; x=1714555681;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TM1RhMLiz+lI7GOe6oFw/63N/y/J+ZLWylZ/Uc+1/88=;
        b=kt/zNqeEG54FBxBudbyjPpGzeKE52RJUcO/qN566Gl5uW4vWzbjbEcwGB/4BaXeOJt
         JwUr72M7yKVH7SQWzhUKxJUlfNNi41Th5FCOX3TtXsRaTdRO3hc621ItBF8h8CkdatwS
         sXryEhAgPFWsA3y+04PFHp70hXOndp7iWjeoIVH7LqVOnk6bIwPfHr2fAVvwbgQ5jxwQ
         gfUtdx9d+e9oQ+mZ+iVVghmKOYEXCl+cB1+3rJBrLsKiseiK116K5Pm7zM76oFssVtco
         Ru9np8exeqfJFVn6Pu+VkJ5F4alocYc+CWKfdOTQRLee/Z+m+378w9Lha3cJUHH1u/Ge
         Fd4A==
X-Forwarded-Encrypted: i=1; AJvYcCXwnF5Kwl6dW1w1cOEkgV8YAC4z5oPuv2R68H/eaVhDaIZ9McOHCkSgVBgNbkLB4bjj3K8Q3FBc2KH7c2U27OzZtQ2//PZjKHOcdmiR3WTNIw==
X-Gm-Message-State: AOJu0Yz+yX485hds97ZYbaTnCbCZE4wrO0RRMoTt0G5tspGmSHhZAAhC
	gBuRO80E7ZiE33sp5wnnbveabknn2URnTwYfQ7PtJcVgFVfFUbzePtmAbY+a2YI=
X-Google-Smtp-Source: AGHT+IEAp8nZV55Ea8v7RVrBhb7Gowkz9/j9s/q9S6Dm03XeIJxqpk9VYAwXR+lv8yfvk8Ydt0VXoQ==
X-Received: by 2002:a05:651c:a07:b0:2d8:8b7:76e3 with SMTP id k7-20020a05651c0a0700b002d808b776e3mr1295176ljq.11.1713950880665;
        Wed, 24 Apr 2024 02:28:00 -0700 (PDT)
Received: from umbar.lan ([192.130.178.91])
        by smtp.gmail.com with ESMTPSA id u2-20020a2e8442000000b002d8744903ebsm1916849ljh.68.2024.04.24.02.28.00
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 24 Apr 2024 02:28:00 -0700 (PDT)
From: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Date: Wed, 24 Apr 2024 12:27:58 +0300
Subject: [PATCH v7 2/6] soc: qcom: pdr: fix parsing of domains lists
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20240424-qcom-pd-mapper-v7-2-05f7fc646e0f@linaro.org>
References: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
In-Reply-To: <20240424-qcom-pd-mapper-v7-0-05f7fc646e0f@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Konrad Dybcio <konrad.dybcio@linaro.org>, 
 Sibi Sankar <quic_sibis@quicinc.com>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-arm-msm@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-remoteproc@vger.kernel.org, Johan Hovold <johan+linaro@kernel.org>, 
 Xilin Wu <wuxilin123@gmail.com>, 
 Bryan O'Donoghue <bryan.odonoghue@linaro.org>
X-Mailer: b4 0.13.0
X-Developer-Signature: v=1; a=openpgp-sha256; l=1042;
 i=dmitry.baryshkov@linaro.org; h=from:subject:message-id;
 bh=5hXnO01E2x9fmcS8/rZbJSCLl/2FJgazSpXgDUcXmNU=;
 b=owEBbQGS/pANAwAKAYs8ij4CKSjVAcsmYgBmKNCdjPzh1RhSMDi5ACP/R/NigByM21a/gxczI
 KZtlShYs+CJATMEAAEKAB0WIQRMcISVXLJjVvC4lX+LPIo+Aiko1QUCZijQnQAKCRCLPIo+Aiko
 1SUHB/9VpK7m8nDCqb/wgz4/lKJZlCPoXvQ/8CpjWUapCHIgqEUJfeRIjO8zvxjFWlNziRmlCGH
 Ox8OzXtuOO3186ZsaKm9FgA4SxNd4X/WxAE+46FAXBVOan3MXhr52C8EyS8YZI++w9/yXuea7Eh
 OQxnEhutLAXQOX3B+2wY+6Ge7Ps/87y2QeTeXg/TlYB5eQTNxMtFHWgcC6KRvveKkaXZRu4jONv
 PFb3cDP4uO1lXyu0xUu/a/QbSRT1i7+na1AT/idEKNIxuFggsow7+RyF7eQFjgoxBphi8ca7sIl
 G2OmssTI+HsQlmEINPOmJ/tn2i+pMVU8m8FOYYpYjUfsFu60
X-Developer-Key: i=dmitry.baryshkov@linaro.org; a=openpgp;
 fpr=8F88381DD5C873E4AE487DA5199BF1243632046A

While parsing the domains list, start offsets from 0 rather than from
domains_read. The domains_read is equal to the total count of the
domains we have seen, while the domains list in the message starts from
offset 0.

Fixes: fbe639b44a82 ("soc: qcom: Introduce Protection Domain Restart helpers")
Signed-off-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
---
 drivers/soc/qcom/pdr_interface.c | 2 +-
 1 file changed, 1 insertion(+), 1 deletion(-)

diff --git a/drivers/soc/qcom/pdr_interface.c b/drivers/soc/qcom/pdr_interface.c
index 19cfe4b41235..3c6f2d21e5e4 100644
--- a/drivers/soc/qcom/pdr_interface.c
+++ b/drivers/soc/qcom/pdr_interface.c
@@ -415,7 +415,7 @@ static int pdr_locate_service(struct pdr_handle *pdr, struct pdr_service *pds)
 		if (ret < 0)
 			goto out;
 
-		for (i = domains_read; i < resp->domain_list_len; i++) {
+		for (i = 0; i < resp->domain_list_len; i++) {
 			entry = &resp->domain_list[i];
 
 			if (strnlen(entry->name, sizeof(entry->name)) == sizeof(entry->name))

-- 
2.39.2

