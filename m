Received: from mail-ot1-f54.google.com (mail-ot1-f54.google.com [209.85.210.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A6B791FF5E3
	for <linux-remoteproc@vger.kernel.org>; Thu,  5 Mar 2026 00:33:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.210.54
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1772670812; cv=none; b=mVXpM730bSihOBcr+6/QzU59YBTTddLHzBb1Nzpwnsoajr0OSV7TC72eoaRfbUqKMf3uo0h7cbB+0/SKVrzbe/RKFst6xvvBsj+IqyEJp0a6z1GsrVjMpwSVFqlRlhg3rFvN1ubLe7Xon3XpHQ0kv+XbPMErEvyABJzZ67a7urk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1772670812; c=relaxed/simple;
	bh=hb/cStWwgMoJtjIPOyJ8b2rzoiwM6AlB0L8NcvGTri0=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=kBJHI4OXSS7gn8NfeTeIu4rNO65yfGNeYVLSi3/OSD2rx+lDYsHBKVT0xiBycj00J1ZMPUrsC26nqoCaD+V9JV9VryK4KlsUrShWUTh/FvJg4J5j2sIm7HJdNCeA4rafjeGhOFCOhi286LSKQkwUr3v0Cs9uIrpCHaYzQCujp5M=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=T0Mx2Vob; arc=none smtp.client-ip=209.85.210.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="T0Mx2Vob"
Received: by mail-ot1-f54.google.com with SMTP id 46e09a7af769-7d596a5be31so6463589a34.3
        for <linux-remoteproc@vger.kernel.org>; Wed, 04 Mar 2026 16:33:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1772670811; x=1773275611; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=dO6/PAcNzwOa7Dt8duIwo+5/9N6iahdFoKK7CawFXAQ=;
        b=T0Mx2Vob6byT31Az9zVHK1jy1n5BB9B5JYzve0iJCeAizL28vPWVHvXXrxN/izQtiz
         VxTwzkAHm+zVUHYL87jnylmnJHLH10agkiJ2A99Lkul7SAQ9TA4OqECnnjGLp+adF5Ch
         TavIbaskvs3sEIc8ECj62BU0wtOf7kLs8aZohTS4D3G8nAzIWe/Hv5SboxgfIXgpSOkD
         AeyQgg1JoPl1HENKi0YsvXcEdrHtO4PSXXK6Ryo4Gvbv3+pfauB88Fi00gx0c8M7hD7I
         qup2FoZLs5ZIibod8fkFpp4Nf3ny74+ctQ90PAe0zIvuHAFQemQ0CdGjKE2mM8qoCwfj
         dn4w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1772670811; x=1773275611;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=dO6/PAcNzwOa7Dt8duIwo+5/9N6iahdFoKK7CawFXAQ=;
        b=RDaWEsjsbzpUSJmPdxmfdSrVmDyxbBF5UJq8lxQBRAj7yBdtywNoPJ5KmflBdElScH
         xg+uUhcVHba3RlE3v69zqcDKfpLWj3IymjAp9YskYuTiMUrxdU69qweZJagivifUzJX3
         FHYXvaAPWOumlsvb5q1a3fe40Mwnkes6T5J6FlSbF/gabZ3l9UZuzCiPTfGnkDUt7BHb
         O9e3R2fZS1HPHUMf/HQF7jGkw962QDUsOVWMCJSyU2JSG9GQrFyXT6+HTMutzXVrXdbX
         Tx41Mt3vKDowo5iwp75+guTpKWy0KRPYY8IWVX48w0xQp7mmj7bSBvDI9CHsaUey0AkN
         qGuQ==
X-Forwarded-Encrypted: i=1; AJvYcCXwGHlh0SZJ1v7vAhMdz0HdFP/MTrwGffqFb449Jziof8JiaIwJ/mmIU6/A2VTd+772q5/b54F6f90DnIdMGYMm@vger.kernel.org
X-Gm-Message-State: AOJu0YwBL+m8SSqjtWJE/Rpc06e5vDGn37A0VTuc1SwW1xavcyTMtk0g
	Ag9sNnwNu1hz2XBLWQiuQgQMV4Kgf1Tzet0/JTuiLIBnH0Okf05CbZf6
X-Gm-Gg: ATEYQzwHvWn3Vw0Oj0HrUQlFqP+/QHOcJ10uzWsCg09bu7okeiNjFmZafHviN1EyH0o
	DnlqF8kq0r1h7dDb4UNRuOH8QIRKDWm8SkOJ/LRnAUdHz5e7B8fCMai6yEXM5RjGxwTiBdyo22s
	DfRNUGXZptD7PwlHB9Q/3ZygBNxZdKJZgORPc1KP+tKq3FQ2BA9TCFauWkUYuUpTYzD2iac0LN5
	945lSyUO93Jw3Z0WaeWYpqL7AjnnFr6+YRRc/stC1u0HeJvoxGDYbeRqt9xhg5v5kDUCsBcMi2p
	Af/NMukJMGXTNih2x0N8Lq/00DTMb7PYSdiTtUI/9JTkB7SlGkJIwtNkMt0XbSUNjakzhVLywH7
	m2WCkOKFwB4zrJyn0yh9bpIQVAofe+4Vk2mSjsdo3tg9CY7THbGd+bjV6IXihEplxB7MSMxBHzx
	rt4Wx8hlqSzKemfJV6u2onESwH1omdTORjypFX59HeiLBBdKEi6yKSXVdvXtlPftzTT+QUGGqrU
	VxZxjCs+2aR5XeQmB3Vqrpiloy31YRTA/eHjyQWeQ==
X-Received: by 2002:a05:6830:6185:b0:7c7:18e:913a with SMTP id 46e09a7af769-7d6d139f75dmr2154983a34.19.1772670810741;
        Wed, 04 Mar 2026 16:33:30 -0800 (PST)
Received: from framework.misc.iastate.edu ([2610:130:110:25d:2aa4:4aff:fed7:9b19])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-7d58644dd17sm16633834a34.5.2026.03.04.16.33.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 04 Mar 2026 16:33:29 -0800 (PST)
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
Subject: [PATCH v2 2/3] remoteproc: qcom_wcnss_iris: add support for WCN3610
Date: Wed,  4 Mar 2026 18:32:52 -0600
Message-ID: <20260305003253.1022386-3-kerigancreighton@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260305003253.1022386-1-kerigancreighton@gmail.com>
References: <20260305003253.1022386-1-kerigancreighton@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Add a qcom,wcn3610 compatible string.
The WCN3610 shares the same register configuration as the
WCN3620, so its configuration is being reused.

Signed-off-by: Kerigan Creighton <kerigancreighton@gmail.com>
Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
---
Changes in v2:
 - Move remoteproc compatible string addition to the middle of 
   the patch set.
 - Add Reviewed-by Dmitry (thanks!)
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

