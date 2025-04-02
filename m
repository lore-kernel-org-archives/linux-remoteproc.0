Received: from mail-wm1-f47.google.com (mail-wm1-f47.google.com [209.85.128.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0F115236426
	for <linux-remoteproc@vger.kernel.org>; Wed,  2 Apr 2025 10:59:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.47
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1743591598; cv=none; b=B5QyitgyOzD3+pzRYX4O8XQNqEsQtiSd1nmr+CYL+N5WD1Ch/gQe9JietVEOdi78r/pFT0+MH6h/PqwqXPHuHeE7iISKAXBdAy7ZnF7Sfpb+dP2y19rkmhcrGUQoavg18F3CPSB7NsQ2ksOfDKvcEgCL616erePrjlxFS5ztAtg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1743591598; c=relaxed/simple;
	bh=9yLicTejlhArWUH0AESaCnDBxMtBvX2kpvdlV6B/8A8=;
	h=Date:From:To:Cc:Subject:Message-ID:MIME-Version:Content-Type:
	 Content-Disposition; b=X3kwrNT9fJRH4EXm16Oql2FmXL/x1E3I3+9dOrr834cydC6SqrPCf/eQ10CETrLTn2XUlv8GgwoAYZFpFr91lZ2a4s1Kc3osO9LPQ0tA3iHux9KjuX4L6myz9ZvGttIvG7iJ5XJNydTsmQQzNXhDBBcIywvdD/kOj4VJEsKpZfg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org; spf=pass smtp.mailfrom=linaro.org; dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b=Iizv5asM; arc=none smtp.client-ip=209.85.128.47
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linaro.org
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linaro.org
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=linaro.org header.i=@linaro.org header.b="Iizv5asM"
Received: by mail-wm1-f47.google.com with SMTP id 5b1f17b1804b1-43cf06eabdaso62343195e9.2
        for <linux-remoteproc@vger.kernel.org>; Wed, 02 Apr 2025 03:59:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google; t=1743591594; x=1744196394; darn=vger.kernel.org;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=Iizv5asMiua2B/rjAMbI9R+nt0nkTUhtyFlelshY2Wc1P0HyQqOnqQzk+Mv/hyzObm
         Dc8jqEE89lm1+yJAAh1rfPd7s7zUhHqbMbljqbfqwxWmpIBhMszoHJ8BBd96HqE9aA0u
         Ai94zMpUf4M9K3Do1o1hM6ps3SX/sz9b4h2Gu+2X+SBVPTzyiYD38cd87+mCKp/LQpi/
         yuNqP+1DdQjILH0I3BOArl/Bsnu2OrWbBC0pMBejLPbb88zMn+j8dX+on6K4RgwJ41HT
         W92fHWDaTUae5NCiXX2h/wlVrYFSX05BU7GZaJpUxX+eBZWhW8gWZW5N1S0mHfRXbaqE
         7psw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1743591594; x=1744196394;
        h=content-disposition:mime-version:message-id:subject:cc:to:from:date
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=GTwEOtU7c1REAcQAM15r5ogMxhu3BYdLhsrAnf1aryQ=;
        b=qICpvME9gqGbsy8atQPgQtz0xiKf996ri3f/vyYberZVacRtBBRRmNCjLkVpdRBJMX
         uK6+nw3jj20JdIl07+mgXO8IuCW1VBLU/McKknFZy6XilzFfWmz//5V80FF5WkIqN/JP
         L4GnHVKQJPnrnBxorhWS7+MYBTMHqQh7zB40AbBBLrr35vKbTPdN4WJyWp2o/f4AYCjY
         R5ulOwJU0o0wSgUASCrrMcsAro2jQYkt6P8JNxqkgndnmxLOdslrWQguSxNQqCxPJCft
         rQipqlTpKGHxA41kU99Ao7JIDF/9hUzDIyrSPfRugjcjViv5lRyn6y6vcCssxVP5ljzP
         QFsQ==
X-Forwarded-Encrypted: i=1; AJvYcCU3n7HKCBewYWpVFcBiEpZPQl96hHULkBP9wTsBMxaOtdQhahknIgiChnxXQtUm2J1y7ROoVP6zd2sEbh5Pdjee@vger.kernel.org
X-Gm-Message-State: AOJu0YyenE5ibHa0hhpPtlLchgxZkn2KV7OThTEvWBSLUbsiQlns0N4k
	M0YP5jMC1Jq69wJm5kzvGH8aydJPhva7bdTSybUVGECozVfna8792n+SyKpLpwA=
X-Gm-Gg: ASbGnct4Fe55bL5Sq2Sao5pGbdnGfxxASPH0N9MMtRFk8xd/75FLW9T4k5AgZmCSvpt
	h13DikGo2G5AnGgEudWhvF7WncmqdF6q92hNRBQtSRji6HrqWgJedvTUZlUmwl0PpX/13jepPeu
	VOoWKqu5M8O31/feFlgnQZ/rbE7DYOuVwMK8bspnNzj7VVYLc3qFE5ixWXmZnhxhI/2rLylCdDR
	KT22mZHgyInNJ7Sp5+nbgDsac+bPQ3PPcZHRYNxlrmfR22UmUExS5dbhTOsRadIuyz45XLkn6M2
	Zss4UqIBJGv5OdifWH/bNDjdEw+xa9hwhHvff3ITfBNZPX28UA==
X-Google-Smtp-Source: AGHT+IGo7cTRo8kiQ/h++DgBA8RW5r2euHnxHw/uTOTKv4yUHsRawjSowGFkmPkzcA245vQdY6nlTQ==
X-Received: by 2002:a05:600c:46d1:b0:43c:f8fe:dd82 with SMTP id 5b1f17b1804b1-43db624aed9mr150397785e9.18.1743591594310;
        Wed, 02 Apr 2025 03:59:54 -0700 (PDT)
Received: from localhost ([196.207.164.177])
        by smtp.gmail.com with UTF8SMTPSA id 5b1f17b1804b1-43eb60d3627sm16842805e9.24.2025.04.02.03.59.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 02 Apr 2025 03:59:53 -0700 (PDT)
Date: Wed, 2 Apr 2025 13:59:51 +0300
From: Dan Carpenter <dan.carpenter@linaro.org>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Mathieu Poirier <mathieu.poirier@linaro.org>,
	linux-arm-msm@vger.kernel.org, linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org, kernel-janitors@vger.kernel.org
Subject: [PATCH] remoteproc: qcom_wcnss_iris: Add missing put_device() on
 error in probe
Message-ID: <4604f7e0-3217-4095-b28a-3ff8b5afad3a@stanley.mountain>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-Mailer: git-send-email haha only kidding

The device_del() call matches with the device_add() but we also need
to call put_device() to trigger the qcom_iris_release().

Fixes: 1fcef985c8bd ("remoteproc: qcom: wcnss: Fix race with iris probe")
Signed-off-by: Dan Carpenter <dan.carpenter@linaro.org>
---
This patch is based on static analysis and has not been tested.  Please
review carefully, etc.  Another option would be to call device_unregister()

 drivers/remoteproc/qcom_wcnss_iris.c | 2 ++
 1 file changed, 2 insertions(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index b989718776bd..2b52b403eb3f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -196,6 +196,7 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 
 err_device_del:
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 
 	return ERR_PTR(ret);
 }
@@ -203,4 +204,5 @@ struct qcom_iris *qcom_iris_probe(struct device *parent, bool *use_48mhz_xo)
 void qcom_iris_remove(struct qcom_iris *iris)
 {
 	device_del(&iris->dev);
+	put_device(&iris->dev);
 }
-- 
2.47.2

