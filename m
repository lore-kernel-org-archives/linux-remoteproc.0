Received: from mail-yw1-f176.google.com (mail-yw1-f176.google.com [209.85.128.176])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DFC8228BA83
	for <linux-remoteproc@vger.kernel.org>; Fri, 19 Dec 2025 04:34:45 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.128.176
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1766118887; cv=none; b=Ecwdd8xzpnSDATzG2Lx6PLfahojII/T2Vn19uaeHcZFmpfpQaNMFHWOOO3WcPo1dR3Flv6elK/MeguHDFxngXozrCM7pkOy8GvuOh3idTUoESyG5liG10KzoxhQOxIyRcS5JTm7lTknaoUtDL1Kxhr2dKy89eMqtmHr66gBl+qk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1766118887; c=relaxed/simple;
	bh=LH040kMlSc9Tz0ZMYO/8Rt5zp9Pc/ZcQVc5wppSmU6Y=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=sp6ciZDbZBHj1cgfOYKKI9Eme7QktYvJdZTlHaVabB/IpSWcdqd8/hKMYISnRbaZCH8Soeqz0pjnT8mM0nW8n+clkKmvpU6pm4JHcdKXhfohZZxUJkmFgZH09zjOeaxrgV0vdbxKlOIZl/+b+FeFt3ik7tZz4/jANOlPoS6AeGs=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=DCOuhc5e; arc=none smtp.client-ip=209.85.128.176
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="DCOuhc5e"
Received: by mail-yw1-f176.google.com with SMTP id 00721157ae682-78fb7ab7562so884307b3.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 18 Dec 2025 20:34:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766118885; x=1766723685; darn=vger.kernel.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=IjKFV3vm3fDXJL/hQ4ZjeG7tF9g/o1uEu4D2cLe1+fk=;
        b=DCOuhc5eIWy7z+OcVTf2NcMv5JrXlU9H81vGZPk2pyLC6XX7pDz5eGjHlAv07fcF7v
         mJP08A6IdyqkbjAcROSuziRJGTMkvLEocZcUVQGbFlZdxHkTExqk3bdO9ZLe1p3l6Wbp
         PIAwVfLmJrVzftYHlA2Ylf2n1qk09AFRVtDkszC8FKszD2bwJqHd9uUnCKJRSQ7x6VhE
         mYSkpsvjVraZww+WVQnQPNvuZSGH/ggOkwxlS/kM66aaSJlRHp1uQeC+Bxz7oX1hsRSB
         9yojNP+hItt7x4y7gIPdPau9CjNF9nyrumfOClKoJkWob13Tqu0cNcQ8ehcqFd9RhhtI
         ljoA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766118885; x=1766723685;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=IjKFV3vm3fDXJL/hQ4ZjeG7tF9g/o1uEu4D2cLe1+fk=;
        b=mjCCi6Vup0pKNft/U6gGJrVvU+b3qk3Gn5OTe5zlndcsAreEZpHIi80H/SGe9ANoRG
         Ookk3llvl29/shLE8Shc+p0laMjJeeNqGHOtAoTUCGzkUmmU4bT2ix69dBOVCm3PPdi7
         qdfzdWaSh6uI/uawSLMT3Gz5XpHex1ZBZ24JuR7naVtOb1Qguz41QE0xfYEWtgpz4ShK
         oMaTsFRMLrQav84HtDyhUYdZqtOg42E271+FVSVjOoS7r5hqzwHTcEx30agQvOIWular
         yrk5gEajK2EMDoK0qv3FBGln5VbckKoY5TcJcbCKuYO98zrG51QW0YGqJBIK6UF2+8bJ
         DdxQ==
X-Forwarded-Encrypted: i=1; AJvYcCWZXGbDt9cNldkm/mk4fL1mh7l/PkrnZV215gre5TL/ZoUHLDZBqiWNuJuTToBmcNETUluKN4rX/FEk9LYIeb5g@vger.kernel.org
X-Gm-Message-State: AOJu0YzbrKFSj3wo/c4nLdGPOL+oT0Hb+0OTrBUkRFgOOM19o++iKAon
	LhsLIoB4C07dfXbT8XgfA3ZOl1367uax1auGzjyQnl//D2AgO11PUZqh
X-Gm-Gg: AY/fxX67cFJ88n7GHCyUF2fN6Rr1JqQMMTMqScsDmOQHh+FAX40/PTTd9c/Wv+04Wzm
	4W1OpNERZKZkvzpcW7bPYN5KVoR58a9ISNP9lrxAsy6hqzFV5+eoQXAMyWldtccGmLx7AQs3Kjf
	eObyKfyh5RNT/hZX+ZkdHRtS0b9Y15rGj9vaAA7/z+UOFtcFjI8a5lnfyfGCCvv2f4PufJQsQHz
	uQ6/9N4bKMBc8iLrUx4gQ0vmUAnq4l0UuOwouoRWSMCg8BUy9KDK1jhmFZbi/jnAXyHjk+uKCJ/
	oc2OyCkACi0pbpAdxqyDoMi/XtMFPXr/6XA6UDipPQ6fan92vCkXwFJO5NttnIhhOt803z+tlnU
	3WL2P0/GMyD+2C0/eBdVG+W6x1WQCCz57n8ZhDL20q8w47P8hE+tgz5JAmmcdDYt6rE82woEkfs
	Ib9FlVbMDV6DzeJUEPwB1PsYCiVHc4P6zxF+37OinyREOsblWyPfi3wdcVgZfsMqo8ZWecKmzbY
	hXOKfZdWwblJ3Ybtk8gniofE6II
X-Google-Smtp-Source: AGHT+IHWnitQDtItHfIjJ8aEkoWNZUVggOZXYeBFC+7uSwle1Gq8Xk+mdTQzdegKqV74AkQXnbsdvQ==
X-Received: by 2002:a05:690c:7409:b0:78f:ac82:51e7 with SMTP id 00721157ae682-78fb403c2d2mr29887007b3.40.1766118884675;
        Thu, 18 Dec 2025 20:34:44 -0800 (PST)
Received: from nukework.lan (c-98-57-15-22.hsd1.tx.comcast.net. [98.57.15.22])
        by smtp.gmail.com with ESMTPSA id 00721157ae682-78fb452c441sm5610227b3.46.2025.12.18.20.34.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Dec 2025 20:34:43 -0800 (PST)
From: Alexandru Gagniuc <mr.nuke.me@gmail.com>
To: andersson@kernel.org,
	mathieu.poirier@linaro.org,
	krzk+dt@kernel.org,
	Gokul Sriram Palanisamy <quic_gokulsri@quicinc.com>,
	Govind Singh <govinds@codeaurora.org>
Cc: Alexandru Gagniuc <mr.nuke.me@gmail.com>,
	linux-arm-msm@vger.kernel.org,
	linux-remoteproc@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 8/9] remoteproc: qcom_q6v5_wcss: drop unused clocks from q6v5 struct
Date: Thu, 18 Dec 2025 22:34:16 -0600
Message-ID: <20251219043425.888585-8-mr.nuke.me@gmail.com>
X-Mailer: git-send-email 2.45.1
In-Reply-To: <20251219043425.888585-1-mr.nuke.me@gmail.com>
References: <20251219043425.888585-1-mr.nuke.me@gmail.com>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Three of the clocks from struct q6v5_wcss are not populated, and are
not used. Remove them.

Fixes: 0af65b9b915e ("remoteproc: qcom: wcss: Add non pas wcss Q6 support for QCS404")

Signed-off-by: Alexandru Gagniuc <mr.nuke.me@gmail.com>
---
 drivers/remoteproc/qcom_q6v5_wcss.c | 3 ---
 1 file changed, 3 deletions(-)

diff --git a/drivers/remoteproc/qcom_q6v5_wcss.c b/drivers/remoteproc/qcom_q6v5_wcss.c
index 265010c5c82cb..bcfd79b12fde9 100644
--- a/drivers/remoteproc/qcom_q6v5_wcss.c
+++ b/drivers/remoteproc/qcom_q6v5_wcss.c
@@ -133,10 +133,7 @@ struct q6v5_wcss {
 	struct clk *ahbs_cbcr;
 	struct clk *tcm_slave_cbcr;
 	struct clk *qdsp6ss_abhm_cbcr;
-	struct clk *qdsp6ss_sleep_cbcr;
 	struct clk *qdsp6ss_axim_cbcr;
-	struct clk *qdsp6ss_xo_cbcr;
-	struct clk *qdsp6ss_core_gfmux;
 	struct clk *lcc_bcr_sleep;
 	struct clk_bulk_data *clks;
 	/* clocks that must be started before the Q6 is booted */
-- 
2.45.1

