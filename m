Received: from mail-wm1-f49.google.com (mail-wm1-f49.google.com [209.85.128.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 12B8121B45B
	for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 13:09:47 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.49
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1728652189; cv=none; b=tmEpD4nMUuzWyetCtLVTLZhUH+XGV4aRD/cdBZPSWacHtpxJ2H7uvSK3yzcCgmK+iD5fzRAD1U7FSItaTRGTa745a+GM2hcmThgkVwcO3S0C7VKmESe6z7abCfEH+20GhjmjDqZBVm5yGZ0Wvo46kNxEaNWuYXLfAQReF0irUEI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1728652189; c=relaxed/simple;
	bh=aiK48nBymVvo/dH/OUWaei0T3BtvhFeLUjzn+aJU3M8=;
	h=From:Date:Subject:MIME-Version:Content-Type:Message-Id:References:
	 In-Reply-To:To:Cc; b=u4ERecqIdcuijyjRf86LjLZTe9WPyaZlizJmnhr0/EjGwe9Ed8erd6wEBrMZEJ5aP4LdGU0Lx7D4TRu1ou1HgKpzjBW+OtcvZ1wY8qI4QNT1KJQyCEQKTYsEFxvPlqHkgUOdq6d2chavQczrY9mEZvgN5pP9M1G8EN0OhFL2up4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Z5ZMV0EB; arc=none smtp.client-ip=209.85.128.49
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Z5ZMV0EB"
Received: by mail-wm1-f49.google.com with SMTP id 5b1f17b1804b1-4312484334eso65055e9.0
        for <linux-remoteproc@vger.kernel.org>; Fri, 11 Oct 2024 06:09:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1728652186; x=1729256986; darn=vger.kernel.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=v31GXG69vMHk4ux07CakUHVd4DKmezn/8McUHHPc5yQ=;
        b=Z5ZMV0EBIC9p7mIVw5hMeXKtcyl5bjDW6ISujvli8bCjRIrkZ++6raSPG8Zt0qsJOj
         tAaPSqdbPA1ePjOjOQZgERpTiGzjhO12+xn914UugGW9PtN//En6a+I9FvM7AvYEaq1u
         TboutNC8vAZGKHzU+Vo5UQHQJqBDPOKrcqR/dcYyhadIrznIAktEkKOwqm2+8vzjm595
         D59xeA6UsmTfCUZD9azo3iXkx22AqcBlXTQtZPeDGKf5TWOPSSr/skFYAN+IDwpAqfQ2
         BwDee2QdaB0EJvGc4/3BrrN+Y//LBQoXZZChUQiucXmre1Y1ExvsTPIiOoO9VGVmN6jP
         xGEA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1728652186; x=1729256986;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=v31GXG69vMHk4ux07CakUHVd4DKmezn/8McUHHPc5yQ=;
        b=cOo3bnwc924KUeBHNPqa1u/xKrMOFd3Kp6UlCKObcx7Tg4ypNf+Q3vs2udbZHoc5wZ
         cf8Ci8vzHvYssYOMi4xECLghEffztDPAXD3CcUa15XE0WQ2+HjLj3zkUPARK5FXSJIOj
         jhPIKqvr5tjdX7i3eSzw52q6KsPbA1K076N2g/2yQNk14tqnDl26mtN/MNVxIBIJO1/q
         bRinKovkcLYE6h9YTGSUikh66vWPbk2njPq+S8ZTctDCVrD7b49Iv9KbNVqF6PMsRjA4
         S0w+A8/xqQuBFiTe/afIxokegOhnFf3AT+zL8eLmsdvKchCg6gmLfrCMG4xgk4ErVGVj
         6BwQ==
X-Gm-Message-State: AOJu0Yy+QctJlRcXaJtOPkKlsvCrEl93YjAsAuXBJytbOIRLD7c0tCk3
	jUH7tSODegBzF7PNkTkwkVyD4reqH4gMefK02IYBJkZYuQIRJ5anglDiCfnaj9k=
X-Google-Smtp-Source: AGHT+IFJV0fBBqZyQIuuDztYZ99k87dRRpSQN2NCI/NjAAk0eHOZWEgeToj9dTo5YUpjSkp3esjnjA==
X-Received: by 2002:a05:600c:358f:b0:42c:bfd6:9d1f with SMTP id 5b1f17b1804b1-4311debbe68mr9904785e9.1.1728652186408;
        Fri, 11 Oct 2024 06:09:46 -0700 (PDT)
Received: from [127.0.1.1] ([178.197.211.167])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-431182ff6d3sm41621835e9.12.2024.10.11.06.09.44
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 11 Oct 2024 06:09:44 -0700 (PDT)
From: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Date: Fri, 11 Oct 2024 15:09:18 +0200
Subject: [PATCH 10/10] remoteproc: qcom_wcnss_iris: Simplify with
 dev_err_probe()
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241011-remote-proc-dev-err-probe-v1-10-5abb4fc61eca@linaro.org>
References: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
In-Reply-To: <20241011-remote-proc-dev-err-probe-v1-0-5abb4fc61eca@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>
Cc: linux-remoteproc@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-msm@vger.kernel.org, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=969;
 i=krzysztof.kozlowski@linaro.org; h=from:subject:message-id;
 bh=aiK48nBymVvo/dH/OUWaei0T3BtvhFeLUjzn+aJU3M8=;
 b=owEBbQKS/ZANAwAKAcE3ZuaGi4PXAcsmYgBnCSOHreCkDDMaYxg+FYD85uid+AJHsN2qlBqkX
 gfF0DvhUfCJAjMEAAEKAB0WIQTd0mIoPREbIztuuKjBN2bmhouD1wUCZwkjhwAKCRDBN2bmhouD
 18SCD/4xlZRL8UTPeW0P/qXuNj4U5/rZazAAwWCrbdb/JmJx1KmWWQapR5Ty9P3vU/UT9lKp+EK
 392NKtcByXR8vDiJtXv96LJwZWZV9Hl0+IVfDbngWC/W+IJT/07rXU5lVjo9+JeO0T143yU6GQ6
 J2C9HWbklt61TT4Yk9yEF4m966qdA3OZLhnbXOsL/1BU8ZKt6gqdbSwV2dajQp6MQ9xCb6YsMXr
 JnkOEIh2mqhUbd2gjgXCKFwtJi247kIizv5C7yaF/HExhnh4on/LjkfzMR4nititybGuPmRI0q7
 stsvmdbiqAnzmLlLDt/LWjY64yVEBtmGl90G32RyB2XToY1U921JW6rGJUo0ZSjhL138H9zL0xm
 +Nf90Wl8qEWdKvCy07axRt9Te2u1gRZ/Aof2b5cmw1GzFeVap4yL+wT6lkq3oHeVQRs2/SSin6j
 KQF+eTk5md7RZp4WOoKZvWJwAKEidYQLPBxdLks0eYdLzT1AY6vVx9HlX/B56m06ABKg17IqN9w
 gww58cvK3B5ntVmtVD8wZqVyL/03PbElXM1MoV3usWZniqETegyqNmDyK+nHWMPJ4r3pZAB+LzM
 LUiWbq3YbWr/ksKP75Kzo1I1O8TBqQ3XjOUoYxTVuVg5NWnI7NSirK5xtSwuGPmWWAAgPx6q9Md
 TOPVThfw/iiltiw==
X-Developer-Key: i=krzysztof.kozlowski@linaro.org; a=openpgp;
 fpr=9BD07E0E0C51F8D59677B7541B93437D3B41629B

Use dev_err_probe() to make error and defer code handling simpler.

Signed-off-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 drivers/remoteproc/qcom_wcnss_iris.c | 5 ++---
 1 file changed, 2 insertions(+), 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index dd36fd077911afec942f553a55128258c10ba946..b989718776bdb5843bd48b2d724bf1c483725bf3 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -155,9 +155,8 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 	iris->xo_clk = devm_clk_get(&iris->dev, "xo");
 	if (IS_ERR(iris->xo_clk)) {
-		ret = PTR_ERR(iris->xo_clk);
-		if (ret != -EPROBE_DEFER)
-			dev_err(&iris->dev, "failed to acquire xo clk\n");
+		ret = dev_err_probe(&iris->dev, PTR_ERR(iris->xo_clk),
+				    "failed to acquire xo clk\n");
 		goto err_device_del;
 	}
 

-- 
2.43.0

