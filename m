Received: from mail-oi1-f176.google.com (mail-oi1-f176.google.com [209.85.167.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 048D12E62D9
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Mar 2026 00:43:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.167.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772757840; cv=none; b=KKykUY8pbhxXWQzFfUThQJujpvLwu+ddirI09XcbQjicJtudhINX+rhZVnH5H4k0tvLxu9vDgwv91ZwihWOxy1RbB1WD+hh0SiRzlm+g2nahc6RaqZdtyI2bralKUugxKWVhvKIK8Li6sl0pUeWtMLgG9O443tRAkWDPdLjbTUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772757840; c=relaxed/simple;
	bh=SlxNkWeYG2jC8F4dtE1l8oVL/VcZqLqk8x6VI232W0Q=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MIMuUMAO8EHcem2EfzuRZUPJHWheVHAF0ROG7qdDFkDkmtTdBXHtYMA2lYwnMQ1u7mzfkQvowTDjVCJ+kOdMk1fzLQMvlu3zsy2pHrg2Nr45WUKsfsjj/WzP1lSdU4CXMLG8xvLy4UQS6/sBYNzcGCiVJLCygakcn+N8Nt07fHc=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=TgKM4Ee1; arc=none smtp.client-ip=209.85.167.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="TgKM4Ee1"
Received: by mail-oi1-f176.google.com with SMTP id 5614622812f47-45f015a3259so3504082b6e.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Mar 2026 16:43:58 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772757838; x=1773362638; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MQ8acXeUu2flgK+dNZrWf/T7XYkkUKe2qrxt7AXt0W8=;
        b=TgKM4Ee1shtqjFqAYX/Tvu24mMHzHYWDHwbcUrxByCXE9jIUgDEiA3Tgo6dYq+ifCc
         WDCcVvSagAULwIIo9hsBP0NVU0erG7BKNDwtloqo9r3vL3TZ2O/9lLAqEb/y7COLWUmi
         4GBwj02/d+o9dHsssatWS2WO18AWoxkwndEN/6R8W6r7G3YY925j9OwIeP8XKTdhAV1t
         D9SXQubmL5WElie9VbBc2GGiYtUvs8EyxLyH516nIDfgb7u0CkfVeLVd+HGGlmSW3jJT
         3lA+Kwn2jp3ZATM9bKtGTX0TMSqr0QYmTJo8LXDdmeRE+g3yLYMQQMqtWW6lAxRjfe6c
         GBuw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772757838; x=1773362638;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=MQ8acXeUu2flgK+dNZrWf/T7XYkkUKe2qrxt7AXt0W8=;
        b=CcFJ18bCE0XxOYCcmfnbx9F59j0nuW/b+/u1/e4+ZljRRU7HJ3QJxzpsr8VF5V8P4p
         hffnsiSOiDlwZOfl6xxbsXkFGdOXnP+kOrOpnvUkeqKcXWYw3c15Nsieaken0xsTBzTa
         1bw6o8GOJKiiOgYcVhgshuukgkRkeFEGrK2s9lA22D63BpkDNB+qSo8Ges61tR768Ne6
         APB/K0w7DBd4XN3oer/tNFeQJAUvoT0+CZQoXu4hI1sSfsCvsuEs3gplZGyambY1rGrJ
         cen+TqZaPMXlq5slBbKhAzXJzDsYtr/XATaEBJmRtHEBrjc2l0Rz9P5tFEY9+awy1ASZ
         E93Q==
X-Forwarded-Encrypted: i=1; AJvYcCUzBE2SaB2tz9Hra9cqRi4wdAQ/gbUCNsIn8+ByyDJvGFElj2ie3BCcBp+WvWJ8PgAADAdf34OUG6O4OnOIfbjv@vger.kernel.org
X-Gm-Message-State: AOJu0YxXsHUCFzQRtNeZYocClEvFPTl7qJrQ9sqiliVP9MsehFEgyVPO
	Hmx2nAG2LhXYeiP+5mzvTYO4z9yJUTsOv8SUp4X8PwKLaKeh+4U5zaKJ
X-Gm-Gg: ATEYQzwy3sYaynQ5stbGU/J3glN/4rRyZ3JmrdGKJIDoJJBK3xY7JTOkTQ+5xjHXndO
	mzyB0QqUMIDp325y37tJ3RM1eJDbvLI5HYpY4Qca+nXwaWc9wI3Y10pP4E5X3RB6ClcIIZVNGjQ
	/LusNJK6IdNa8zGLARxprTRJxZlH2CPSYQP22VTFguN3vgMai9kXCJgcsA3sk4W9tC3dD6vG3e1
	SR73WKNWcUJBbgW6qxvHxEGj8SS3gMH6ajnNKqKNShEoLX3sgOYMUzHUvSZH3H0maDkAImkcJiA
	54E14VAwWQUeSoVJ6fwbmk0Zetc/Wd0dHiwYrBaZr9Ks+qvcensi2GRe2vbG5kNkoGHYszvnI5f
	vYfv/iiZ/DjvjihbHZI9GIqssuc0MLCBtuM+hSiljwTRF+XZt0ID7MDfdX716nWt2aYtU5BSZdL
	VBWjM5NJmKcsEUU5mSjptzdCKuNKQ79m3W0AtUD8DEyqXu7s2AxzNKomRLSX4vpSK6VhkoEWPCW
	iTrq222UO6H/T37i3v5fRVfDbJLrC73MZuhuwyjXA==
X-Received: by 2002:a05:6808:1a1b:b0:45f:1387:973b with SMTP id 5614622812f47-466dca7e5aamr210025b6e.6.1772757838015;
        Thu, 05 Mar 2026 16:43:58 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 586e51a60fabf-416e65b1c82sm69335fac.5.2026.03.05.16.43.56
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Mar 2026 16:43:57 -0800 (PST)
From: Kerigan Creighton <kerigancreighton@gmail.com>
To: linux-wireless@vger.kernel.org
Cc: loic.poulain@oss.qualcomm.com,
	wcn36xx@lists.infradead.org,
	andersson@kernel.org,
	mathieu.poirier@linaro.org,
	linux-remoteproc@vger.kernel.org,
	linux-arm-msm@vger.kernel.org,
	robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	Kerigan Creighton <kerigancreighton@gmail.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: [PATCH v3 2/3] remoteproc: qcom_wcnss_iris: Add support for WCN3610
Date: Thu,  5 Mar 2026 18:43:43 -0600
Message-ID: <20260306004344.10968-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260306004344.10968-1-kerigancreighton@gmail.com>
References: <20260306004344.10968-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

WCN3610 has the same regulator requirements as
WCN3620, so in qcom_wcnss_iris, we can use wcn3620_data.

A separate compatible is needed for WCN3610 because the
wcn36xx driver uses it for chip-specific configuration.
Specifically, it sets BTC (Bluetooth Coexistence) CFGs,
disables ENABLE_DYNAMIC_RA_START_RATE, and disables
STA_POWERSAVE for this specific chip for stable
functionality.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
 - Move remoteproc compatible string addition to the middle of
   the patch set.
 - Add Reviewed-by Dmitry (thanks!)

Changes in v3:
 - Describe why we need a new compatible in the remoteproc
   patch [Krzysztof].
---
 drivers/remoteproc/qcom_wcnss_iris.c | 1 +
 1 file changed, 1 insertion(+)

diff --git a/drivers/remoteproc/qcom_wcnss_iris.c b/drivers/remoteproc/qcom_wcnss_iris.c
index 2b89b4db6c..e58b59355f 100644
--- a/drivers/remoteproc/qcom_wcnss_iris.c
+++ b/drivers/remoteproc/qcom_wcnss_iris.c
@@ -95,6 +95,7 @@ void qcom_iris_disable(struct qcom_iris *iris)
 }
 
 static const struct of_device_id iris_of_match[] = {
+	{ .compatible = "qcom,wcn3610", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3620", .data = &wcn3620_data },
 	{ .compatible = "qcom,wcn3660", .data = &wcn3660_data },
 	{ .compatible = "qcom,wcn3660b", .data = &wcn3680_data },
-- 
2.53.0

